package com.ezen.p2.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.p2.dao.IBoardDao;
import com.ezen.p2.dto.BoardVO;
import com.ezen.p2.dto.ReplyVO;
import com.ezen.p2.util.Paging;

@Service
public class BoardService {

	@Autowired
	IBoardDao bdao;

	public void boardList(HashMap<String, Object> hm,int page,String key,String kind) {
		Paging paging = new Paging();
		paging.setPage(page);		
		HashMap<String,Object> cntMap = new HashMap<String,Object>();		 
		cntMap.put("cnt", 0);
		cntMap.put("tableName", 1);
		cntMap.put("key", key);
		System.out.println("검색어 : "+key);
		System.out.println("검색종류 : " + kind);
		if (kind!=null) {
			switch(kind) {
			case "title":
				bdao.boardGetAllCount1(cntMap);
				break;
			case "content":
				bdao.boardGetAllCount2(cntMap);
				break;
			case "id":
				bdao.boardGetAllCount3(cntMap);
				break;
			}
		}
		if(kind.length()<1){
			bdao.boardGetAllCount( cntMap );
		}
		paging.setDisplayRow(6);
		paging.setDisplayPage(5);
		int count = Integer.parseInt(cntMap.get("cnt").toString());
		paging.setTotalCount(count);  
		paging.paging();	
		hm.put("startNum", paging.getStartNum() );
		hm.put("endNum", paging.getEndNum());
		if (kind!=null) {
			switch(kind) {
			case "title":
				bdao.boardList1(hm);
				break;
			case "content":
				bdao.boardList2(hm);
				break;
			case "id":
				bdao.boardList3(hm);
				break;
			}			
		}
		if(kind.length()<1){
			bdao.boardList(hm);
		}	
		hm.put("paging", paging);		
	}

	public void insertBoard(BoardVO boardvo) {
		bdao.insertBoard(boardvo);
		
	}

	public HashMap<String, Object> boardView(int num,int page) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Paging paging = new Paging();
		paging.setDisplayRow(5);
		paging.setDisplayPage(5);
		paging.setPage(page);
		int count = bdao.replyAllCount(num);
		paging.setTotalCount(count);
		paging.paging();	
		// 조회수 증가
		bdao.plusCountOne(num);
		// 게시물 조회
		BoardVO bvo = bdao.getBoardOne(num);
		// 댓글 조회
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		List<ReplyVO> list = bdao.getReply(num,startNum,endNum);
		
		
		result.put("paging", paging);
		result.put("board",bvo);
		result.put("replyList",list);
		return result;
	}

	public BoardVO getBoard(int num) {		
		return bdao.getBoardOne(num);
	}

	public void updateBoard(BoardVO boardvo) {
		bdao.updateBoard(boardvo);
		
	}

	public HashMap<String, Object> boardViewWithoutCount(int num,int page) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Paging paging = new Paging();
		paging.setDisplayRow(5);
		paging.setDisplayPage(5);
		paging.setPage(page);
		int count = bdao.replyAllCount(num);
		paging.setTotalCount(count);
		paging.paging();	
		// 게시물 조회
		BoardVO bvo = bdao.getBoardOne(num);
		// 댓글 조회
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		List<ReplyVO> list = bdao.getReply(num,startNum,endNum);
		
		
		result.put("paging", paging);
		result.put("board",bvo);
		result.put("replyList",list);
		return result;
	}

	public void insertReply(ReplyVO replyvo) {
		bdao.insertReply(replyvo);		
	}

	public void delReply(int r_num) {
		bdao.delReply(r_num);
	}

	public void deleteBoard(int num) {
		bdao.deleteBoard(num);
		
	}

	public void updateReply(HashMap<String, Object> result) {
		bdao.updateReply(result);
		
	}

	
	
	

}
