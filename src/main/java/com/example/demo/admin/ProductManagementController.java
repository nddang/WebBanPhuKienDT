package com.example.demo.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductManagementController {
	
	@RequestMapping("/admin/product/list")
	public String showListProduct(ModelMap model,HttpServletRequest request) {
		model.addAttribute("content", "product/list");
		return "admin/index";
	}
	
	@RequestMapping("/admin/product/add")
	public String showAddProduct(ModelMap model,HttpServletRequest request) {
		model.addAttribute("content", "product/add");
		return "admin/index";
	}
	
	@RequestMapping("/admin/product/update")
	public String showUpdateProduct(ModelMap model,HttpServletRequest request) {
		model.addAttribute("content", "product/update");
		return "admin/index";
	}
}
