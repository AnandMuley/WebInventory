package com.freemind.property.editors;

import java.beans.PropertyEditorSupport;

import com.freemind.model.Unit;
import com.freemind.services.UnitService;

public class UnitPropertyEditor extends PropertyEditorSupport {
	
	UnitService unitService;

	public UnitPropertyEditor(UnitService unitService) {
		super();
		this.unitService = unitService;
	}
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		 Unit unitModel = null;
	        try {
	            Integer id = Integer.parseInt(text);
	            unitModel = unitService.getUnitById(id);
	            
	        } catch (NumberFormatException ex) {
	            System.out.println("godown id is null");
	        }
	        setValue(unitModel);
	}

}
