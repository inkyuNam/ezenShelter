package com.ezen.p2.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class BoardVO {

	private int b_num;
	private String id;
	@NotEmpty(message="제목을 입력하세요.")
	@NotNull(message="제목을 입력하세요.")
	private String title;
	@NotEmpty(message="내용을 입력하세요.")
	@NotNull(message="내용을 입력하세요.")
	private String b_content;
	private Timestamp b_indate;
	@NotEmpty(message="이미지를 등록하세요.")
	@NotNull(message="이미지를 등록하세요.")
	private String b_image;
	private int b_count;
}
