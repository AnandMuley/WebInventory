package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.GodownDao;
import com.freemind.model.Godown;
import com.freemind.services.GodownService;

@Service("GodownService")
public class GodownServiceImpl implements GodownService {

	@Autowired
	GodownDao godownDao;

	@Override
	public List<Godown> getAllGodownList() {
		return godownDao.getAllGodownList();
	}

	@Override
	public Godown getGodownById(int id) {
		return godownDao.getGodownById(id);
	}

	@Override
	public void save(Godown godown) {
		godownDao.save(godown);
	}

	@Override
	public void update(Godown godown) {
		godownDao.update(godown);
	}

	@Override
	public void deleteGodownById(int id) {
		godownDao.deleteGodownById(id);
	}

}
