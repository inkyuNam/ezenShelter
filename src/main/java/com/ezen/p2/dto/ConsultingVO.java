package com.ezen.p2.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ConsultingVO {

	private String id;
	private String m_name;
	private String p_image;
	private String p_name;
	private int p_num;
	private String type2;
	private String state;
	private String address1;
	private String s_name;
	private Timestamp consulting;
	private String reason;
	private String tmp;
	private Date notimedate;
	private int num;			//heart테이블 num
	
}
