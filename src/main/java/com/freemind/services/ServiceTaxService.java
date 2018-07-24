package com.freemind.services;

import java.util.List;

import com.freemind.model.ServiceTax;

public interface ServiceTaxService {
	public List<ServiceTax> getAllServiceTaxList();

	public ServiceTax getServiceTaxById(int id);

	public void save(ServiceTax serviceTax);

	public void update(ServiceTax serviceTax);

	public void deleteServiceTaxById(int id);

}
