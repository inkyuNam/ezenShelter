package com.ezen.p2.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.p2.dto.CartVO;
import com.ezen.p2.dto.MemberVO;
import com.ezen.p2.dto.ProductReviewVO;
import com.ezen.p2.dto.ProductVO;
import com.ezen.p2.service.ShopService;

@Controller
public class ShopController {

	@Autowired
	ShopService ss;
	
	@RequestMapping("shopping")
	public ModelAndView shop (HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		List<ProductVO> hotlist = ss.getHotlist();
		
		mav.addObject("hotlist",hotlist);
		mav.setViewName("shop/shopmain");
		return mav;
 	}
	
	@RequestMapping("Productlist")
	public ModelAndView dogproductlist (HttpServletRequest request, Model model,
			@RequestParam("kind") int kind) {
		
		ModelAndView mav = new ModelAndView();
		
		List<ProductVO> list = ss.getProductList(kind);
		
		mav.addObject("kind",kind);		//페이징에서 사용해야해서 다시 전송
		mav.addObject("list",list);
		mav.setViewName("shop/productList");
		return mav;
 	}
	
	@RequestMapping("productDetail")
	public ModelAndView productDetail (@RequestParam("pseq")int pseq,
			HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		ProductVO pvo = ss.getProductOne(pseq);
		List<ProductReviewVO> reviewlist = ss.getProductReview(pseq); 
		
		mav.addObject("pvo",pvo);
		mav.addObject("list",reviewlist);
		mav.setViewName("shop/productDetail");
		return mav;
	}
	
	
	@RequestMapping(value="gocart",method=RequestMethod.POST)
	public ModelAndView insertcart(@ModelAttribute("cvo")CartVO cartvo,
			HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser")==null) {
			mav.addObject("pseq",request.getParameter("pseq"));
			mav.setViewName("redirect:/productDetail");
		}else {
			ss.insertCart(cartvo);
			mav.setViewName("redirect:/cartlist");
		}
		return mav;
	}
	
	
	@RequestMapping("cartlist")
	public ModelAndView cartlist(HttpServletRequest request, Model model) {
	
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();		
		if(session.getAttribute("loginUser")==null) {
			mav.setViewName("main");
		}else {
			
			MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
			String id = mvo.getId();
			List<CartVO> list = ss.getCartList(id);
			System.out.println(list);
			mav.addObject("CartList",list);
			mav.setViewName("member/cart");
			
		}
		return mav;	
	}
	
	
	@RequestMapping("deleteCart")
	public String deleteCart(@RequestParam(value="checked") int[] cseq) {
		
		for(int i=0;i<cseq.length;i++) {
			ss.deleteCart(cseq[i]);
		}
		return "redirect:/cartlist";
	}
	
	
	@RequestMapping("goOrder")
	public ModelAndView goOrder(@RequestParam(value="checked") int[] cseq, 
			Model model,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();		
		if(session.getAttribute("loginUser")==null) {
			mav.setViewName("main");
		}else {
			
			MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
			ArrayList<CartVO> list = new ArrayList();
			int totalPrice = 0;
			for(int i=0;i<cseq.length;i++) { 
				list.add(ss.getCartOne(cseq[i]));
				totalPrice += list.get(i).getPrice2();
			}
			
			mav.addObject("cartlist",list);
			mav.addObject("member",mvo);
			mav.addObject("totalPrice",totalPrice);
			mav.setViewName("member/order");
		}
		return mav;
		
	}
	
	
	@RequestMapping("spell")
	public String addOrder(@RequestParam("cseq") int[] cseq, @RequestParam("name") String name,
			@RequestParam("phone") String phone, @RequestParam("address1") String address1, 
			@RequestParam("address2") String address2, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser")==null) {
			return "main";
		}else {
			
			MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
			String id = mvo.getId();
			
			ss.addOrder(id,name,phone,address1,address2,cseq);
			
			return "redirect:/mypageOrderView";
		}
	}
}
