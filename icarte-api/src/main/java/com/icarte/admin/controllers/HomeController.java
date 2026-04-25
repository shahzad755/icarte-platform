package com.icarte.admin.controllers;

import static com.icarte.commons.Constants.ApplicationViews.ADMIN_HOME;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/secure/home")
public class HomeController {

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome(HttpServletRequest request) {
		HttpSession session = request.getSession();
		//Check currently loggedin User
		return new ModelAndView(ADMIN_HOME.getViewName());
	}

	
	
}
