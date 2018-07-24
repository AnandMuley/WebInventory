package com.freemind.dao;

import java.util.List;

import com.freemind.model.GST;

public interface GstDao {
	public List<GST> getAllGstList();

	public GST getGstById(int id);

	public void save(GST Gst);

	public void update(GST Gst);

	public void deleteGstById(int id);

}
