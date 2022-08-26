package com.ezen.p2.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MainController {

	@RequestMapping("/")
	public String start() {
		return "start";
	}
	
	@RequestMapping("webmain")
	public String main() {
		return "main";
	}
	
	//회사소개
	@RequestMapping(value="/company")
	public String company() {
		return "company";
	}
	
}
