package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.GstDao;
import com.freemind.model.GST;
import com.freemind.services.GstService;

@Service("GstService")
public class GstServiceImpl implements GstService {

	@Autowired
	GstDao GstDao;

	@Override
	public List<GST> getAllGstList() {
		return GstDao.getAllGstList();
	}

	@Override
	public GST getGstById(int id) {
		return GstDao.getGstById(id);
	}

	@Override
	public void save(GST Gst) {
		GstDao.save(Gst);
	}

	@Override
	public void update(GST Gst) {
		GstDao.update(Gst);
	}

	@Override
	public void deleteGstById(int id) {
		GstDao.deleteGstById(id);
	}

}
