package com.ezen.p2.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.p2.dao.IAdminDao;
import com.ezen.p2.dto.HelpVO;
import com.ezen.p2.dto.QnaVO;
import com.ezen.p2.dto.ShelterVO;
import com.ezen.p2.util.Paging;

@Service
public class AdminService {

	@Autowired
	IAdminDao adao;

	public List<HelpVO> getHelp_n() {
		return adao.getHelp_n();
	}

	public HashMap<String, Object> getQna_n(int page) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Paging paging = new Paging();
		paging.setPage(page);
		int count = adao.getCountQnaResultN();
		paging.setTotalCount(count);
		paging.paging();
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		List<QnaVO> list = adao.getQna_n(startNum,endNum);
		result.put("list", list);
		result.put("paging", paging);
		return result;
	}

	public HashMap<String, Object> getHelp_y(int page) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Paging paging = new Paging();
		paging.setPage(page);
		int count = adao.getCountHelpResultY();
		paging.setTotalCount(count);
		paging.paging();
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();		
		List<HelpVO> list = adao.getHelp_y(startNum,endNum);
		result.put("list", list);
		result.put("paging", paging);
		return result;
	}

	public HashMap<String, Object> getQna_y(int page) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Paging paging = new Paging();
		paging.setPage(page);
		int count = adao.getCountQnaResultY();
		paging.setTotalCount(count);
		paging.paging();
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		List<QnaVO> list = adao.getQna_y(startNum,endNum);
		result.put("list", list);
		result.put("paging", paging);
		return result;
	}

//	public List<PetVO> getWaitPet() {
//		return adao.getWaitPet();
//	}
//
//	public List<PetVO> getEtcPet() {
//		return adao.getEtcPet();
//	}

	public List<ShelterVO> getShelter() {
		return adao.getShelter();
	}
	
	public QnaVO getQnaOne(int num) {
		return adao.getQnaOne(num);
	}

	public void insertQnaAnswer(HashMap<String, Object> hm) {
		adao.insertQnaAnswer(hm);
		
	}

	public HelpVO getAdminHelpOne(int num) {
		return adao.getAdminHelpOne(num);
		
	}

	public void helpEnd(int num) {
		adao.helpEnd(num);
		
	}

	public void helpDel(int num) {
		adao.helpDel(num);
		
	}
}
