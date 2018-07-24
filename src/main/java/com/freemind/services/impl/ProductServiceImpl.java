package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.ProductDao;
import com.freemind.model.Product;
import com.freemind.services.ProductService;

@Service("ProductService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;

	@Override
	public List<Product> getAllProductList() {
		return productDao.getAllProductList();		
	}

	@Override
	public Product getProductById(int id) {
		return productDao.getProductById(id);
	}
	@Override
	public List<Product> getProductListByCatId(int id){
		return productDao.getProductListByCatId(id);
	}

	@Override
	public void save(Product product) {
		productDao.save(product);
	}

	@Override
	public void update(Product product) {
		productDao.update(product);
	}

	@Override
	public void deleteProductById(int id) {
		productDao.deleteProductById(id);
	}

}
