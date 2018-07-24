package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.UnitDao;
import com.freemind.model.Unit;
import com.freemind.services.UnitService;

@Service("UnitService")
public class UnitServiceImpl implements UnitService {

	@Autowired
	UnitDao unitDao;

	@Override
	public List<Unit> getAllUnitList() {
		return unitDao.getAllUnitList();
	}

	@Override
	public Unit getUnitById(int id) {
		return unitDao.getUnitById(id);
	}

	@Override
	public void save(Unit unit) {
		unitDao.save(unit);
	}

	@Override
	public void update(Unit unit) {
		unitDao.update(unit);
	}

	@Override
	public void deleteUnitById(int id, boolean status) {
		unitDao.deleteUnitById(id, status);
	}

	@Override
	public Unit getUnitByName(String unitName) {
		return unitDao.getUnitByName(unitName);
	}

}
