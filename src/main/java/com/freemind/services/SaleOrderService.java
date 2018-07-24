package com.freemind.services;

import java.util.List;

import com.freemind.model.SaleOrder;

public interface SaleOrderService {
	public List<SaleOrder> getAllSaleOrderList();

	public SaleOrder getSaleOrderById(int id);

	public void save(SaleOrder saleOrder);

	public void update(SaleOrder saleOrder);

	public void deleteSaleOrderById(int id);

}
