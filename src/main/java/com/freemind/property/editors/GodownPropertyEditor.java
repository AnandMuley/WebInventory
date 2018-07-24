package com.freemind.property.editors;

import java.beans.PropertyEditorSupport;

import com.freemind.model.Godown;
import com.freemind.services.GodownService;

public class GodownPropertyEditor extends PropertyEditorSupport {
	GodownService godownService;

	public GodownPropertyEditor(GodownService godownService) {
		super();
		this.godownService = godownService;
	}
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
        Godown godownModel = null;
        try {
            Integer id = Integer.parseInt(text);
            godownModel = godownService.getGodownById(id);
            
        } catch (NumberFormatException ex) {
            System.out.println("godown id is null");
        }
        setValue(godownModel);
    }

}
