package com.example.demo.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@RequestMapping("/admin/home")
	public String adminHome(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession() ;
        if(session.getAttribute("admin")==null) {
        	return "redirect:/admin/login";
        }
		return "redirect:/admin/product/list";
	}

	
	@PostMapping("/admin/login")
	public String login(ModelMap model,HttpServletRequest request){
		if(request.getParameter("username").equals("admin") && request.getParameter("password").equals("12345")) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", "admin login success");
			return "redirect:/admin/home";
		}
		else {
			model.addAttribute("mess", "Thông tin đăng nhập sai");
            return "admin/login";
		}
    }
	
	@RequestMapping("/admin/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		return "redirect:/admin/login";
	}
}
