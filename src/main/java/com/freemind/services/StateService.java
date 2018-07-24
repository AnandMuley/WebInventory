package com.freemind.services;

import java.util.List;

import com.freemind.model.State;

public interface StateService {
	public List<String> getAllStateList();

	public List<String> getCityListByStateName(String name);

	public void save(State state);

	public void update(State state);

	public void deleteStateById(int id);

}
