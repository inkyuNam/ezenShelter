package com.ezen.p2.service;

import java.util.HashMap;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.p2.dao.IBoardDao;
import com.ezen.p2.dto.BoardVO;
import com.ezen.p2.util.Paging;

@Service
public class BoardService {

	@Autowired
	IBoardDao bdao;

	public void boardList(HashMap<String, Object> hm,int page) {
		Paging paging = new Paging();
		paging.setPage(page);		
		HashMap<String,Object> cntMap = new HashMap<String,Object>();		 
		cntMap.put("cnt", 0);
		cntMap.put("tableName", 1);
		bdao.boardGetAllCount( cntMap );
		paging.setDisplayRow(6);
		paging.setDisplayPage(5);
		int count = Integer.parseInt(cntMap.get("cnt").toString());
		paging.setTotalCount(count);  
		paging.paging();	
		hm.put("startNum", paging.getStartNum() );
		hm.put("endNum", paging.getEndNum() );
		bdao.boardList(hm);
		hm.put("paging", paging);
		
	}

	public void insertBoard(BoardVO boardvo) {
		bdao.insertBoard(boardvo);
		
	}

	public HashMap<String, Object> boardView(int num) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		// 조회수 증가
		bdao.plusCountOne(num);
		// 게시물 조회
		BoardVO bvo = bdao.getBoardOne(num);

		
		result.put("board",bvo);

		return result;		
	}

	
	
	

}
