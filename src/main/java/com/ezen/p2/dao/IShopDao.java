package com.ezen.p2.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.p2.dto.CartVO;
import com.ezen.p2.dto.ProductReviewVO;
import com.ezen.p2.dto.ProductVO;

@Mapper
public interface IShopDao {

	public List<ProductVO> getHotlist();

	public List<ProductVO> getProductList(int kind);

	public ProductVO getProductOne(int pseq);

	public List<ProductReviewVO> getProductReview(int pseq);

	public void insertCart(CartVO cartvo);

	public List<CartVO> getCartList(String id);

	public void deleteCart(int cseq);

	public CartVO getCartOne(int cseq);

	public void addOrder(String id, String name, String phone, String address1, String address2);

	public void addOrderDetail(String id, int cseq);
	
}
