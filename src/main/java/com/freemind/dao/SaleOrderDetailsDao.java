package com.freemind.dao;

import java.util.List;

import com.freemind.model.SaleOrderDetails;

public interface SaleOrderDetailsDao {
	public List<SaleOrderDetails> getAllSaleOrderDetailsList();

	public SaleOrderDetails getSaleOrderDetailsById(int id);

	public void save(SaleOrderDetails saleOrderDetails);

	public void update(SaleOrderDetails saleOrderDetails);

	public void deleteSaleOrderDetailsById(int id);

}
