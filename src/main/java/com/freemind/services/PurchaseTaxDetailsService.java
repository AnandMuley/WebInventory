package com.freemind.services;

import java.util.List;

import com.freemind.model.PurchaseTaxDetails;

public interface PurchaseTaxDetailsService {
	public List<PurchaseTaxDetails> getAllPurchaseTaxDetailsList();

	public PurchaseTaxDetails getPurchaseTaxDetailsById(int id);

	public void save(PurchaseTaxDetails purchaseTaxDetails);

	public void update(PurchaseTaxDetails purchaseTaxDetails);

	public void deletePurchaseTaxDetailsById(int id);

}
