package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.StateDao;
import com.freemind.model.State;
import com.freemind.services.StateService;

@Service("StateService")
public class StateServiceImpl implements StateService {

	@Autowired
	StateDao stateDao;

	@Override
	public List<String> getAllStateList() {
		return stateDao.getAllStateList();
	}

	@Override
	public List<String> getCityListByStateName(String name) {
		return stateDao.getCityListByStateName(name);
	}

	@Override
	public void save(State state) {
		stateDao.save(state);
	}

	@Override
	public void update(State state) {
		stateDao.update(state);
	}

	@Override
	public void deleteStateById(int id) {
		stateDao.deleteStateById(id);
	}

}
