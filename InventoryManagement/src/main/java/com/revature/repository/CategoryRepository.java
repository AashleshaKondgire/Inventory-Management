package com.revature.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.revature.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {

}
