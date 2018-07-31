package com.freemind.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.freemind.services.StateService;

@Controller
public class LoginController {

	@Autowired
	StateService stateService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request) {
		return new ModelAndView("Login");
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model, HttpServletRequest request) {
		return "Login";
	}

	@RequestMapping(value = "/accessdenied", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("error", "true");
		return "denied";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "logout";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView loginSuccess(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String userName = auth.getName();
		HttpSession session = request.getSession(true);
		session.setAttribute("userName", userName);

		session.setAttribute("stateList", stateService.getAllStateList());

		return new ModelAndView("Home");
	}

	@ResponseBody
	@RequestMapping(value = "/showCity", method = RequestMethod.POST,produces = "text/html; charset=utf-8")
	public String getCityUsingStateName(
			@RequestParam("stateName") String stateName) {
		String content = " <select id='city' name='city' style='height: 30px !important; class='form-control'>";

		content = content
				+ "<option value='0'>---Select City---</option>";

		List<String> cityNameList = stateService
				.getCityListByStateName(stateName);

		for (String cityName : cityNameList) {
			content = content + "<option value='" + cityName + "'>" + cityName
					+ "</option>";
		}

		content = content + "</select>";

		return content;
	}
}
