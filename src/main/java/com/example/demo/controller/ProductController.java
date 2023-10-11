package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.example.demo.model.Product;
import com.example.demo.repository.ProductRepository;

@Controller
public class ProductController {
	
	@Autowired
	ProductRepository productrepository;
	
	@RequestMapping("/detailproduct/{id}")
	public String showListProduct(ModelMap model,@PathVariable("id") long id) {
		model.addAttribute("content","detailproduct");
		Product product= productrepository.findById(id);
		Page<Product> sameproduct= productrepository.findByCategoryId(product.getCategory().getId(),PageRequest.of(0, 2));
		
		model.addAttribute("product", product);
		if(sameproduct.getContent().size()>1)
			model.addAttribute("sameproduct", sameproduct.getContent());
		else
			model.addAttribute("sameproduct", null);
		return "home";
	}
}
