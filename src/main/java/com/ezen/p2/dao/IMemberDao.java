package com.ezen.p2.dao;





import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ezen.p2.dto.HelpVO;
import com.ezen.p2.dto.MemberVO;
import com.ezen.p2.dto.MyPageVO;
import com.ezen.p2.dto.OrderVO;
import com.ezen.p2.dto.QnaVO;

@Mapper
public interface IMemberDao {

	public MemberVO getMember(String id);

	public void insertMember(MemberVO membervo);

	public void deleteMember(String id);

	public void updateMember(MemberVO membervo);

	public void qnaWrite(QnaVO qvo);

	public int getAllCount(Object id);

	public void getQnaList(HashMap<String, Object> hm);

	public QnaVO mypageQnaView(int num);

	public void insertHelp(HelpVO hvo);

	public List<MyPageVO> getadoptList(@Param("startNum")int startNum, @Param("endNum")int endNum, @Param("id")String id);
	
	public List<MyPageVO> getheartList(@Param("startNum")int startNum, @Param("endNum")int endNum, @Param("id")String id);

	public MyPageVO getDetail(int num);

	public void updateState(@Param("p_num")int p_num, @Param("state")String state);

	public void removeHeart(int num);
	
	public int getadoptCount(String id);

	public int getheartCount(String id);
	
	public List<Integer> getOrderOseqList(String id);

	public List<OrderVO> getOrderList(Integer oseq);

	public List<OrderVO> getOldOrderList(Integer oseq);

	public List<OrderVO> getOrderOneOseq(int oseq);

}
