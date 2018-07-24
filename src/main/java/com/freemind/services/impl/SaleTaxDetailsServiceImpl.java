package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.SaleTaxDetailsDao;
import com.freemind.model.SaleTaxDetails;
import com.freemind.services.SaleTaxDetailsService;


@Service("SaleTaxDetailsService")
public class SaleTaxDetailsServiceImpl implements SaleTaxDetailsService {

	@Autowired
	SaleTaxDetailsDao saleTaxDetailsDao;

	@Override
	public List<SaleTaxDetails> getAllSaleTaxDetailsList() {
		return saleTaxDetailsDao.getAllSaleTaxDetailsList();
	}

	@Override
	public SaleTaxDetails getSaleTaxDetailsById(int id) {
		return saleTaxDetailsDao.getSaleTaxDetailsById(id);
	}

	@Override
	public void save(SaleTaxDetails saleTaxDetails) {
		saleTaxDetailsDao.save(saleTaxDetails);
	}

	@Override
	public void update(SaleTaxDetails saleTaxDetails) {
		saleTaxDetailsDao.update(saleTaxDetails);
	}

	@Override
	public void deleteSaleTaxDetailsById(int id) {
		saleTaxDetailsDao.deleteSaleTaxDetailsById(id);
	}

}
