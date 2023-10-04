package com.example.demo.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
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
		List<Product> sameproduct= productrepository.findByCategoryId(product.getCategory().getId());
		model.addAttribute("product", product);
		if(sameproduct.size()>1)
			model.addAttribute("sameproduct", sameproduct);
		else
			model.addAttribute("sameproduct", null);
		return "home";
	}
}
