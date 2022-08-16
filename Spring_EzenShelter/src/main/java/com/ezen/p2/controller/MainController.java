package com.ezen.p2.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class MainController {

	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	
	
	
}
