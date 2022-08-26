package com.ezen.p2.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class ProductVO {

	private int pseq;
	@NotNull(message="name is null")
	@NotEmpty(message="name is Empty")
    private String name;
	@NotNull(message="stock is null")
	@NotEmpty(message="stock is Empty")
    private int stock;
	@NotNull(message="kind is null")
	@NotEmpty(message="kind is Empty")
    private String kind;
	@NotNull(message="price1 is null")
	@NotEmpty(message="price1 is Empty")
    private int price1;
	@NotNull(message="price2 is null")
	@NotEmpty(message="price2 is Empty")
    private int price2;
    private int price3;
    private String content;
    private String image;
    private String useyn;
	
}
