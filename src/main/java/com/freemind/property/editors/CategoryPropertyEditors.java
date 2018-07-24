package com.freemind.property.editors;

import java.beans.PropertyEditorSupport;

import com.freemind.model.CategoryModel;
import com.freemind.services.CategoryService;

public class CategoryPropertyEditors extends PropertyEditorSupport {
	private CategoryService categoryService;

    public CategoryPropertyEditors(CategoryService categoryService){
        this.categoryService = categoryService;
    }
    
    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        CategoryModel categoryModel = null;
        try {
            Integer id = Integer.parseInt(text);
            categoryModel = categoryService.categoryListById(id);
            
        } catch (NumberFormatException ex) {
            System.out.println("Department will be null");
        }
        setValue(categoryModel);
    }
}
