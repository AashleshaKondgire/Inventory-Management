package com.revature.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.revature.Service.CategoryService;
import com.revature.model.Category;

@Controller
@RequestMapping("/categories")
public class CategoryController {

    @Autowired
    private CategoryService service;

    @GetMapping
    public String listCategories(Model model) {
        List<Category> categories = service.getAllCategory();
        model.addAttribute("categories", categories);
        return "category/list"; // Ensure this view exists
    }

    @GetMapping("/add")
    public String addCategoryForm(Model model) {
        model.addAttribute("category", new Category());
        return "category/add"; // Ensure this view exists
    }
    
    @PostMapping
    public String addCategory(@ModelAttribute Category category) {
    	service.save(category);
    	return "redirect:/categories";  //redirect to category list after adding
    }
    
    @GetMapping("/edit/{id}")
    public String editCategoryForm(@PathVariable Long id, Model model) {
    	Category category=service.getById(id);
    	if(category !=null) {
    		model.addAttribute("category",category);
    		return "category/edit";  //will return edit.jsp
    	}else {
    		return "redirect:/categories";  //redirect if category not found
    	}
    }
    
    @PostMapping("/{id}")
    public String updateCategory(@PathVariable Long id,@ModelAttribute Category category) {
    	category.setId(id);  // Set the ID to ensure the correct category is updated
    	service.save(category);
    	return "redirect:/categories"; // Redirect to the category list after update
    }
    
    public String deleteCategory(@PathVariable Long id) {
    	service.deleteById(id); // Call the service method to delete the category
    	return "redirect:/categories"; // Redirect to the category list after deletion
    }
    
}
