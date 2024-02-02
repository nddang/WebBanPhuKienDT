package com.example.demo.controller;

import com.example.demo.jwt.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Customer;
import com.example.demo.repository.CustomerRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequiredArgsConstructor
@Controller
public class CustomerController {
	
	@Autowired
	CustomerRepository customerrepository;

	private final AuthService authService;
	
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
		Customer newcus= new Customer();
		newcus.setName(request.getParameter("name"));
		newcus.setLocation(request.getParameter("location"));
		newcus.setPhoneNumber(request.getParameter("phone"));
		newcus.setEmail(request.getParameter("email"));
		newcus.setPassword(request.getParameter("password"));

		String token = authService.tokenRegister(newcus);
		if (token==null) {
        	model.addAttribute("content", "register");
            model.addAttribute("mess", "Tài khoản đã tồn tại");
            return "home";
        }
        
		Customer new_customer_login = customerrepository.findByEmailAndPassword(request.getParameter("email"), request.getParameter("password"));
        HttpSession session = request.getSession() ;
        session.setAttribute("customer", new_customer_login);
        session.setAttribute("accessToken",token);

        return "redirect:/home";
    }	
	
	@PostMapping("/login")
	public String login(ModelMap model,HttpServletRequest request){
		String token = authService.tokenlogin(request.getParameter("email"), request.getParameter("password"));
        if (token==null) {
        	model.addAttribute("content", "login");
            model.addAttribute("mess", "Thông tin đăng nhập sai");
            return "home";
        }
        Customer customer=customerrepository.findByEmailAndPassword(request.getParameter("email"),request.getParameter("password"));
        HttpSession session = request.getSession() ;
        session.setAttribute("customer", customer);
		session.setAttribute("accessToken",token);

        return "redirect:/home";
    }
}
