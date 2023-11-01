package com.example.demo.vnpay;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
//@RestController
//@RequestMapping("/api/payment")
public class PaymentController {
	
	@Autowired
	ProductRepository productrepository;
	
	@Autowired
	BillRepository billrepository;
	
	@Autowired
	OrderRepository orderrepository;
	
	@Autowired
	CustomerRepository customerrepository;
	
	@PostMapping("/create_payment")
	public String createPayment(HttpServletRequest request) throws UnsupportedEncodingException{
		
		HttpSession session = request.getSession() ;
		session.setAttribute("shipmentplace",(String)request.getParameter("shipmentplace"));
		
		String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        String vnp_TxnRef = Config.getRandomNumber(8);
        
        List<Order> listorder = (List<Order>) session.getAttribute("listorder");
		double tongtien=0;
		for(Order x: listorder) {
			tongtien+=x.getProduct().getPrice()*x.getNumberProduct();
		}
        long amount =(long) (tongtien*100);
        String vnp_TmnCode = Config.vnp_TmnCode;
        String vnp_IpAddr = "127.0.0.1";
        
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_BankCode", "NCB");
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        
        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
        
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        
        return "redirect:"+paymentUrl;
	}
	
	@RequestMapping("/vnpay_return")
	public String returnPayment(HttpServletRequest request) {
		if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
			HttpSession session = request.getSession() ;
			List<Order> listorder = (List<Order>) session.getAttribute("listorder");
			Customer customer=(Customer) session.getAttribute("customer");
			
			Bill newbill= new Bill();
			Optional<Customer> c = customerrepository.findById(customer.getId());
			newbill.setCustomer(c.get());
			newbill.setPaymentStatus("Đã thanh toán");
			newbill.setShipmentPlace((String)session.getAttribute("shipmentplace"));
			newbill.setCreatedAt(LocalDateTime.now());
			newbill.setPaymentAt(LocalDateTime.now());
			double amount=Integer.parseInt(request.getParameter("vnp_Amount"));
			newbill.setTotalPrice(amount/100);
			newbill=billrepository.save(newbill);
		
			for(Order x: listorder) {
				Order neworder=new Order();
				neworder.setBill(newbill);
				neworder.setProduct(productrepository.findById(x.getProduct().getId()));
				neworder.setNumberProduct(x.getNumberProduct());
				orderrepository.save(neworder);
			}
			
			for(Order x: listorder) {
				Product product= productrepository.findById(x.getProduct().getId());
				product.setNumber(product.getNumber()-x.getNumberProduct());
				productrepository.save(product);
			}
			
			session.removeAttribute("listorder");
			session.removeAttribute("shipmentplace");
        }
		
		return "vnpay_return";
	}
}
