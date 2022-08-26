package com.ezen.p2.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ezen.p2.dto.HeartDto;
import com.ezen.p2.dto.PetDto;

@Mapper
public interface IPetDao {

	public int getAllCount();
	
	public PetDto getpetDetail(int p_num);
	
	public List<PetDto> getPetList(int StartNum, int EndNum, int region, int type1);
	
	public int getCount(int region, int type1);

	public void addHeart(HeartDto hdto);

	public void removeHeart(HeartDto hdto);

	public HeartDto getHeart(HeartDto hdto);

	public void getadoptInfo(@Param("hdto")HeartDto hdto, @Param("consulting")Date day);
	
	public void updateState(@Param("p_num")int p_num, @Param("state")String state);


	
}
