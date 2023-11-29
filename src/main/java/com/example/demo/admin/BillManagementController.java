package com.example.demo.admin;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Bill;
import com.example.demo.model.Customer;
import com.example.demo.model.Order;
import com.example.demo.model.Product;
import com.example.demo.repository.BillRepository;
import com.example.demo.repository.CustomerRepository;
import com.example.demo.repository.OrderRepository;
import com.example.demo.repository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BillManagementController {
	@Autowired
	ProductRepository productrepository;
	
	@Autowired
	BillRepository billrepository;
	
	@Autowired
	OrderRepository orderrepository;
	
	@Autowired
	CustomerRepository customerrepository;
	
	@RequestMapping("/admin/bill/list")
	public String showListBill(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession() ;
		model.addAttribute("content","bill/list");
        if(session.getAttribute("admin")==null) {
        	return "redirect:/admin/login";
        }
        else {
        	Sort sort = Sort.by(Sort.Direction.DESC, "createdAt");
        	List<Bill> listbill=billrepository.findAll(sort);
        	
        	model.addAttribute("listbill", listbill);
        	
        	return "admin/index";
        }
        
	}   
	@RequestMapping("/admin/bill/update/{id}")
	public String showBillDetail(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		HttpSession session = request.getSession() ;
		model.addAttribute("content","bill/update");
        if(session.getAttribute("admin")==null) {
        	return "redirect:/admin/login";
        }
        else {
        	
        	Bill bill=billrepository.findById(id);
        	List<Order> listorder=orderrepository.findByBillId(id);
        	model.addAttribute("bill", bill);
        	model.addAttribute("listorder", listorder);
        	return "admin/index";
        }
        
	}  
	
	@PostMapping("/admin/bill/update/{id}")
	public String delete(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		Bill newBill= new Bill();
		newBill=billrepository.findById(id);
		
		if(request.getParameter("paymentStatus")!=null) {
			newBill.setPaymentStatus(request.getParameter("paymentStatus"));
			if(request.getParameter("paymentStatus").equals("Đã thanh toán"))
				newBill.setPaymentAt(LocalDateTime.now());
		}	
		if(request.getParameter("shipmentStatus")!=null)
			newBill.setShipmentStatus(request.getParameter("shipmentStatus"));
		
		billrepository.save(newBill);
		
		return "redirect:/admin/bill/list";
	}
}
