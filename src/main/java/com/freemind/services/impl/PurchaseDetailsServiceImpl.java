package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.PurchaseDetailsDao;
import com.freemind.model.PurchaseDetails;
import com.freemind.services.PurchaseDetailsService;


@Service("PurchaseDetailsService")
public class PurchaseDetailsServiceImpl implements PurchaseDetailsService {

	@Autowired
	PurchaseDetailsDao purchaseDetailsDao;

	@Override
	public List<PurchaseDetails> getAllPurchaseDetailsList() {
		return purchaseDetailsDao.getAllPurchaseDetailsList();
	}

	@Override
	public PurchaseDetails getPurchaseDetailsById(int id) {
		return purchaseDetailsDao.getPurchaseDetailsById(id);
	}

	@Override
	public void save(PurchaseDetails purchaseDetails) {
		purchaseDetailsDao.save(purchaseDetails);
	}

	@Override
	public void update(PurchaseDetails purchaseDetails) {
		purchaseDetailsDao.update(purchaseDetails);
	}

	@Override
	public void deletePurchaseDetailsById(int id) {
		purchaseDetailsDao.deletePurchaseDetailsById(id);
	}

}
