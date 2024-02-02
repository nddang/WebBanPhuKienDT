package com.example.demo.controller;

import java.util.Collections;
import java.util.Optional;

import com.example.demo.jwt.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Customer;
import com.example.demo.repository.CustomerRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController {
	
	@Autowired
	CustomerRepository customerrepository;

	private final AuthService authService;

	public CustomerController(AuthService authService) {
		this.authService = authService;
	}
	
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
		session.removeAttribute("customer");
		session.removeAttribute("listorder");
		session.removeAttribute("listbill");
		return "redirect:/home";
	}
	
	@PostMapping("/register")
	public String register(ModelMap model,HttpServletRequest request){
//		Optional<Customer> customer = customerrepository.findByEmail(request.getParameter("email"));
//        if (!customer.isEmpty()) {
//        	model.addAttribute("content", "register");
//            model.addAttribute("mess", "Tài khoản đã tồn tại");
//            return "home";
//        }
        Customer newcus= new Customer();
		newcus.setName(request.getParameter("name"));
		newcus.setLocation(request.getParameter("location"));
		newcus.setPhoneNumber(request.getParameter("phone"));
		newcus.setEmail(request.getParameter("email"));
		newcus.setPassword(request.getParameter("password"));
		customerrepository.save(newcus);
//
//		Customer new_customer_login = customerrepository.findByEmailAndPassword(request.getParameter("email"), request.getParameter("password"));
//        HttpSession session = request.getSession() ;
//        session.setAttribute("customer", new_customer_login);
//
//        return "redirect:/home";
		String token = authService.tokenRegister(newcus);
		if (token==null) {
			model.addAttribute("content", "register");
            model.addAttribute("mess", "Tài khoản đã tồn tại");
            return "home";
		}else {
			HttpSession session = request.getSession() ;
        	session.setAttribute("token", token);
			return "redirect:/home";
		}
    }	
	
	@PostMapping("/login")
	public String login(ModelMap model,HttpServletRequest request){
//		Customer customer = customerrepository.findByEmailAndPassword(request.getParameter("email"), request.getParameter("password"));
//        if (customer==null) {
//        	model.addAttribute("content", "login");
//            model.addAttribute("mess", "Thông tin đăng nhập sai");
//            return "home";
//        }
//        HttpSession session = request.getSession() ;
//        session.setAttribute("customer", customer);
//        return "redirect:/home";
		String token = authService.tokenlogin(request.getParameter("email"), request.getParameter("password"));
		if (token==null) {
			model.addAttribute("content", "login");
            model.addAttribute("mess", "Thông tin đăng nhập sai");
            return "home";
		}else {
			HttpSession session = request.getSession() ;
        	session.setAttribute("token", token);
        	return "redirect:/home";
		}
    }
}
