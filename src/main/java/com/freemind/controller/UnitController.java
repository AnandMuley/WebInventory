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

import com.freemind.model.Unit;
import com.freemind.services.UnitService;

@Controller
public class UnitController {

	@Autowired
	UnitService unitService;

	@RequestMapping(value = "/showUnit", method = RequestMethod.GET)
	public ModelAndView handelRequest(Model uiModel, HttpServletRequest request) {
		uiModel.addAttribute("unitList", unitService.getAllUnitList());
		return new ModelAndView("Inventory/Unit");
	}

	@RequestMapping(method = RequestMethod.POST, value = "/addUnit")
	public ModelAndView addUnit(@ModelAttribute("addUnit") @Valid Unit unitModel, BindingResult bindingResult,
			Model uiModel, HttpServletRequest httpServletRequest, RedirectAttributes redirectedAttributes,
			Locale locale) {

		Unit unitExits = unitService.getUnitByName(unitModel.getUnitName());

		if (unitModel.getUnitName() == null || unitModel.getUnitName().trim().isEmpty()) {
			uiModel.addAttribute("msgType", "2");
			uiModel.addAttribute("msg", "एकक चे नाव आवश्यक आहे.");

		} else if (unitExits != null) {
			uiModel.addAttribute("msgType", "2");
			uiModel.addAttribute("msg", "एकक आधीच उपलब्ध आहे..");

		} else {
			unitService.save(unitModel);
			uiModel.addAttribute("msgType", "1");
			uiModel.addAttribute("msg", "एकक जतन केले आहे.");
		}
		uiModel.addAttribute("unitList", unitService.getAllUnitList());

		return new ModelAndView("Inventory/Unit");
	}

	@RequestMapping(method = RequestMethod.GET, value = "updateUnit/{id}/{status}")
	public ModelAndView updateUnit(@PathVariable("id") Integer id, @PathVariable("status") boolean status,
			Model uiModel, HttpServletRequest httpServletRequest) {

		if (status == true)
			unitService.deleteUnitById(id, false);
		else
			unitService.deleteUnitById(id, true);

		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "एकक मध्ये सुधारणा  झाली आहे.");
		uiModel.addAttribute("unitList", unitService.getAllUnitList());
		return new ModelAndView("Inventory/Unit");
	}

	@RequestMapping(method = RequestMethod.GET, value = "deleteUnit/{id}")
	public ModelAndView deleteUnit(@PathVariable("id") Integer id, Model uiModel,
			HttpServletRequest httpServletRequest) {

		unitService.deleteUnitById(id, false);

		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "एकक काढून टाकले आहे.");
		uiModel.addAttribute("unitList", unitService.getAllUnitList());

		return new ModelAndView("Inventory/Unit");
	}

}
