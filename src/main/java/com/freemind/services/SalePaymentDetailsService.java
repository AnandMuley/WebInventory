package com.freemind.services;

import java.util.List;

import com.freemind.model.SalePaymentDetails;

public interface SalePaymentDetailsService {
	public List<SalePaymentDetails> getAllSalePaymentDetailsList();

	public SalePaymentDetails getSalePaymentDetailsById(int id);

	public void save(SalePaymentDetails salePaymentDetails);

	public void update(SalePaymentDetails salePaymentDetails);

	public void deleteSalePaymentDetailsById(int id);

}
