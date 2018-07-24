package com.freemind.controller;

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

import com.freemind.model.ServiceTax;
import com.freemind.services.ServiceTaxService;


@Controller
@RequestMapping("addServiceTax")
public class ServiceTaxController {

	/*@RequestMapping(value = "/addServiceTax", method = RequestMethod.GET)
	public ModelAndView handleRequest(HttpServletRequest request,
			Model model) throws Exception {
		return new ModelAndView("Inventory/ServiceTax");
	}*/
	@Autowired
	ServiceTaxService  serviceTaxservice;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showServiceTax(Model uiModel, ModelMap model,
			HttpServletRequest httpServletRequest) {
		List<ServiceTax> serviceTaxList = serviceTaxservice.getAllServiceTaxList();
		uiModel.addAttribute("serviceTaxlist", serviceTaxList);
		return new ModelAndView("Inventory/ServiceTax");
	}
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView addServiceTax(
			@ModelAttribute("addServiceTax") @Valid ServiceTax serviceTaxModel,	
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest,
			RedirectAttributes redirectAttributes, Locale locale) {

		serviceTaxservice.save(serviceTaxModel);
		List<ServiceTax> serviceTaxList = serviceTaxservice.getAllServiceTaxList();
		uiModel.addAttribute("serviceTaxlist", serviceTaxList);
		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "Service Tax Added Successfully....!!!!");
		return new ModelAndView("Inventory/ServiceTax");
	}
	
	@RequestMapping(value = "{id}", params = "DeleteServiceTax", method = RequestMethod.GET)
	public ModelAndView deleteServiceTax(@PathVariable("id") Integer id,
			Model uiModel, HttpServletRequest httpServletRequest) {
		
		ServiceTax serviceTaxmodel =  serviceTaxservice.getServiceTaxById(id);
		serviceTaxmodel.setActive(false);
		serviceTaxservice.save(serviceTaxmodel);
		List<ServiceTax> serviceTaxList = serviceTaxservice.getAllServiceTaxList();
		uiModel.addAttribute("serviceTaxlist", serviceTaxList);
		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "Service Tax Deleted Successfully....!!!!");
		return new ModelAndView("Inventory/ServiceTax");

	}

}
