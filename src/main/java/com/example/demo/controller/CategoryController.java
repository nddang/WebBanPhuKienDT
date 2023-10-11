package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Category;
import com.example.demo.model.Product;
import com.example.demo.repository.CategoryRepository;
import com.example.demo.repository.ProductRepository;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryRepository categoryrepository;
	
	@Autowired
	ProductRepository productrepository;
	
	@RequestMapping("/category/{id}")
	public String showCategory(ModelMap model,@PathVariable("id") long id) {
		model.addAttribute("content","category");
		Category category= categoryrepository.findById(id);
		Page<Product> page= productrepository.findByCategoryId(id, PageRequest.of(0, 6));
		
		model.addAttribute("category", category);
		model.addAttribute("listP", page.getContent());
		model.addAttribute("pagenumber", 1);
        model.addAttribute("lastpage", page.getTotalPages());
		return "home";
	}
	
	@RequestMapping("/category/{id}/page/{pagenumber}")
	public String showCategoryPage(ModelMap model,@PathVariable("id") long id,@PathVariable("pagenumber") int pagenumber) {
		model.addAttribute("content","category");
		Category category= categoryrepository.findById(id);
		Page<Product> page= productrepository.findByCategoryId(id, PageRequest.of(pagenumber-1, 6));

		model.addAttribute("category", category);
		model.addAttribute("listP", page.getContent());
		model.addAttribute("pagenumber", pagenumber);
        model.addAttribute("lastpage", page.getTotalPages());
		return "home";
	}
}
