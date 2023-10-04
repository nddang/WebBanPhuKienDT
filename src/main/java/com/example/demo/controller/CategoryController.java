package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Category;
import com.example.demo.model.Product;
import com.example.demo.repository.CategoryRepositoty;
import com.example.demo.repository.ProductRepository;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryRepositoty categoryrepository;
	
	@Autowired
	ProductRepository productrepository;
	
	@RequestMapping("/category/{id}")
	public String showCategory(ModelMap model,@PathVariable("id") long id) {
		model.addAttribute("content","category");
		Category category= categoryrepository.findById(id);
		List<Product> listproduct= productrepository.findByCategoryId(id);
		model.addAttribute("category", category);
		model.addAttribute("listP", listproduct);
		return "home";
	}
}
