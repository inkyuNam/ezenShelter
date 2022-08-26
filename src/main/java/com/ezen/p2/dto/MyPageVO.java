package com.ezen.p2.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyPageVO {
	Timestamp consulting;
	String p_name;
	int p_num;
	String p_image;
	String id;
	String state;
	String tmp;
	int num;

}
