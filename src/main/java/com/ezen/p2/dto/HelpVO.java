package com.ezen.p2.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class HelpVO {

	private int h_num;
	@NotEmpty(message="이름을 입력하세요.")
	@NotNull(message="이름을 입력하세요.")
	private String h_name;
	@NotEmpty(message="상세내용을 적어주세요.")
	@NotNull(message="상세내용을 적어주세요.")
	private String h_content;
	@NotEmpty(message="전화번호를 입력하세요.")
	@NotNull(message="전화번호를 입력하세요.")
	private String h_phone;
	private Timestamp writedate;
	private String result;
	
}
