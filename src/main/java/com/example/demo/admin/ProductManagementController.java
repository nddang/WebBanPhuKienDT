package com.example.demo.admin;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.firebase.FirebaseFileService;
import com.example.demo.model.Category;
import com.example.demo.model.Phone;
import com.example.demo.model.Product;
import com.example.demo.repository.CategoryRepository;
import com.example.demo.repository.PhoneRepository;
import com.example.demo.repository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductManagementController {
	@Autowired
	ProductRepository productrepository;
	
	@Autowired
	CategoryRepository categoryrepository;
	
	@Autowired
	PhoneRepository phonerepository;
	
	@Autowired
    private FirebaseFileService firebaseFileService;
	
	@RequestMapping("/admin/product/list")
	public String showListProduct(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession() ;
        if(session.getAttribute("admin")==null) {
        	return "redirect:/admin/login";
        }
		model.addAttribute("content", "product/list");
		Page<Product> pageListP=productrepository.findAll(PageRequest.of(0, 6));
		model.addAttribute("listP", pageListP.getContent());
		model.addAttribute("pagenumber", 1);
        model.addAttribute("lastpage", pageListP.getTotalPages());
		return "admin/index";
	}
	
	@RequestMapping("/admin/product/list/page/{pagenumber}")
	public String homePage(ModelMap model,HttpServletRequest request,@PathVariable("pagenumber") int pagenumber) {
		HttpSession session = request.getSession() ;
        if(session.getAttribute("admin")==null) {
        	return "redirect:/admin/login";
        }
		model.addAttribute("content", "product/list");
		Page<Product> pageListP=productrepository.findAll(PageRequest.of(pagenumber-1, 6));
		model.addAttribute("listP", pageListP.getContent());
		model.addAttribute("pagenumber", pagenumber);
        model.addAttribute("lastpage", pageListP.getTotalPages());
		return "admin/index";
	}
	
	@RequestMapping("/admin/product/add")
	public String showAddProduct(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession() ;
        if(session.getAttribute("admin")==null) {
        	return "redirect:/admin/login";
        }
		model.addAttribute("content", "product/add");
		List<Category> listCategory= categoryrepository.findAll();
        model.addAttribute("listC", listCategory);
        Sort sort = Sort.by(Sort.Direction.ASC, "name");
		List<Phone> listPhone=phonerepository.findAll(sort);
        model.addAttribute("listPhone", listPhone);
		return "admin/index";
	}
	
	@RequestMapping("/admin/product/update/{id}")
	public String showUpdateProduct(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		HttpSession session = request.getSession() ;
        if(session.getAttribute("admin")==null) {
        	return "redirect:/admin/login";
        }
		model.addAttribute("content", "product/update");
		Product product= productrepository.findById(id);
		String phonename=product.getPhonename();
		model.addAttribute("phonename", phonename);
		model.addAttribute("product", product);
		List<Category> listCategory= categoryrepository.findAll();
        model.addAttribute("listC", listCategory);
        Sort sort = Sort.by(Sort.Direction.ASC, "name");
		List<Phone> listPhone=phonerepository.findAll(sort);
        model.addAttribute("listPhone", listPhone);
		return "admin/index";
	}
	
	@PostMapping("/admin/product/add")
	public String add(ModelMap model,HttpServletRequest request,@RequestParam("imgurl") MultipartFile file,@RequestParam("price") double price,@RequestParam("number") long number) throws IOException {
		Product newProduct= new Product();
		newProduct.setName(request.getParameter("name"));
		newProduct.setDes(request.getParameter("des"));
		newProduct.setNumber(number);
		newProduct.setPrice(price);
		
		long idCategory= Long.parseLong(request.getParameter("loaisp"));
		String[] phonename= request.getParameterValues("loaidt");
		String phonenames="";
		for(String x:phonename)
			phonenames=phonenames+x+",";
		newProduct.setCategory(categoryrepository.findById(idCategory));
		newProduct.setPhonename(phonenames);

		String imgurl=firebaseFileService.saveTest(file);
		newProduct.setImgurl("https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/"+imgurl+"?alt=media&token="+imgurl);
		
		productrepository.save(newProduct);
		
		return "redirect:/admin/product/list";
	}
	
	@PostMapping("/admin/product/update/{id}")
	public String update(ModelMap model,HttpServletRequest request,@PathVariable("id") long id,@RequestParam("imgurl") MultipartFile file,@RequestParam("price") double price,@RequestParam("number") long number) throws IOException {
		Product updateProduct= new Product();
		updateProduct.setId(id);
		updateProduct.setName(request.getParameter("name"));
		updateProduct.setDes(request.getParameter("des"));
		updateProduct.setNumber(number);
		updateProduct.setPrice(price);
		
		long idCategory= Long.parseLong(request.getParameter("loaisp"));
		String[] phonename= request.getParameterValues("loaidt");
		String phonenames="";
		for(String x:phonename)
			phonenames=phonenames+x+",";
		updateProduct.setCategory(categoryrepository.findById(idCategory));
		updateProduct.setPhonename(phonenames);
		
		if(file.getOriginalFilename()!="") {
			Product p= productrepository.findById(id);
			String[] key=p.getImgurl().split("=");
			String imgurl=firebaseFileService.update(file,key[key.length-1]);
			System.out.print(imgurl);
			updateProduct.setImgurl("https://firebasestorage.googleapis.com/v0/b/webshop-b4e27.appspot.com/o/"+imgurl+"?alt=media&token="+imgurl);
		}
		else {
			Product product= productrepository.findById(id);
			updateProduct.setImgurl(product.getImgurl());
		}
		productrepository.save(updateProduct);
		
		return "redirect:/admin/product/list";
	}
	
	@RequestMapping("/admin/product/delete/{id}")
	public String delete(ModelMap model,HttpServletRequest request,@PathVariable("id") long id) {
		productrepository.deleteById(id);
		return "redirect:/admin/product/list";
	}
}
