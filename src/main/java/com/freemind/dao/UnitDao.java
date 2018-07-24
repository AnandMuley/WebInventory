package com.freemind.dao;

import java.util.List;

import com.freemind.model.Unit;

public interface UnitDao {
	public List<Unit> getAllUnitList();

	public Unit getUnitById(int id);
	
	public Unit getUnitByName(String unitName);

	public void save(Unit unit);

	public void update(Unit unit);

	public void deleteUnitById(int id, boolean status);
	
	
}
