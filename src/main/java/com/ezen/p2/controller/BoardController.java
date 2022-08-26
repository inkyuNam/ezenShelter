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
import com.ezen.p2.dto.ReplyVO;
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
		
		String key = "";
		if(request.getParameter("key")!=null) {
			key = request.getParameter("key");
			session.setAttribute("key", key);
		}else if(session.getAttribute("key")!=null) {
			key = (String)session.getAttribute("key");
		}else {
			session.removeAttribute("key");
		}
		
		String kind = "";		
		if(request.getParameter("searchKind")!=null) {
			kind = request.getParameter("searchKind");
			session.setAttribute("searchKind", kind);
		}else if(session.getAttribute("searchKind")!=null) {
			kind = (String)session.getAttribute("searchKind");
		}else {
			session.removeAttribute("kind");
		}
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("kind", kind);
		hm.put("key",key);
		hm.put("ref_cursor", null);
		
		bs.boardList(hm,page,key,kind);
		
		ArrayList< HashMap<String, Object> > list
		 = (ArrayList< HashMap<String, Object> >)hm.get("ref_cursor");
		
		mv.addObject("kind",kind);
		mv.addObject("boardList",list);
		mv.addObject("paging", (Paging)hm.get("paging"));
		mv.addObject("key",key);
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
		String path = context.getRealPath("/images");
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
		
		HashMap<String,Object> result = bs.boardView(num,page);
		
		List<ReplyVO> list = (List<ReplyVO>)result.get("replyList");
		ArrayList<Integer> rlist = new ArrayList(); 
		for(int i=0;i<list.size();i++) {
			rlist.add(list.get(i).getR_num());
		}
		
		
		
		mv.addObject("paging",(Paging)result.get("paging"));
		mv.addObject("rlist",rlist);
		mv.addObject("board",(BoardVO)result.get("board"));
		mv.addObject("replyList",(List<ReplyVO>)result.get("replyList"));
		mv.setViewName("board/reviewBoardDetail");
		return mv;
	}
	
	@RequestMapping(value="/reviewModifyForm")
	public String reviewModifyForm(Model model, HttpServletRequest request, @RequestParam("b_num")int num) {
		HttpSession session = request.getSession();
		String url = "/";
		if(session.getAttribute("loginUser")==null)
			return url;
		else {				
			BoardVO bvo = bs.getBoard(num);
			model.addAttribute("board",bvo);
			model.addAttribute("b_num",num);
			url = "board/reviewModifyForm";
		}
		return url;
	}
	
	@RequestMapping(value="/reviewModify",method=RequestMethod.POST)
	public String boardUpdate(@ModelAttribute("dto")@Valid BoardVO boardvo,
			BindingResult result,
			@RequestParam("oldfilename")String oldfilename,
			HttpServletRequest request, Model model) {		
		if(boardvo.getB_image()==null||boardvo.getB_image().equals(""))
			boardvo.setB_image(oldfilename);
		bs.updateBoard(boardvo);
		return "redirect:/boardViewWithoutCount?b_num=" + boardvo.getB_num();		
		}

	@RequestMapping(value="/boardViewWithoutCount")
	public ModelAndView boardViewWithoutCount(HttpServletRequest request,@RequestParam("b_num") int num) {
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
			
			HashMap<String,Object> result = bs.boardViewWithoutCount(num,page);				
		
			List<ReplyVO> list = (List<ReplyVO>)result.get("replyList");
			ArrayList<Integer> rlist = new ArrayList(); 
			for(int i=0;i<list.size();i++) {
				rlist.add(list.get(i).getR_num());
			}		
			mv.addObject("rlist",rlist);
			mv.addObject("board",(BoardVO)result.get("board"));
			mv.addObject("paging",(Paging)result.get("paging"));
			mv.addObject("replyList",(List<ReplyVO>)result.get("replyList"));
			mv.setViewName("board/reviewBoardDetail");
		
		return mv;		
	}

	
	@RequestMapping(value="/addReply",method=RequestMethod.POST)
	public String addReply(@RequestParam("b_num")int num, ReplyVO replyvo) {
		bs.insertReply(replyvo);
		return "redirect:/boardViewWithoutCount?b_num="+num;
	}
	
	@RequestMapping(value="/delReply")
	public String delReply(@RequestParam("b_num")int b_num,@RequestParam("r_num")int r_num) {
		bs.delReply(r_num);
		return "redirect:/boardViewWithoutCount?b_num="+b_num;
	}
	
	@RequestMapping(value="/reviewDelete")
	public String reviewDelete(@RequestParam("b_num") int num) {
		bs.deleteBoard(num);
		return "redirect:/board";
	}
	
	@RequestMapping(value="/updateReply")
	public String updateReply(@RequestParam("b_num") int b_num,@RequestParam("r_num") int r_num,
			@RequestParam("nContent") String r_content) {
		HashMap<String,Object> result = new HashMap<String,Object>();
		result.put("r_num", r_num);
		result.put("content", r_content);
		bs.updateReply(result);
		
		return "redirect:/boardViewWithoutCount?b_num="+b_num;
	}
	

	
}
