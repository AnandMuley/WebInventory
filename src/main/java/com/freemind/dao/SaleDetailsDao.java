package com.freemind.dao;

import java.util.List;

import com.freemind.model.SaleDetails;

public interface SaleDetailsDao {
	public List<SaleDetails> getAllSaleDetailsList();

	public SaleDetails getSaleDetailsById(int id);

	public void save(SaleDetails sale);

	public void update(SaleDetails sale);

	public void deleteSaleDetailsById(int id);

}
