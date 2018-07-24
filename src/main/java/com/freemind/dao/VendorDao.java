package com.freemind.dao;

import java.util.List;

import com.freemind.model.Vendors;

public interface VendorDao {
	public List<Vendors> getAllVendorList();

	public Vendors getVendorById(int id);

	public void save(Vendors vendor);

	public void update(Vendors vendor);

	public void updateVendorStatus(int id, boolean status);

	public void deleteVendorById(int id);

}
