package com.revature.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.model.Category;
import com.revature.repository.CategoryRepository;

@Service
public class CategoryService {

	@Autowired
	private CategoryRepository repo;
	
	//create or update category
	public Category save(Category category) {
		return repo.save(category);
	}
	
	//getall category
	public List<Category> getAllCategory(){
		return repo.findAll();
	}
	
	//get category by id
	public Category getById(Long id) {
		return repo.findById(id).orElse(null);
	}
	
	//delete category by id
	public void deleteById(Long id) {
		 repo.deleteById(id);
	}
	
}
