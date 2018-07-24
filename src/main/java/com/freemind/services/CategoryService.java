package com.freemind.services;

import java.util.List;

import com.freemind.model.CategoryModel;

public interface CategoryService {
	void saveCategory(CategoryModel categorymodel);

	List<CategoryModel> listCategory();

	CategoryModel categoryListById(Integer id);

	void updateCategory(CategoryModel categorymodel);

	 CategoryModel getCategoryByName(String categoryName);

}
