package com.ezen.p2.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.p2.dao.IShopDao;
import com.ezen.p2.dto.CartVO;
import com.ezen.p2.dto.ProductReviewVO;
import com.ezen.p2.dto.ProductVO;

@Service
public class ShopService {

	@Autowired
	IShopDao sdao;

	public List<ProductVO> getHotlist() {
		return sdao.getHotlist();
	}

	public List<ProductVO> getProductList(int kind) {
		return sdao.getProductList(kind);
	}

	public ProductVO getProductOne(int pseq) {
		return sdao.getProductOne(pseq);
	}

	public List<ProductReviewVO> getProductReview(int pseq) {
		return sdao.getProductReview(pseq);
	}

	public void insertCart(CartVO cartvo) {
		sdao.insertCart(cartvo);
	}

	public List<CartVO> getCartList(String id) {
		return sdao.getCartList(id);
	}

	public void deleteCart(int cseq) {
		sdao.deleteCart(cseq);
	}

	public CartVO getCartOne(int cseq) {
		return sdao.getCartOne(cseq);
	}

	public void addOrder(String id, String name, String phone, String address1, String address2, int[] cseq) {
		sdao.addOrder(id,name,phone,address1,address2);
		for(int i=0;i<cseq.length;i++)
			sdao.addOrderDetail(id, cseq[i]);
		
	}
}
