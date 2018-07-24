package com.freemind.services;

import java.util.List;

import com.freemind.model.Vendors;

public interface VendorService {
	public List<Vendors> getAllVendorList();

	public Vendors getVendorById(int id);

	public void save(Vendors vendor);

	public void update(Vendors vendor);

	public void deleteVendorById(int id);

	public void updateVendorStatus(int id, boolean status);

}
