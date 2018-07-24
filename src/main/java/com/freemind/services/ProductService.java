package com.freemind.services;

import java.util.List;

import com.freemind.model.Product;

public interface ProductService {
	public List<Product> getAllProductList();

	public Product getProductById(int id);

	public List<Product> getProductListByCatId(int id);

	public void save(Product product);

	public void update(Product product);

	public void deleteProductById(int id);
}
