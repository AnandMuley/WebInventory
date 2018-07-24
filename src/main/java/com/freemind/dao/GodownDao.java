package com.freemind.dao;

import java.util.List;

import com.freemind.model.Godown;

public interface GodownDao {
	public List<Godown> getAllGodownList();

	public Godown getGodownById(int id);

	public void save(Godown godown);

	public void update(Godown godown);

	public void deleteGodownById(int id);

}
