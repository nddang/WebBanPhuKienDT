package com.example.demo.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class AdminController {
	
	@RequestMapping("/admin/home")
	public String adminHome(ModelMap model,HttpServletRequest request) {
		return "admin/index";
	}
}
