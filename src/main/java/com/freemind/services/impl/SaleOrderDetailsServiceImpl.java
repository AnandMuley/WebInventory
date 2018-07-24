package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.SaleOrderDetailsDao;
import com.freemind.model.SaleOrderDetails;
import com.freemind.services.SaleOrderDetailsService;

@Service("SaleOrderDetailsService")
public class SaleOrderDetailsServiceImpl implements SaleOrderDetailsService {

	@Autowired
	SaleOrderDetailsDao saleOrderDetailsDao;

	@Override
	public List<SaleOrderDetails> getAllSaleOrderDetailsList() {
		return saleOrderDetailsDao.getAllSaleOrderDetailsList();
	}

	@Override
	public SaleOrderDetails getSaleOrderDetailsById(int id) {
		return saleOrderDetailsDao.getSaleOrderDetailsById(id);
	}

	@Override
	public void save(SaleOrderDetails saleOrderDetails) {
		saleOrderDetailsDao.save(saleOrderDetails);
	}

	@Override
	public void update(SaleOrderDetails saleOrderDetails) {
		saleOrderDetailsDao.update(saleOrderDetails);
	}

	@Override
	public void deleteSaleOrderDetailsById(int id) {
		saleOrderDetailsDao.deleteSaleOrderDetailsById(id);
	}

}
