package com.ezen.p2.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.p2.dto.BoardVO;

@Mapper
public interface IBoardDao {

	public void boardGetAllCount(HashMap<String, Object> hm);

	public void boardList(HashMap<String, Object> hm);

	public void insertBoard(BoardVO boardvo);

	public void plusCountOne(int num);

	public BoardVO getBoardOne(int num);
		
	
}
