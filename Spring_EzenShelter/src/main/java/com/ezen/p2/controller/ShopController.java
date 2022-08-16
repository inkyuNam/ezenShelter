package com.ezen.p2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.p2.dto.ProductVO;
import com.ezen.p2.service.ShopService;

@Controller
public class ShopController {

	@Autowired
	ShopService ss;
	
	@RequestMapping("shoping")
	public ModelAndView shop (HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		List<ProductVO> hotlist = ss.getHotlist();
		
		mav.addObject("hotlist",hotlist);
		mav.setViewName("shop/shopmain");
		return mav;
 	}
	
	@RequestMapping("dogProductlist")
	public ModelAndView dogproductlist (HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		List<ProductVO> doglist = ss.getDogProductList();
		
		mav.addObject("doglist",doglist);
		mav.setViewName("shop/dogproductList");
		return mav;
 	}
	
	@RequestMapping("catProductlist")
	public ModelAndView catProductlist (HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		List<ProductVO> catlist = ss.getCatProductlist();
		
		mav.addObject("catlist",catlist);
		mav.setViewName("shop/catproductList");
		return mav;
 	}
	
	@RequestMapping("etcProductlist")
	public ModelAndView etcProductlist (HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		List<ProductVO> etclist = ss.getEtcProductlist();
		
		mav.addObject("etclist",etclist);
		mav.setViewName("shop/etcproductList");
		return mav;
 	}
	
	@RequestMapping("productDetail")
	public ModelAndView productDetail (@RequestParam("pseq")int pseq,
			HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		ProductVO pvo = ss.getProductOne(pseq);
		
		mav.addObject("pvo",pvo);
		mav.setViewName("shop/productDetail");
		return mav;
	}
	
	// 이제 장바구니 / 구매 / 찜하기 뭐 이런거 남은건가
	// 그러면 테이블 만들어서 데이터 조금 넣어보고 화면 대충 구성한다음에 표시되는지 확인하고
	// 그 다음에 장바구니쪽으로 넘어가면 될려나  --> 마이페이지랑 연동이 필요하니까 하기 전에 
	// 카톡으로 물어봐야겠군
	
	
	
	
	
}
