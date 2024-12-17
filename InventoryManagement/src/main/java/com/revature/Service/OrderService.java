package com.revature.Service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.model.Order;
import com.revature.model.Product;
import com.revature.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository repo;
	
	public Order createOrder(Product product,int quantity) {
		Order order=new Order();
		order.setProduct(product);
		order.setQuantity(quantity);
		order.setStatus("Processing");
		order.setOrderDate(new Date());
		order.setProductImage(product.getImage());
		return repo.save(order);
	}
	
	public List<Order> getAllOrders(){
		return repo.findAll();
	}
}
