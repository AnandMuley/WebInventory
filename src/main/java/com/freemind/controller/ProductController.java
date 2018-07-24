package com.freemind.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.freemind.model.CategoryModel;
import com.freemind.model.Product;
import com.freemind.model.Unit;
import com.freemind.model.GST;
import com.freemind.property.editors.CategoryPropertyEditors;
import com.freemind.property.editors.UnitPropertyEditor;
import com.freemind.property.editors.GstPropertyEditor;
import com.freemind.services.CategoryService;
import com.freemind.services.GodownService;
import com.freemind.services.ProductService;
import com.freemind.services.UnitService;
import com.freemind.services.GstService;

@Controller
@RequestMapping("addProduct")
public class ProductController {

	@Autowired
	ProductService productService;
	@Autowired
	GodownService godownService;
	@Autowired
	UnitService unitService;
	@Autowired
	GstService vatService;
	@Autowired
	CategoryService categoryService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {

		binder.setRequiredFields(new String[] { "categoryModel" });

		binder.registerCustomEditor(CategoryModel.class, new CategoryPropertyEditors(categoryService));

		binder.setRequiredFields(new String[] { "unitModel" });
		binder.registerCustomEditor(Unit.class, new UnitPropertyEditor(unitService));
		binder.setRequiredFields(new String[] { "vat" });
		binder.registerCustomEditor(GST.class, new GstPropertyEditor(vatService));
	}

	private Model setModel(Model model) {
		model.addAttribute("productList", productService.getAllProductList());
		model.addAttribute("categoryList", categoryService.listCategory());
		model.addAttribute("godownList", godownService.getAllGodownList());
		model.addAttribute("unitList", unitService.getAllUnitList());
		model.addAttribute("gstList", vatService.getAllGstList());
		return model;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showProducts(Model uimodel, ModelMap model, HttpServletRequest httpServletRequest) {
		uimodel.addAttribute("product", new Product());
		uimodel = setModel(uimodel);
		return new ModelAndView("Inventory/Product");
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("Product") @Valid Product product, BindingResult bindingResult,
			Model model, HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes, Locale locale) {
		if (bindingResult.hasErrors()) {

		}

		if (product.getProductName() == null || product.getProductName().trim().isEmpty()) {
			model.addAttribute("msgType", "2");
			model.addAttribute("msg", "उत्पादनाचे नाव आवश्यक आहे.");
		} else if (product.getCategoryModel() == null || product.getCategoryModel().getCategoryId() == -1) {
			model.addAttribute("msgType", "2");
			model.addAttribute("msg", "श्रेणी निवडणे आवश्यक आहे.");
		} else if ((product.getUnitName() == null) || (product.getUnitName().trim().isEmpty())) {
			model.addAttribute("msgType", "2");
			model.addAttribute("msg", "एकक निवडणे आवश्यक आहे.");
		} else if (product.getGstPerc() == null) {
			model.addAttribute("msgType", "2");
			model.addAttribute("msg", "जी. एस. टी.  निवडणे आवश्यक आहे.");
		} else {
			productService.save(product);
			model.addAttribute("msgType", "1");
			model.addAttribute("msg", "उत्पादन जतन केले आहे.");
		}

		model = setModel(model);
		return new ModelAndView("Inventory/Product");
	}

	@RequestMapping(value = "{id}", params = "DeleteProduct", method = RequestMethod.GET)
	public ModelAndView deleteProduct(@PathVariable("id") Integer id, Model uiModel,
			HttpServletRequest httpServletRequest) {
		Product productModel = productService.getProductById(id);
		productModel.setActivityStatus(false);
		productService.save(productModel);
		uiModel = setModel(uiModel);

		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "उत्पादन काढून टाकले आहे.");
		return new ModelAndView("Inventory/Godown");

	}

}
