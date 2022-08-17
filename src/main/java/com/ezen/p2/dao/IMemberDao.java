package com.ezen.p2.dao;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.p2.dto.MemberVO;

@Mapper
public interface IMemberDao {

	public MemberVO getMember(String id);

}
