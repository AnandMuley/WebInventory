package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.SalePaymentDetailsDao;
import com.freemind.model.SalePaymentDetails;
import com.freemind.services.SalePaymentDetailsService;

@Service("SalePaymentDetailsService")
public class SalePaymentDetailsServiceImpl implements
		SalePaymentDetailsService {

	@Autowired
	SalePaymentDetailsDao salePaymentDetailsDao;

	@Override
	public List<SalePaymentDetails> getAllSalePaymentDetailsList() {
		return salePaymentDetailsDao.getAllSalePaymentDetailsList();
	}

	@Override
	public SalePaymentDetails getSalePaymentDetailsById(int id) {
		return salePaymentDetailsDao.getSalePaymentDetailsById(id);
	}

	@Override
	public void save(SalePaymentDetails salePaymentDetails) {
		salePaymentDetailsDao.save(salePaymentDetails);
	}

	@Override
	public void update(SalePaymentDetails salePaymentDetails) {
		salePaymentDetailsDao.update(salePaymentDetails);
	}

	@Override
	public void deleteSalePaymentDetailsById(int id) {
		salePaymentDetailsDao.deleteSalePaymentDetailsById(id);
	}

}
