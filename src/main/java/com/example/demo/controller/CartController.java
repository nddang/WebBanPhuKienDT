package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Order;
import com.example.demo.model.Product;
import com.example.demo.repository.BillRepository;
import com.example.demo.repository.CustomerRepository;
import com.example.demo.repository.OrderRepository;
import com.example.demo.repository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	
	@Autowired
	ProductRepository productrepository;
	
//	@Autowired
//	BillRepository billrepository;
	
//	@Autowired
//	OrderRepository orderrepository;
	
//	@Autowired
//	CustomerRepository customerrepository;
	
	@RequestMapping("/cart")
	public String showCart(ModelMap model) {
		model.addAttribute("content","cart");
		return "home";
	}
	
	@PostMapping("/cart/add/{id}")
	public String addToCart(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		HttpSession session = request.getSession() ;
        if(session.getAttribute("customer")==null) {
        	return "redirect:/cart";
        }
        else {
        	model.addAttribute("content","cart");
        	Product product= productrepository.findById(id);
        	if(session.getAttribute("listorder")==null) {
        		List<Order> listorder=new ArrayList<>();
        		Order neworder= new Order();
        		neworder.setNumberProduct(1);
        		neworder.setProduct(product);
        		listorder.add(neworder);
        		double tongtien=product.getPrice();
        		model.addAttribute("tongtien", tongtien);
        		session.setAttribute("listorder", listorder);
        	}
        	else {
        		List<Order> listorder = (List<Order>) session.getAttribute("listorder");
        		boolean checksame=false;
        		for(Order x: listorder) {
        			if(x.getProduct().getId()==id) {
        				x.setNumberProduct(x.getNumberProduct()+1);
        				checksame=true;
        			}
        		}
        		if(!checksame) {
        			Order neworder= new Order();
            		neworder.setNumberProduct(1);
            		neworder.setProduct(product);
            		listorder.add(neworder);
        		}
        		
        		session.setAttribute("listorder", listorder);
        	}
        	return "redirect:/cart";
        }
	}   
	
	@PostMapping("/cart/plus/{id}")
	public String plusProduct(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		HttpSession session = request.getSession() ;
		model.addAttribute("content", "cart");
		
		List<Order> listorder = (List<Order>) session.getAttribute("listorder");
		
		for (Order x : listorder) {
			if (x.getProduct().getId() == id && x.getProduct().getNumber()>x.getNumberProduct()) {
				x.setNumberProduct(x.getNumberProduct() + 1);
			}
		}
		
		session.setAttribute("listorder", listorder);
		
		return "redirect:/cart";
	}
	
	@PostMapping("/cart/subtract/{id}")
	public String subtractProduct(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		HttpSession session = request.getSession() ;
		model.addAttribute("content", "cart");
		
		List<Order> listorder = (List<Order>) session.getAttribute("listorder");
		
		for (Order x : listorder) {
			if (x.getProduct().getId() == id && x.getNumberProduct()>1) {
				x.setNumberProduct(x.getNumberProduct() - 1);
			}
		}
		
		session.setAttribute("listorder", listorder);
		
		return "redirect:/cart";
	}
	
	@PostMapping("/cart/delete/{id}")
	public String deleteProduct(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		HttpSession session = request.getSession() ;
		model.addAttribute("content", "cart");
		
		List<Order> listorder = (List<Order>) session.getAttribute("listorder");
		if(listorder.size()<=1) {
			session.removeAttribute("listorder");
		}
		else {
			List<Order> newlist = new ArrayList<>();
			for (Order x : listorder) {
				if (x.getProduct().getId() != id) {
					newlist.add(x);
				}
			}
			session.setAttribute("listorder", newlist);
		}
		
		return "redirect:/cart";
	}
	
}
