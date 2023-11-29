package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Bill;
import com.example.demo.model.Customer;
import com.example.demo.model.Order;
import com.example.demo.repository.BillRepository;
import com.example.demo.repository.CustomerRepository;
import com.example.demo.repository.OrderRepository;
import com.example.demo.repository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BillController {
	
	@Autowired
	ProductRepository productrepository;
	
	@Autowired
	BillRepository billrepository;
	
	@Autowired
	OrderRepository orderrepository;
	
	@Autowired
	CustomerRepository customerrepository;
	
	@RequestMapping("/history")
	public String showHistory(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession() ;
		model.addAttribute("content","history");
        if(session.getAttribute("customer")==null) {
        	return "home";
        }
        else {
        	
        	Customer customer=(Customer) session.getAttribute("customer");
        	List<Bill> listbill=billrepository.findByCustomerIdOrderByCreatedAtDesc(customer.getId());
        	if(listbill.size()>0)session.setAttribute("listbill", listbill);
        	
        	return "home";
        }
        
	}   
	@RequestMapping("/history/detail/{id}")
	public String showHistoryDetail(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		HttpSession session = request.getSession() ;
		model.addAttribute("content","detailhistory");
        if(session.getAttribute("customer")==null) {
        	return "home";
        }
        else {
        	
        	Bill bill=billrepository.findById(id);
        	List<Order> listorder=orderrepository.findByBillId(id);
        	model.addAttribute("bill", bill);
        	model.addAttribute("listorder", listorder);
        	return "home";
        }
        
	}   
}
