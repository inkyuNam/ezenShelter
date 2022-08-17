package com.ezen.p2.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.p2.dto.BoardVO;
import com.ezen.p2.service.BoardService;
import com.ezen.p2.util.Paging;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class BoardController {

	@Autowired
	BoardService bs;
	@Autowired
	ServletContext context;

	@RequestMapping(value="/board")
	public ModelAndView board(Model model,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		int page=1;	
		if( request.getParameter("page")!=null) {
			page = Integer.parseInt( request.getParameter("page") );
			session.setAttribute("page", page);
		}else if( session.getAttribute("page")!=null) {
			page = (Integer)session.getAttribute("page");
		}else {
			session.removeAttribute("page");
		}
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("ref_cursor", null);
		
		bs.boardList(hm,page);
		
		ArrayList< HashMap<String, Object> > list
		 = (ArrayList< HashMap<String, Object> >)hm.get("ref_cursor");
		
		mv.addObject("boardList",list);
		mv.addObject("paging", (Paging)hm.get("paging") );
		
		mv.setViewName("board/board");
		
		return mv;
	}
	
	@RequestMapping(value="/reviewWriteForm")
	public String reviewWriteForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null)
			return "/";
		else {	
		return "board/reviewWriteForm";
		}
	}
	
	@RequestMapping("/selectimg")
	public String selectimg() {
		return "board/selectimg";
	}
	
	@RequestMapping(value="/fileupload",method=RequestMethod.POST)
	public String fileupload(Model model, HttpServletRequest request) {
		String path = context.getRealPath("/upload");
		try {
			MultipartRequest multi = new MultipartRequest(
					request,path,5*1024*1024,"UTF-8",new DefaultFileRenamePolicy()
			);
			model.addAttribute("image",multi.getFilesystemName("image"));
		} catch (IOException e) {e.printStackTrace(); }
		return "board/completeupload";
	}
	
	@RequestMapping(value="/reviewWrite",method=RequestMethod.POST)
	public String reviewWrite(@ModelAttribute("dto")@Valid BoardVO boardvo,
			BindingResult result,Model model, HttpServletRequest request) {
		String url = "board/reviewWriteForm";
		if(result.getFieldError("title")!=null)
			model.addAttribute("msg",result.getFieldError("title").getDefaultMessage());
		else if(result.getFieldError("b_content")!=null)
			model.addAttribute("msg",result.getFieldError("b_content").getDefaultMessage());
		else if(result.getFieldError("b_image")!=null)
			model.addAttribute("msg",result.getFieldError("b_image").getDefaultMessage());
		else {
			bs.insertBoard(boardvo);
			url = "redirect:/board";
		}
		return url;
	}
	
	@RequestMapping(value="/reviewBoardDetail")
	public ModelAndView boardView(@RequestParam("num") int num, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		HashMap<String,Object> result = bs.boardView(num);
		
		mv.addObject("board",(BoardVO)result.get("board"));
		mv.setViewName("board/reviewBoardDetail");
		return mv;
	}
	
}
