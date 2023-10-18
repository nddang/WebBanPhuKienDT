package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.repository.CategoryRepository;
import com.example.demo.repository.PhoneRepository;
import com.example.demo.repository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.example.demo.model.Category;
import com.example.demo.model.Phone;
import com.example.demo.model.Product;

@Controller
public class HomeController {
	
	@Autowired
	CategoryRepository categoryrepository;
	
	@Autowired
	ProductRepository productrepository;
	
	@Autowired
	PhoneRepository phonerepository;
	
	@RequestMapping("/home")
	public String home(ModelMap model,HttpServletRequest request) {
		List<Category> listCategory= categoryrepository.findAll();
		List<Phone> listPhone=phonerepository.findAll();
		Page<Product> page= productrepository.findAll(PageRequest.of(0, 6));
		
		HttpSession session = request.getSession() ;
        session.setAttribute("listC", listCategory);
        session.setAttribute("listPhone", listPhone);
        model.addAttribute("listP", page.getContent());
        model.addAttribute("pagenumber", 1);
        model.addAttribute("lastpage", page.getTotalPages());
        
		return "home";
	}
	
	@RequestMapping("/home/page/{pagenumber}")
	public String homePage(ModelMap model,HttpServletRequest request,@PathVariable("pagenumber") int pagenumber) {
		Page<Product> page= productrepository.findAll(PageRequest.of(pagenumber-1, 6));
		
        model.addAttribute("listP", page.getContent());
        model.addAttribute("pagenumber", pagenumber);
        model.addAttribute("lastpage", page.getTotalPages());
		return "home";
	}
	
	@RequestMapping("/home/search")
	public String resultSaerch(ModelMap model,HttpServletRequest request) {
		Page<Product> page= productrepository.findByNameContaining(request.getParameter("name"),PageRequest.of(0, 6));
		
		model.addAttribute("content", "search");
        model.addAttribute("listP", page.getContent());
        model.addAttribute("pagenumber", 1);
        model.addAttribute("name", request.getParameter("name"));
        model.addAttribute("lastpage", page.getTotalPages());
		return "home";
	}
	@RequestMapping("/home/searchpage")
	public String resultSaerchPage(ModelMap model,HttpServletRequest request) {
		int pagenumber=Integer.parseInt(request.getParameter("page"));
		Page<Product> page= productrepository.findByNameContaining(request.getParameter("name"),PageRequest.of(pagenumber-1, 6));
		
		model.addAttribute("content", "search");
        model.addAttribute("listP", page.getContent());
        model.addAttribute("pagenumber", pagenumber);
        model.addAttribute("name", request.getParameter("name"));
        model.addAttribute("lastpage", page.getTotalPages());
		return "home";
	}
}
