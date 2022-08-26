package com.ezen.p2.dto;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class HeartDto {
	
	private int num;
	private String id;
	private int p_num;
	private String tmp;
	private String reason;
	private Timestamp consulting;
	private Date notimedate;

}
