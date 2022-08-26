package com.ezen.p2.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaVO {

	private int qa_num;
	private int qa_sel;
	private String id;
	private String qa_title;
	private String qa_content;
	private String result;
	private String answer;
	private Timestamp indate;
	
}
