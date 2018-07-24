package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.PurchaseDao;
import com.freemind.model.Purchase;
import com.freemind.services.PurchaseService;


@Service("PurchaseService")
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	PurchaseDao purchaseDao;

	@Override
	public List<Purchase> getAllPurchaseList() {
		return purchaseDao.getAllPurchaseList();
	}

	@Override
	public Purchase getPurchaseById(int id) {
		return purchaseDao.getPurchaseById(id);
	}

	@Override
	public void save(Purchase purchase) {
		purchaseDao.save(purchase);
	}

	@Override
	public void update(Purchase purchase) {
		purchaseDao.update(purchase);
	}

	@Override
	public void deletePurchaseById(int id) {
		purchaseDao.deletePurchaseById(id);
	}

}
