package com.ezen.p2.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.p2.dto.HelpVO;
import com.ezen.p2.dto.QnaVO;
import com.ezen.p2.dto.ShelterVO;
import com.ezen.p2.service.AdminService;
import com.ezen.p2.util.Paging;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AdminController {

	@Autowired
	AdminService as;
	
	
	@RequestMapping("admin")
	public String admin() {
		return "admin/adminlogin";
	}
	
	
	@RequestMapping("adminmain")
	public ModelAndView adminmain(HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
//		if(session.getAttribute("Adminlogin")==null)
//			mav.setViewName("admin/adminlogin");
//		else {
		
			// 아직 뭘 가져가야할지 모르겠군
			int page = 1;
			List<HelpVO> h_list = as.getHelp_n();
			HashMap<String,Object> q_list = as.getQna_n(page);
			
			mav.addObject("help_n",h_list);
			mav.addObject("qna_n",(List<QnaVO>)q_list.get("list"));
			mav.setViewName("admin/admin_main");
//		}
		return mav;
	}
	
	
	@RequestMapping("adminHelplist")
	public ModelAndView adminhelp(HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
//		if(session.getAttribute("Adminlogin")==null)
//			mav.setViewName("admin/adminlogin");
//		else {
		int page=1;	
		if( request.getParameter("page")!=null) {
			page = Integer.parseInt( request.getParameter("page") );
			session.setAttribute("page", page);
		}else if( session.getAttribute("page")!=null) {
			page = (Integer)session.getAttribute("page");
		}else {
			session.removeAttribute("page");
		}
			
			List<HelpVO> h_list_n = as.getHelp_n();
			HashMap<String,Object> h_list_y = as.getHelp_y(page);
			
			mav.addObject("help_n",h_list_n);
			mav.addObject("help_y",(List<HelpVO>)h_list_y.get("list"));
			mav.addObject("paging", (Paging)h_list_y.get("paging"));
			mav.setViewName("admin/admin_helplist");
//		}
		return mav;
	}
	
	@RequestMapping("adminPetlist")
	public ModelAndView adminpetlist(HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
//		if(session.getAttribute("Adminlogin")==null)
//			mav.setViewName("admin/adminlogin");
//		else {
		
			
//			List<PetVO> waitlist = as.getWaitPet();
//			List<PetVO> etclist = as.getEtcPet();
//		
//			
//			mav.addObject("waitlist",waitlist);
//			mav.addObject("etclist",etclist);
			mav.setViewName("admin/admin_petList");
		
//		}
		return mav;
	}
	
	
	@RequestMapping("adminQnalist")
	public ModelAndView adminqnalist(HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
//		if(session.getAttribute("Adminlogin")==null)
//			mav.setViewName("admin/adminlogin");
//		else {
		int page=1;	
		if( request.getParameter("page")!=null) {
			page = Integer.parseInt( request.getParameter("page") );
			session.setAttribute("page", page);
		}else if( session.getAttribute("page")!=null) {
			page = (Integer)session.getAttribute("page");
		}else {
			session.removeAttribute("page");
		}
		int qnapage=1;	
		if( request.getParameter("qnapage")!=null) {
			page = Integer.parseInt( request.getParameter("qnapage") );
			session.setAttribute("qnapage", page);
		}else if( session.getAttribute("qnapage")!=null) {
			page = (Integer)session.getAttribute("qnapage");
		}else {
			session.removeAttribute("qnapage");
		}
			
		HashMap<String,Object> q_list_n = as.getQna_n(page);
		HashMap<String,Object> q_list_y = as.getQna_y(qnapage);
				
		mav.addObject("list_n",(List<QnaVO>)q_list_n.get("list"));
		mav.addObject("list_y",(List<QnaVO>)q_list_y.get("list"));
		mav.addObject("paging1", (Paging)q_list_n.get("paging"));
		mav.addObject("paging2", (Paging)q_list_y.get("paging"));
		mav.setViewName("admin/admin_qnalist");
		
//		}
		return mav;
	}
	
	
	@RequestMapping("adminShelter")
	public ModelAndView adminshelter(HttpServletRequest request, Model model) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
//		if(session.getAttribute("Adminlogin")==null)
//			mav.setViewName("admin/adminlogin");
//		else {
		
			List<ShelterVO> list = as.getShelter();
			
			mav.addObject("list",list);
			mav.setViewName("admin/shelter/admin_shelter");
		
			return mav;
	}
	
	
	@RequestMapping("newshelter")
	public String newshelter(HttpServletRequest request, Model model) {
		
		String url = "";
		HttpSession session = request.getSession();
//		if(session.getAttribute("Adminlogin")==null)
//			url = "admin/adminlogin";
//		else {
			url = "admin/shelter/newshelter";
			
		return url;
	}
	
	@RequestMapping("selectShelterImg")
	public String selectimg() {
		return "admin/shelter/selectimg";
	}
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="shelterimgupload",method=RequestMethod.POST)
	public String uploading(HttpServletRequest request, Model model) {
		
		String path = context.getRealPath("/shelter");		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy()
			);
			model.addAttribute("image", multi.getFilesystemName("image") );
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "admin/shelter/uploading";
		
	}
	
	@RequestMapping(value="/adminQnaDetail")
	public String adminQnaDetail(HttpServletRequest request,@RequestParam("qa_num") int num,Model model) {
//		if(session.getAttribute("Adminlogin")==null)
//		url = "admin/adminlogin";
//		else {		
		
		QnaVO qvo = as.getQnaOne(num);
		model.addAttribute("qvo", qvo);
		return "admin/adminQnaDetail";
	}
	
	@RequestMapping(value="/adminQnaAnswer")
	public ModelAndView adminQnaAnswer(HttpServletRequest request,
			@RequestParam("qa_num") int num,@RequestParam("answer") String answer) {		
		ModelAndView mv = new ModelAndView();
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("qnum", num);
		hm.put("answer", answer);
		System.out.println(answer);
		as.insertQnaAnswer(hm);
		mv.addObject("qa_num", num);
		mv.setViewName("redirect:/adminQnaDetail");
		return mv;
	}
	
	@RequestMapping(value="/adminHelpDetail")
	public String adminHelpDetail(HttpServletRequest request,@RequestParam("h_num") int num,Model model) {
//		if(session.getAttribute("Adminlogin")==null)
//		url = "admin/adminlogin";
//		else {			
		HelpVO hvo = as.getAdminHelpOne(num);
		model.addAttribute("hvo", hvo);
		return "admin/adminHelpDetail";
	}
	
	@RequestMapping(value="/help_end")
	public String help_end(@RequestParam("h_num")int num) {
		as.helpEnd(num);
		return "redirect:/adminHelplist";
	}
	
	@RequestMapping(value="/help_del")
	public String help_del(@RequestParam("h_num")int num) {
		as.helpDel(num);
		return "redirect:/adminHelplist";
	}
}
