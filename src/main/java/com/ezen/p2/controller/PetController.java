package com.ezen.p2.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.p2.dto.HeartDto;
import com.ezen.p2.dto.MemberVO;
import com.ezen.p2.dto.PetDto;
import com.ezen.p2.service.PetService;
import com.ezen.p2.util.Paging;

@Controller
public class PetController {

	@Autowired
	PetService ps;
	
	//입양절차
			@RequestMapping("adopt_procudure")
			public String adopt_procedure(HttpServletRequest request,Model model) {
				HttpSession session = request.getSession();
				return "adopt/adopt_procedure";
				
			}
			
			
			//펫 리스트
			@RequestMapping("/petList")
			public ModelAndView petList(HttpServletRequest request) {
				HttpSession session = request.getSession();
				
				ModelAndView mav = new ModelAndView();
				int region = 0; 	// 기본 (서울경기)
				int type1 = 2;  // 기본 타입 강아지
				
				int page = 1;
				if( request.getParameter("page")!=null) {
					page = Integer.parseInt( request.getParameter("page") );
					session.setAttribute("page", page);
				}else if( session.getAttribute("page") != null) {
					page = (Integer)session.getAttribute("page");
				}else {
					session.removeAttribute("page");
				}

				
				if(request.getParameter("region")!=null) {
					region = Integer.parseInt(request.getParameter("region"));
				}
				if(request.getParameter("type1")!=null) {
					type1 = Integer.parseInt(request.getParameter("type1"));
				}

				HashMap<String, Object> result = ps.getPetList(page, type1, region);
				
				mav.addObject("region",region);
				mav.addObject("type1",type1);
				//region과 type1은 따로!
				mav.addObject("petList", (List<PetDto>)result.get("petList") );
				mav.addObject("paging", ( Paging )result.get("paging") );
				mav.setViewName("adopt/petList");
				
				
				return mav;
			}
			
			
			
			//펫 디테일
			@RequestMapping("/petDetail")
			public ModelAndView petDetail( 
					@RequestParam("p_num") int p_num,  
					HttpServletRequest request) {
				// model에 담겨서 이동해야할 데이터 : 펫 번호로 조회한 게시물 내용
				ModelAndView mav = new ModelAndView();
				
				HttpSession session = request.getSession();
				MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
				if(mvo!=null) {
					HeartDto hdto = new HeartDto();
					hdto.setId(mvo.getId());
					hdto.setP_num(p_num);
					hdto = ps.getHeart(hdto);
					request.setAttribute("HeartDto", hdto);
				}
				
						
				HashMap<String, Object> result = ps.petDetail(p_num);
				mav.addObject(result);
				mav.addObject("pet",(PetDto)result.get("pet"));
				mav.setViewName("adopt/petDetail");	
				
				return mav;
			}
			
			
			
			//찜등록
			@RequestMapping("/addHeart")
			public String addHeart(@RequestParam("p_num")int p_num,HttpServletRequest request) {
				HttpSession session = request.getSession();
				MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
				HeartDto hdto = new HeartDto();
				hdto.setP_num(p_num);
		    	hdto.setId( mvo.getId() );
		    	
		    	ps.addHeart(hdto);
		    	
		    	return "redirect:/petDetail?p_num="+p_num;
				
			}
			
			
			
			//찜삭제
			@RequestMapping("/removeHeart")
			public String removeHeart(@RequestParam("p_num")int p_num,HttpServletRequest request){
				HttpSession session = request.getSession();
				MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
				HeartDto hdto = new HeartDto();
				hdto.setP_num(p_num);
		    	hdto.setId( mvo.getId() );
		    	
		    	ps.removeHeart(hdto);
		    	
		    	return "redirect:/petDetail?p_num="+p_num;
				
			}
			
			
			
			
			//입양신청
			@RequestMapping("/adopt_contract")
			public ModelAndView adopt_contract(HttpServletRequest request)
			{
				HttpSession session = request.getSession();
				request.setAttribute("p_num", request.getParameter("p_num"));
				ModelAndView mav = new ModelAndView();
				mav.setViewName("adopt/adopt_contract");
				
				return mav;
			}
			
			//입양신청 완료
			@RequestMapping("petpic")
			public String petpic(
					@RequestParam("p_num")int p_num,
					@RequestParam("reason")String reason,
					@RequestParam("consulting")String consulting,
					HttpServletRequest request)
			{
				HttpSession session = request.getSession();
				MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
				
				HeartDto hdto = new HeartDto();
				hdto.setId(mvo.getId());
				hdto.setP_num(p_num);
				hdto.setReason(reason);
				
				
				ps.getadoptInfo(hdto,consulting);
				ps.updateState(p_num,"c");
				
				
				return "redirect:/mypage";
			}
			
	
	
}
