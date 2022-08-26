package com.ezen.p2.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyVO {

	private int r_num;
	private Timestamp r_indate;
	private String r_content;
	private String id;
	private int b_num;
}
