package com.revature.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.revature.Service.OrderService;
import com.revature.model.Order;



@Controller
@RequestMapping("/orders")
public class OrderController {

	@Autowired
	private OrderService service;
	
	 @GetMapping
	    public String listOrders(Model model) {
	        List<Order> orders = service.getAllOrders(); // You need to implement this method in OrderService
	        model.addAttribute("orders", orders);
	        return "order/list"; // Return to order list JSP
	    }
}
