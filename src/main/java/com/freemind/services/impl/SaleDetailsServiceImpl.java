package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.SaleDetailsDao;
import com.freemind.model.SaleDetails;
import com.freemind.services.SaleDetailsService;


@Service("SaleDetailsService")
public class SaleDetailsServiceImpl implements SaleDetailsService {

	@Autowired
	SaleDetailsDao saleDetailsDao;

	@Override
	public List<SaleDetails> getAllSaleDetailsList() {
		return saleDetailsDao.getAllSaleDetailsList();
	}

	@Override
	public SaleDetails getSaleDetailsById(int id) {
		return saleDetailsDao.getSaleDetailsById(id);
	}

	@Override
	public void save(SaleDetails saleDetails) {
		saleDetailsDao.save(saleDetails);
	}

	@Override
	public void update(SaleDetails saleDetails) {
		saleDetailsDao.update(saleDetails);
	}

	@Override
	public void deleteSaleDetailsById(int id) {
		saleDetailsDao.deleteSaleDetailsById(id);
	}

}
