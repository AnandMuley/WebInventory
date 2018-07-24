package com.freemind.dao;

import java.util.List;

import com.freemind.model.PurchaseDetails;

public interface PurchaseDetailsDao {
	public List<PurchaseDetails> getAllPurchaseDetailsList();

	public PurchaseDetails getPurchaseDetailsById(int id);

	public void save(PurchaseDetails purchase);

	public void update(PurchaseDetails purchase);

	public void deletePurchaseDetailsById(int id);

}
