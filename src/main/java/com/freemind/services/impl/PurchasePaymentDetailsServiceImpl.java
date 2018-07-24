package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.PurchasePaymentDetailsDao;
import com.freemind.model.PurchasePaymentDetails;
import com.freemind.services.PurchasePaymentDetailsService;

@Service("PurchasePaymentDetailsService")
public class PurchasePaymentDetailsServiceImpl implements
		PurchasePaymentDetailsService {

	@Autowired
	PurchasePaymentDetailsDao purchasePaymentDetailsDao;

	@Override
	public List<PurchasePaymentDetails> getAllPurchasePaymentDetailsList() {
		return purchasePaymentDetailsDao.getAllPurchasePaymentDetailsList();
	}

	@Override
	public PurchasePaymentDetails getPurchasePaymentDetailsById(int id) {
		return purchasePaymentDetailsDao.getPurchasePaymentDetailsById(id);
	}

	@Override
	public void save(PurchasePaymentDetails purchasePaymentDetails) {
		purchasePaymentDetailsDao.save(purchasePaymentDetails);
	}

	@Override
	public void update(PurchasePaymentDetails purchasePaymentDetails) {
		purchasePaymentDetailsDao.update(purchasePaymentDetails);
	}

	@Override
	public void deletePurchasePaymentDetailsById(int id) {
		purchasePaymentDetailsDao.deletePurchasePaymentDetailsById(id);
	}

}
