package com.freemind.dao;

import java.util.List;

import com.freemind.model.State;

public interface StateDao {
	public List<String> getAllStateList();

	public List<String> getCityListByStateName(String name);

	public void save(State state);

	public void update(State state);

	public void deleteStateById(int id);

}
