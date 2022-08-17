package com.ezen.p2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.p2.dto.MemberVO;
import com.ezen.p2.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("/login")
	public String login(Model model, HttpServletRequest request, MemberVO membervo) {
		String url = "member/loginForm";
		MemberVO mvo = ms.getMember(membervo.getId());
		if(mvo==null)
			model.addAttribute("message","아이디가 없습니다.");
		else if(mvo.getPwd()==null)
			model.addAttribute("message","DB 오류, 관리자에게 문의하세요.");
		else if(!mvo.getPwd().equals(membervo.getPwd()))
			model.addAttribute("message","비밀번호가 맞지 않습니다.");
		else if(mvo.getPwd().equals(membervo.getPwd())) {
			System.out.println(membervo.getId());
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mvo);
			url = "redirect:/";
		}
		return url;
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
}
