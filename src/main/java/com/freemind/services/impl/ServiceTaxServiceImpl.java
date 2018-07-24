package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.ServiceTaxDao;
import com.freemind.model.ServiceTax;
import com.freemind.services.ServiceTaxService;

@Service("ServiceTaxService")
public class ServiceTaxServiceImpl implements ServiceTaxService {

	@Autowired
	ServiceTaxDao serviceTaxDAO;
	
	@Override
	public List<ServiceTax> getAllServiceTaxList() {
		return serviceTaxDAO.getAllServiceTaxList();
	}

	@Override
	public ServiceTax getServiceTaxById(int id) {
		return serviceTaxDAO.getServiceTaxById(id);
	}

	@Override
	public void save(ServiceTax serviceTax) {
		serviceTaxDAO.save(serviceTax);
	}

	@Override
	public void update(ServiceTax serviceTax) {
		serviceTaxDAO.update(serviceTax);
	}

	@Override
	public void deleteServiceTaxById(int id) {
		serviceTaxDAO.deleteServiceTaxById(id);
	}

}
