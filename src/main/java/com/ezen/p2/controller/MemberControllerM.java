package com.ezen.p2.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.p2.dto.MemberVO;
import com.ezen.p2.dto.MyPageVO;
import com.ezen.p2.service.MemberService;
import com.ezen.p2.util.Paging;

@Controller
public class MemberControllerM {

	@Autowired
	MemberService ms;
	
	@RequestMapping(value="/loginM",method=RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, MemberVO membervo) {
		String url = "main";
		MemberVO mvo = ms.getMember(membervo.getId());
		if(mvo==null)
			model.addAttribute("message","아이디가 없습니다.");
		else if(mvo.getPwd()==null)
			model.addAttribute("message","DB 오류, 관리자에게 문의하세요.");
		else if(!mvo.getPwd().equals(membervo.getPwd()))
			model.addAttribute("message","비밀번호가 맞지 않습니다.");
		else if(mvo.getPwd().equals(membervo.getPwd())) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mvo);
			String now = request.getHeader("referer");
			url = "redirect:" +now;
		}
		return url;
	}
	
	@RequestMapping(value="/logoutM",method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/mypageM")
	public ModelAndView mypage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("loginUser")==null)
			mav.setViewName("/");
		else {
			String id =mv.getId();
			
			int p = 1;
			int p2= 1;
			if(request.getParameter("page") != null) {
				
				p = Integer.parseInt(request.getParameter("page"));
			}
			if(request.getParameter("page2") !=null){
				
				p2 = Integer.parseInt(request.getParameter("page2"));
			}
			
			HashMap<String, Object> adoptList = ms.getadoptList(p, id);		//입양현황
			HashMap<String, Object> heartList = ms.getheartList(p2, id);	//찜현황
			
			mav.addObject("id",id);
			mav.addObject("adoptList",  (List<MyPageVO>)adoptList.get("adoptList"));	//입양현황
			mav.addObject("heartList",  (List<MyPageVO>)heartList.get("heartList"));	//찜현황
			
			mav.addObject("paging", ( Paging )adoptList.get("paging"));
			mav.addObject("paging2", ( Paging )heartList.get("paging2"));
			mav.setViewName("member/myPage");			
		}
		return mav;
	}
}
