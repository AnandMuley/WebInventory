package com.freemind.services;

import java.util.List;

import com.freemind.model.GST;

public interface GstService {
	public List<GST> getAllGstList();

	public GST getGstById(int id);

	public void save(GST Gst);

	public void update(GST Gst);

	public void deleteGstById(int id);

}
