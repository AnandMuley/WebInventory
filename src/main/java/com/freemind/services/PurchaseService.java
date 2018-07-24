package com.freemind.services;

import java.util.List;

import com.freemind.model.Purchase;

public interface PurchaseService {
	public List<Purchase> getAllPurchaseList();

	public Purchase getPurchaseById(int id);

	public void save(Purchase purchase);

	public void update(Purchase purchase);

	public void deletePurchaseById(int id);

}
