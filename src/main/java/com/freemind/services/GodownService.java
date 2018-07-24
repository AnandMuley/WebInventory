package com.freemind.services;

import java.util.List;

import com.freemind.model.Godown;

public interface GodownService {
	public List<Godown> getAllGodownList();

	public Godown getGodownById(int id);

	public void save(Godown godown);

	public void update(Godown godown);

	public void deleteGodownById(int id);

}
