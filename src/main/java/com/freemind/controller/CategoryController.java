package com.freemind.controller;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.freemind.model.CategoryModel;
import com.freemind.services.CategoryService;

@Controller
@RequestMapping("/addcategory")
public class CategoryController {
	@Autowired
	CategoryService categoryService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showCategory(Model uiModel, ModelMap model, HttpServletRequest httpServletRequest) {
		System.out.println(uiModel);
		List<CategoryModel> addCategorylist = categoryService.listCategory();
		uiModel.addAttribute("addCategorylist", addCategorylist);
		return new ModelAndView("Inventory/Category");
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView addCategory(@ModelAttribute("addCategory") @Valid CategoryModel categorymodel,
			BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest,
			RedirectAttributes redirectAttributes, Locale locale) {
		System.err.println("abc :: " + categorymodel);

		CategoryModel categoryModelExists = categoryService.getCategoryByName(categorymodel.getCategoryName());

		if (categorymodel.getCategoryName() == null || categorymodel.getCategoryName().trim().isEmpty()) {
			uiModel.addAttribute("msgType", "2");
			uiModel.addAttribute("msg", "श्रेणी चे नाव आवश्यक आहे.");
		} else if (categoryModelExists == null) {
			categorymodel.setInsertionDate(new java.sql.Date(new Date().getTime()));
			categorymodel.setLastModifyDate(new java.sql.Date(new Date().getTime()));
			categoryService.saveCategory(categorymodel);
			uiModel.addAttribute("msgType", "1");
			uiModel.addAttribute("msg", "श्रेणी जतन केली आहे.");
		} else {
			uiModel.addAttribute("msgType", "1");
			uiModel.addAttribute("msg", "श्रेणी आधीच उपलब्ध आहे.");
		}
		List<CategoryModel> addCategorylist = categoryService.listCategory();
		uiModel.addAttribute("addCategorylist", addCategorylist);
		return new ModelAndView("Inventory/Category");

	}

	@RequestMapping(value = "{id}", params = "Deletecategorye", method = RequestMethod.GET)
	public ModelAndView deleteCompany(@PathVariable("id") Integer id, Model uiModel,
			HttpServletRequest httpServletRequest) {
		CategoryModel categorymodel = categoryService.categoryListById(id);
		categorymodel.setActive(true);
		categoryService.updateCategory(categorymodel);
		List<CategoryModel> addCategorylist = categoryService.listCategory();
		uiModel.addAttribute("addCategorylist", addCategorylist);
		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "श्रेणी काढून टाकली आहे.");
		return new ModelAndView("Inventory/Category");

	}
}
