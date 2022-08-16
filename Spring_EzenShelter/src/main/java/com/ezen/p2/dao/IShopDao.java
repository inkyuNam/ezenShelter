package com.ezen.p2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.p2.dto.ProductVO;

@Mapper
public interface IShopDao {

	public List<ProductVO> getHotlist();

	public List<ProductVO> getDogProductList();

	public List<ProductVO> getCatProductlist();

	public List<ProductVO> getEtcProductlist();

	public ProductVO getProductOne(int pseq);

}
