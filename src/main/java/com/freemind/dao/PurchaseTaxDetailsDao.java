package com.freemind.dao;

import java.util.List;

import com.freemind.model.PurchaseTaxDetails;

public interface PurchaseTaxDetailsDao {
	public List<PurchaseTaxDetails> getAllPurchaseTaxDetailsList();

	public PurchaseTaxDetails getPurchaseTaxDetailsById(int id);

	public void save(PurchaseTaxDetails purchaseTaxDetails);

	public void update(PurchaseTaxDetails purchaseTaxDetails);

	public void deletePurchaseTaxDetailsById(int id);

}
