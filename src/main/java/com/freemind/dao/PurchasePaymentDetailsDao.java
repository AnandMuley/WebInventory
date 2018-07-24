package com.freemind.dao;

import java.util.List;

import com.freemind.model.PurchasePaymentDetails;

public interface PurchasePaymentDetailsDao {
	public List<PurchasePaymentDetails> getAllPurchasePaymentDetailsList();

	public PurchasePaymentDetails getPurchasePaymentDetailsById(int id);

	public void save(PurchasePaymentDetails purchasePaymentDetails);

	public void update(PurchasePaymentDetails purchasePaymentDetails);

	public void deletePurchasePaymentDetailsById(int id);

}
