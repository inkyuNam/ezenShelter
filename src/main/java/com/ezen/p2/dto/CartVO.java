package com.ezen.p2.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {

	private int cseq;
	private String id;
	private String mname;
	private int pseq;
	private int quantity;
	private String result;
	private String image;
	private int stock;
	private String pname;
	private int price2;
	private Date indate;
}
