package com.ezen.p2.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductReviewVO {

	private int prseq;
	private int pseq;
	private String id;
	private String content;
	private Date indate;
}
