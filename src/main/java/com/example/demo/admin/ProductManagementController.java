package com.example.demo.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Category;
import com.example.demo.model.Phone;
import com.example.demo.model.Product;
import com.example.demo.repository.CategoryRepository;
import com.example.demo.repository.PhoneRepository;
import com.example.demo.repository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductManagementController {
	@Autowired
	ProductRepository productrepository;
	
	@Autowired
	CategoryRepository categoryrepository;
	
	@Autowired
	PhoneRepository phonerepository;
	
	@RequestMapping("/admin/product/list")
	public String showListProduct(ModelMap model,HttpServletRequest request) {
		model.addAttribute("content", "product/list");
		List<Product> listP=productrepository.findAll();
		model.addAttribute("listP", listP);
		return "admin/index";
	}
	
	@RequestMapping("/admin/product/add")
	public String showAddProduct(ModelMap model,HttpServletRequest request) {
		model.addAttribute("content", "product/add");
		return "admin/index";
	}
	
	@RequestMapping("/admin/product/update/{id}")
	public String showUpdateProduct(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		model.addAttribute("content", "product/update");
		Product product= productrepository.findById(id);
		model.addAttribute("product", product);
		List<Category> listCategory= categoryrepository.findAll();
        model.addAttribute("listC", listCategory);
        List<Phone> listPhone= phonerepository.findAll();
        model.addAttribute("listPhone", listPhone);
		return "admin/index";
	}
}
