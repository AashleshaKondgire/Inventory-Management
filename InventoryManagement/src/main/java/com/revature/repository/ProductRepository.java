package com.revature.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.revature.model.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

	List<Product> findByQuantityLessThan(int quantity);
}
