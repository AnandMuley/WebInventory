package com.freemind.property.editors;

import java.beans.PropertyEditorSupport;

import com.freemind.model.GST;
import com.freemind.services.GstService;

public class GstPropertyEditor extends PropertyEditorSupport {
	GstService gstService;

	public GstPropertyEditor(GstService vatService) {
		super();
		this.gstService = vatService;
	}

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		GST vatModel = null;
		try {
			Integer id = Integer.parseInt(text);
			vatModel = gstService.getGstById(id);

		} catch (NumberFormatException ex) {
			System.out.println("godown id is null");
		}
		setValue(vatModel);
	}

}
