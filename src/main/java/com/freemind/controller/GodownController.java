package com.freemind.controller;

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

import com.freemind.model.Godown;
import com.freemind.services.GodownService;

@Controller
@RequestMapping("/addGodown")
public class GodownController {

	@Autowired
	GodownService godownService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showGodown(Model uimodel, ModelMap model,
			HttpServletRequest httpServletRequest) {
		model.addAttribute("godwonList", godownService.getAllGodownList());
		return new ModelAndView("Inventory/Godown");
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView addGodown(
			@ModelAttribute("addGodown") @Valid Godown godown,
			BindingResult bindingResult, Model model,
			HttpServletRequest httpServletRequest,
			RedirectAttributes redirectAttributes, Locale locale) {
		godownService.save(godown);
		model.addAttribute("godwonList", godownService.getAllGodownList());
		return new ModelAndView("Inventory/Godown");
	}
//	@RequestMapping(method = RequestMethod.POST)
//	public Godown viewGodown(@RequestParam("id") int id) {
//		return godownService.getGodownById(id);
//
//	}

	@RequestMapping(value = "{id}", params = "DeleteGodown", method = RequestMethod.GET)

	public ModelAndView deleteGodown(@PathVariable("id") Integer id,

			Model uiModel, HttpServletRequest httpServletRequest) {
		Godown godownmodel =  godownService.getGodownById(id);
		godownmodel.setActive(false);
		godownService.update(godownmodel);
		uiModel.addAttribute("godwonList", godownService.getAllGodownList());
		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "Category Deleted Successfully....!!!!");
		return new ModelAndView("Inventory/Godown");

	}

}
