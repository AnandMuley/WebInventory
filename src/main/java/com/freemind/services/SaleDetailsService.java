package com.freemind.services;

import java.util.List;

import com.freemind.model.SaleDetails;

public interface SaleDetailsService {
	public List<SaleDetails> getAllSaleDetailsList();

	public SaleDetails getSaleDetailsById(int id);

	public void save(SaleDetails sale);

	public void update(SaleDetails sale);

	public void deleteSaleDetailsById(int id);

}
