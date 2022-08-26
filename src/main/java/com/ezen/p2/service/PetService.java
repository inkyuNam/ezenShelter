package com.ezen.p2.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.p2.dao.IPetDao;
import com.ezen.p2.dto.HeartDto;
import com.ezen.p2.dto.PetDto;
import com.ezen.p2.util.Paging;

@Service
public class PetService {

	@Autowired
	IPetDao pdao;
	

		//펫리스트
		public HashMap<String, Object> getPetList(int page, int type1, int region) {
			HashMap<String, Object> result = new HashMap<String, Object>();
			
			//MainController에 있던 코드
			Paging paging = new Paging();
			paging.setPage(page);
			paging.setDisplayRow(9);
			paging.setDisplayPage(5);
			
			int count = pdao.getCount(region,type1);
			paging.setTotalCount(count);

			paging.paging();
			
			List<PetDto> list = pdao.getPetList(paging.getStartNum(),paging.getEndNum(),region,type1);
			
			
			result.put("paging", paging);
			result.put("petList" ,  list );
			
			return result;
		}



		//상세페이지
		public HashMap<String, Object> petDetail(int p_num) {
			HashMap<String, Object> result = new HashMap<String, Object>();
			
			PetDto pdto = pdao.getpetDetail(p_num);	//게시물 조회
			result.put("pet", pdto);
			return result;
		}



		public void addHeart(HeartDto hdto) {
			pdao.addHeart(hdto);
		}



		public void removeHeart(HeartDto hdto) {
			pdao.removeHeart(hdto);
			
		}



		public HeartDto getHeart(HeartDto hdto) {
			hdto = pdao.getHeart(hdto);
			return hdto;
		}



		public void getadoptInfo(HeartDto hdto, String consulting) {
			java.sql.Date day = java.sql.Date.valueOf(consulting);
			pdao.getadoptInfo(hdto,day);
		}



		public void updateState(int p_num, String state) {
			pdao.updateState(p_num,state);
		}




	

}
