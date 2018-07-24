package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.ManufacturedDao;
import com.freemind.model.Manufactured;
import com.freemind.services.ManufacturedService;


@Service("ManufacturedService")
public class ManufacturedServiceImpl implements ManufacturedService {

	@Autowired
	ManufacturedDao manufacturedDao;

	@Override
	public List<Manufactured> getAllManufacturedList() {
		return manufacturedDao.getAllManufacturedList();
	}

	@Override
	public Manufactured getManufacturedById(int id) {
		return manufacturedDao.getManufacturedById(id);
	}

	@Override
	public void save(Manufactured manufactured) {
		manufacturedDao.save(manufactured);
	}

	@Override
	public void update(Manufactured manufactured) {
		manufacturedDao.update(manufactured);
	}

	@Override
	public void deleteManufacturedById(int id) {
		manufacturedDao.deleteManufacturedById(id);
	}

}
