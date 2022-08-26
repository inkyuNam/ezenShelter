package com.ezen.p2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainControllerM {

	@RequestMapping("mobilemain")
	public String main() {
		return "mainM";
	}
	
	//회사소개
		@RequestMapping(value="/CompanyM")
		public String company() {
			return "companyM";
		}
}
