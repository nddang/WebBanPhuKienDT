package com.example.demo.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Customer;
import com.example.demo.repository.CustomerRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController {
	
	@Autowired
	CustomerRepository customerrepository;
	
	@RequestMapping("/login")
	public String showLogin(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession() ;
		if(session.getAttribute("customer")==null) {
			model.addAttribute("content","login");
			return "home";
		}
		else return "redirect:/home";
	}
	
	@RequestMapping("/register")
	public String showRegister(ModelMap model) {
		model.addAttribute("content","register");
		return "home";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/home";
	}
	
	@PostMapping("/register")
	public String register(ModelMap model,HttpServletRequest request,@RequestParam String name, @RequestParam String username, @RequestParam String password, @RequestParam String location,@RequestParam String phone){
		Optional<Customer> customer = customerrepository.findByUsername(username);
        if (!customer.isEmpty()) {
        	model.addAttribute("content", "register");
            model.addAttribute("mess", "Tài khoản đã tồn tại");
            return "home";
        }
        Customer newcus= new Customer();
		newcus.setName(name);
		newcus.setLocation(location);
		newcus.setPhoneNumber(phone);
		newcus.setUsername(username);
		newcus.setPassword(password);
		customerrepository.save(newcus);
        
		Customer new_customer_login = customerrepository.findByUsernameAndPassword(username, password);
        HttpSession session = request.getSession() ;
        session.setAttribute("customer", new_customer_login);
        return "redirect:/home";
    }	
	
	@PostMapping("/login")
	public String login(ModelMap model,HttpServletRequest request, @RequestParam String username, @RequestParam String password){
		Customer customer = customerrepository.findByUsernameAndPassword(username, password);
        if (customer==null) {
        	model.addAttribute("content", "login");
            model.addAttribute("mess", "Thông tin đăng nhập sai");
            return "home";
        }
        HttpSession session = request.getSession() ;
        session.setAttribute("customer", customer);
        return "redirect:/home";
    }
}
