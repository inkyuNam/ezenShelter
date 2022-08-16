package com.ezen.p2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.p2.dao.IShopDao;
import com.ezen.p2.dto.ProductVO;

@Service
public class ShopService {

	@Autowired
	IShopDao sdao;

	public List<ProductVO> getHotlist() {
		return sdao.getHotlist();
	}

	public List<ProductVO> getDogProductList() {
		return sdao.getDogProductList();
	}

	public List<ProductVO> getCatProductlist() {
		return sdao.getCatProductlist();
	}
	
	public List<ProductVO> getEtcProductlist() {
		return sdao.getEtcProductlist();
	}

	public ProductVO getProductOne(int pseq) {
		return sdao.getProductOne(pseq);
	}
}
