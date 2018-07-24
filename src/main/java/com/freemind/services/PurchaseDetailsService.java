package com.freemind.services;

import java.util.List;

import com.freemind.model.PurchaseDetails;

public interface PurchaseDetailsService {
	public List<PurchaseDetails> getAllPurchaseDetailsList();

	public PurchaseDetails getPurchaseDetailsById(int id);

	public void save(PurchaseDetails purchase);

	public void update(PurchaseDetails purchase);

	public void deletePurchaseDetailsById(int id);

}
