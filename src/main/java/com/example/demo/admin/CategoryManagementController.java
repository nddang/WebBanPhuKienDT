package com.example.demo.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Category;
import com.example.demo.repository.CategoryRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class CategoryManagementController {
	@Autowired
	CategoryRepository categoryrepository;
	
	@RequestMapping("/admin/category/list")
	public String showListCategory(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession() ;
        if(session.getAttribute("admin")==null) {
        	return "redirect:/admin/login";
        }
		model.addAttribute("content", "category/list");
		List<Category> listCategory= categoryrepository.findAll();
        model.addAttribute("listC", listCategory);
		return "admin/index";
	}
	
	@RequestMapping("/admin/category/add")
	public String showAddCategory(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession() ;
        if(session.getAttribute("admin")==null) {
        	return "redirect:/admin/login";
        }
		model.addAttribute("content", "category/add");
		return "admin/index";
	}
	
	@RequestMapping("/admin/category/update/{id}")
	public String showUpdateCategory(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		HttpSession session = request.getSession() ;
        if(session.getAttribute("admin")==null) {
        	return "redirect:/admin/login";
        }
		model.addAttribute("content", "category/update");
		Category category = categoryrepository.findById(id);
		model.addAttribute("category", category);
		return "admin/index";
	}
	
	@PostMapping("/admin/category/add")
	public String add(ModelMap model,HttpServletRequest request) {
		Category newCategory= new Category();
		newCategory.setName(request.getParameter("name"));
		categoryrepository.save(newCategory);
		return "redirect:/admin/category/list";
	}
	
	@PostMapping("/admin/category/update/{id}")
	public String update(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		Category newCategory= new Category();
		newCategory.setName(request.getParameter("name"));
		newCategory.setId(id);
		categoryrepository.save(newCategory);
		return "redirect:/admin/category/list";
	}
	
	@RequestMapping("/admin/category/delete/{id}")
	public String delete(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		categoryrepository.deleteById(id);
		return "redirect:/admin/category/list";
	}
}
