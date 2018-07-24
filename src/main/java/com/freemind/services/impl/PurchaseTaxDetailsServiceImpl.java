package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.PurchaseTaxDetailsDao;
import com.freemind.model.PurchaseTaxDetails;
import com.freemind.services.PurchaseTaxDetailsService;


@Service("PurchaseTaxDetailsService")
public class PurchaseTaxDetailsServiceImpl implements PurchaseTaxDetailsService {

	@Autowired
	PurchaseTaxDetailsDao purchaseTaxDetailsDao;

	@Override
	public List<PurchaseTaxDetails> getAllPurchaseTaxDetailsList() {
		return purchaseTaxDetailsDao.getAllPurchaseTaxDetailsList();
	}

	@Override
	public PurchaseTaxDetails getPurchaseTaxDetailsById(int id) {
		return purchaseTaxDetailsDao.getPurchaseTaxDetailsById(id);
	}

	@Override
	public void save(PurchaseTaxDetails purchaseTaxDetails) {
		purchaseTaxDetailsDao.save(purchaseTaxDetails);
	}

	@Override
	public void update(PurchaseTaxDetails purchaseTaxDetails) {
		purchaseTaxDetailsDao.update(purchaseTaxDetails);
	}

	@Override
	public void deletePurchaseTaxDetailsById(int id) {
		purchaseTaxDetailsDao.deletePurchaseTaxDetailsById(id);
	}

}
