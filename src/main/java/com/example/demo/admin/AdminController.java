package com.example.demo.admin;

import com.example.demo.jwt.AuthService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.Collections;

@Controller
public class AdminController {

	private final AuthService authService;

	public AdminController(AuthService authService) {
		this.authService = authService;
	}

	@RequestMapping("/admin/home")
	public String adminHome(ModelMap model,HttpServletRequest request) {
//		HttpSession session = request.getSession() ;
//        if(session.getAttribute("admin")==null) {
//        	return "redirect:/adminLogin";
//        }
		return "redirect:/admin/product/list";
	}
	
	@RequestMapping("/adminLogin")
	public String loginPage(ModelMap model,HttpServletRequest request) {
		return "admin/login";
	}
	
	@PostMapping("/adminLogin")
	public String login(ModelMap model,HttpServletRequest request){
//		if(request.getParameter("username").equals("admin") && request.getParameter("password").equals("12345")) {
////			HttpSession session = request.getSession() ;
////			session.setAttribute("admin", "admin login success");
//			return "redirect:/admin/home";
//		}
//		else {
//			model.addAttribute("mess", "Thông tin đăng nhập sai");
//            return "admin/login";
//		}
		String token = authService.tokenlogin(request.getParameter("username"),request.getParameter("password"));
		if (token==null) {
			model.addAttribute("mess", "Thông tin đăng nhập sai");
			return "admin/login";
		}else {
			HttpSession session = request.getSession() ;
			session.setAttribute("tokenAdmin", token);
			return "redirect:/admin/home";
		}
    }
	
	@RequestMapping("/admin/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("token");
		return "redirect:/adminLogin";
	}
}
