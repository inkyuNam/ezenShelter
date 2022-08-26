package com.ezen.p2.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.p2.dto.HelpVO;

import com.ezen.p2.dto.QnaVO;
import com.ezen.p2.dto.ShelterVO;

@Mapper
public interface IAdminDao {

	public List<HelpVO> getHelp_n();

	public List<QnaVO> getQna_n(int startNum,int endNum);

	public List<QnaVO> getQna_y(int startNum, int endNum);

	public List<HelpVO> getHelp_y(int startNum, int endNum);

//	public List<PetVO> getEtcPet();
//
//	public List<PetVO> getWaitPet();

	public List<ShelterVO> getShelter();
	
	public QnaVO getQnaOne(int num);

	public void insertQnaAnswer(HashMap<String, Object> hm);

	public int getCountQnaResultN();

	public int getCountQnaResultY();

	public HelpVO getAdminHelpOne(int num);

	public void helpEnd(int num);

	public void helpDel(int num);

	public int getCountHelpResultY();

}
