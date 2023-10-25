package com.example.demo.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CategoryManagementController {
	
	@RequestMapping("/admin/category/list")
	public String showListCategory(ModelMap model,HttpServletRequest request) {
		model.addAttribute("content", "category/list");
		return "admin/index";
	}
	
	@RequestMapping("/admin/category/add")
	public String showAddCategory(ModelMap model,HttpServletRequest request) {
		model.addAttribute("content", "category/add");
		return "admin/index";
	}
	
	@RequestMapping("/admin/category/update")
	public String showUpdateCategory(ModelMap model,HttpServletRequest request) {
		model.addAttribute("content", "category/update");
		return "admin/index";
	}
}
