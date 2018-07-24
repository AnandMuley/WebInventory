package com.freemind.dao;

import java.util.List;

import com.freemind.model.Manufactured;

public interface ManufacturedDao {
	public List<Manufactured> getAllManufacturedList();

	public Manufactured getManufacturedById(int id);

	public void save(Manufactured manufactured);

	public void update(Manufactured manufactured);

	public void deleteManufacturedById(int id);

}
