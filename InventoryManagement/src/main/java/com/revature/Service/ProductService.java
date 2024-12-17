package com.revature.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.model.Product;
import com.revature.repository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository repo;
	
	//create product
	public Product save(Product product) {
		return repo.save(product);
	}
	
	//get all products
	public List<Product> getAllProduct(){
		return repo.findAll();
	}
	
	//get product by id
	public Product getById(Long id) {
		return repo.findById(id).orElse(null);
	}
	
	//delete 
	public void deleteById(Long id) {
		 repo.findById(id);
	}
	
	public List<Product> findLowStockProducts(){
		return repo.findByQuantityLessThan(5);
	}
}
