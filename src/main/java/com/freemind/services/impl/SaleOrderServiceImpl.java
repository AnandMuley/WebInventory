package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.SaleOrderDao;
import com.freemind.model.SaleOrder;
import com.freemind.services.SaleOrderService;


@Service("SaleOrderService")
public class SaleOrderServiceImpl implements SaleOrderService {

	@Autowired
	SaleOrderDao saleOrderDao;

	@Override
	public List<SaleOrder> getAllSaleOrderList() {
		return saleOrderDao.getAllSaleOrderList();
	}

	@Override
	public SaleOrder getSaleOrderById(int id) {
		return saleOrderDao.getSaleOrderById(id);
	}

	@Override
	public void save(SaleOrder saleOrder) {
		saleOrderDao.save(saleOrder);
	}

	@Override
	public void update(SaleOrder saleOrder) {
		saleOrderDao.update(saleOrder);
	}

	@Override
	public void deleteSaleOrderById(int id) {
		saleOrderDao.deleteSaleOrderById(id);
	}

}
