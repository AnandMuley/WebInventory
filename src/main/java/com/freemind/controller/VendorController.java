package com.freemind.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.freemind.model.Vendors;
import com.freemind.services.VendorService;

@Controller
public class VendorController {

	@Autowired
	VendorService vendorService;

	@RequestMapping(value = "/showVendor", method = RequestMethod.GET)
	public ModelAndView handelRequest(Model uiModel, HttpServletRequest request) {
		uiModel.addAttribute("vendorList", vendorService.getAllVendorList());
		return new ModelAndView("Vendor/Vendor");
	}

	@RequestMapping(value = "/saveVendor", method = RequestMethod.POST)
	public ModelAndView saveVendor(
			@ModelAttribute("vendor") @Valid Vendors vendor,
			BindingResult bindingResult, Model uiModel,
			RedirectAttributes redirectedAttribute,
			HttpServletRequest httpServletRequest, Locale locale) {
		vendorService.save(vendor);

		uiModel.addAttribute("msgType1", "1");
		uiModel.addAttribute("msg", "Vendor Added Successfully!!!");

		return new ModelAndView("redirect:/showVendor");
	}

	@RequestMapping(method = RequestMethod.GET, value = "updateVendor/{id}/{status}")
	public ModelAndView deleteVendor(@PathVariable("id") Integer id,
			@PathVariable boolean status, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (status == true)
			vendorService.updateVendorStatus(id, false);
		else
			vendorService.updateVendorStatus(id, true);
		uiModel.addAttribute("msgType1", "1");
		uiModel.addAttribute("msg", "Vendor Deleted Successfully!!!");
		return new ModelAndView("redirect:/showVendor");
	}
}
