package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.VendorDao;
import com.freemind.model.Vendors;
import com.freemind.services.VendorService;

@Service("VendorService")
public class VendorServiceImpl implements VendorService {

	@Autowired
	VendorDao vendorDao;

	@Override
	public List<Vendors> getAllVendorList() {
		return vendorDao.getAllVendorList();
	}

	@Override
	public Vendors getVendorById(int id) {
		return vendorDao.getVendorById(id);
	}

	@Override
	public void save(Vendors vendor) {
		vendorDao.save(vendor);
	}

	@Override
	public void update(Vendors vendor) {
		vendorDao.update(vendor);
	}

	@Override
	public void deleteVendorById(int id) {
		vendorDao.deleteVendorById(id);
	}

	@Override
	public void updateVendorStatus(int id, boolean status) {
		vendorDao.updateVendorStatus(id, status);
	}

}
