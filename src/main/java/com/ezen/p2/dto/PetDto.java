package com.ezen.p2.dto;

import lombok.Data;

@Data
public class PetDto {
	
	private int p_num;
	private int s_num;
	private int region;	//새로 추가
	private int type1;
	private String type2;
	private String p_name;
	private String p_gender;
	private String age;
	private String ntr;
	private String p_image;
	private String state;
	private String content;
	private String enjoy;	//새로 추가
	private String dislike;	//새로 추가

}
