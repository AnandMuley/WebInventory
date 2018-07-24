package com.freemind.services;

import java.util.List;

import com.freemind.model.Manufactured;

public interface ManufacturedService {
	public List<Manufactured> getAllManufacturedList();

	public Manufactured getManufacturedById(int id);

	public void save(Manufactured manufactured);

	public void update(Manufactured manufactured);

	public void deleteManufacturedById(int id);

}
