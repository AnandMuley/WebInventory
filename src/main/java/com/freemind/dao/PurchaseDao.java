package com.freemind.dao;

import java.util.List;

import com.freemind.model.Purchase;

public interface PurchaseDao {
	public List<Purchase> getAllPurchaseList();

	public Purchase getPurchaseById(int id);

	public void save(Purchase purchase);

	public void update(Purchase purchase);

	public void deletePurchaseById(int id);

}
