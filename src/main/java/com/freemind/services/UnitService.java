package com.freemind.services;

import java.util.List;

import com.freemind.model.Unit;

public interface UnitService {
	public List<Unit> getAllUnitList();

	public Unit getUnitById(int id);

	public void save(Unit unit);

	public void update(Unit unit);

	public void deleteUnitById(int id, boolean status);
	
	public Unit getUnitByName(String unitName);
}
