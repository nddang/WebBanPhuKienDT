package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.repository.CategoryRepositoty;
import com.example.demo.repository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.example.demo.model.Category;
import com.example.demo.model.Product;

@Controller
public class HomeController {
	
	@Autowired
	CategoryRepositoty categoryrepository;
	
	@Autowired
	ProductRepository productrepository;
	
	@RequestMapping("/home")
	public String home(ModelMap model,HttpServletRequest request) {
		List<Category> listCategory= categoryrepository.findAll();
		List<Product> listproduct= productrepository.findAll();
		HttpSession session = request.getSession() ;
        session.setAttribute("listC", listCategory);
        model.addAttribute("listP", listproduct);
		return "home";
	}
}
