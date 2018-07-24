package com.freemind.dao;

import java.util.List;

import com.freemind.model.SaleTaxDetails;

public interface SaleTaxDetailsDao {
	public List<SaleTaxDetails> getAllSaleTaxDetailsList();

	public SaleTaxDetails getSaleTaxDetailsById(int id);

	public void save(SaleTaxDetails saleTaxDetails);

	public void update(SaleTaxDetails saleTaxDetails);

	public void deleteSaleTaxDetailsById(int id);

}
