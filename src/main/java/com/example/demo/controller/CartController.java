package com.example.demo.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dto.DtoOrder;
import com.example.demo.model.Product;
import com.example.demo.repository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	
	@Autowired
	ProductRepository productrepository;
	
	@RequestMapping("/cart")
	public String showCart(ModelMap model) {
		model.addAttribute("content","cart");
		return "home";
	}
	
	@RequestMapping("/cart/add/{id}")
	public String addToCart(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		HttpSession session = request.getSession() ;
        if(session.getAttribute("customer")==null) {
        	model.addAttribute("content","cart");
        	return "home";
        }
        else {
        	model.addAttribute("content","cart");
        	Product product= productrepository.findById(id);
        	if(session.getAttribute("listorder")==null) {
        		List<DtoOrder> listorder=new ArrayList<>();
        		DtoOrder neworder= new DtoOrder();
        		neworder.setNumberproduct(1);
        		neworder.setProduct(product);
        		listorder.add(neworder);
        		double tongtien=product.getPrice();
        		model.addAttribute("tongtien", tongtien);
        		session.setAttribute("listorder", listorder);
        	}
        	else {
        		List<DtoOrder> listorder = (List<DtoOrder>) session.getAttribute("listorder");
        		boolean checksame=false;
        		double tongtien=product.getPrice();
        		for(DtoOrder x: listorder) {
        			tongtien+=x.getProduct().getPrice()*x.getNumberproduct();
        			if(x.getProduct().getId()==product.getId()) {
        				x.setNumberproduct(x.getNumberproduct()+1);
        				checksame=true;
        			}
        		}
        		if(!checksame) {
        			DtoOrder neworder= new DtoOrder();
            		neworder.setNumberproduct(1);
            		neworder.setProduct(product);
            		listorder.add(neworder);
        		}
        		model.addAttribute("tongtien", tongtien);
        		session.setAttribute("listorder", listorder);
        	}
        	return "home";
        }
	}   
}
