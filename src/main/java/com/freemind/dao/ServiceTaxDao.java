package com.freemind.dao;

import java.util.List;

import com.freemind.model.ServiceTax;

public interface ServiceTaxDao {
	public List<ServiceTax> getAllServiceTaxList();

	public ServiceTax getServiceTaxById(int id);

	public void save(ServiceTax serviceTax);

	public void update(ServiceTax serviceTax);

	public void deleteServiceTaxById(int id);

}
