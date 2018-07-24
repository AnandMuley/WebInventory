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

import com.freemind.model.GST;
import com.freemind.services.GstService;

@Controller
@RequestMapping("/addGst")
public class GstController {

	@Autowired
	GstService gstService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showVat(Model uiModel, ModelMap model, HttpServletRequest httpServletRequest) {
		List<GST> vatList = gstService.getAllGstList();
		uiModel.addAttribute("gstlist", vatList);
		return new ModelAndView("Inventory/Gst");
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView addVat(@ModelAttribute("addVat") @Valid GST vatModel, BindingResult bindingResult,
			Model uiModel, HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes,
			Locale locale) {

		gstService.save(vatModel);
		List<GST> vatlist = gstService.getAllGstList();
		uiModel.addAttribute("gstlist", vatlist);
		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "जी. एस. टी. जतन केला आहे");
		return new ModelAndView("Inventory/Gst");
	}

	@RequestMapping(value = "{id}", params = "DeleteGst", method = RequestMethod.GET)
	public ModelAndView deleteVat(@PathVariable("id") Integer id, Model uiModel,
			HttpServletRequest httpServletRequest) {

		GST godownmodel = gstService.getGstById(id);
		godownmodel.setActive(false);
		gstService.save(godownmodel);
		uiModel.addAttribute("gstlist", gstService.getAllGstList());
		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "जी. एस. टी. काढून टाकला आहे.");
		return new ModelAndView("Inventory/Gst");

	}

}
