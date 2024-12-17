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
import org.springframework.web.bind.annotation.RequestParam;

import com.revature.Service.CategoryService;
import com.revature.Service.OrderService;
import com.revature.Service.ProductService;
import com.revature.model.Category;
import com.revature.model.Product;

@Controller
@RequestMapping("/products")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping
    public String listProducts(Model model) {
        model.addAttribute("products", productService.getAllProduct());
        return "product/list";
    }
	
	 @GetMapping("/add")
	    public String addProductForm(Model model) {
	        model.addAttribute("product", new Product());
	        List<Category> categories = categoryService.getAllCategory(); // Fetch categories
	        model.addAttribute("categories", categories); // Add categories to model
	        return "product/add";
	    }

	 @PostMapping
	    public String addProduct(@ModelAttribute Product product) {
	        productService.save(product);
	        return "redirect:/products";
	    }

	    @GetMapping("/edit/{id}")
	    public String editProductForm(@PathVariable Long id, Model model) {
	        model.addAttribute("product", productService.getById(id));
	        return "product/edit";
	    }
	    
	    @PostMapping("/edit/{id}")
	    public String editProduct(@PathVariable Long id, @ModelAttribute Product product) {
	        product.setId(id);
	        productService.save(product);
	        return "redirect:/products";
	    }

	    @GetMapping("/delete/{id}")
	    public String deleteProduct(@PathVariable Long id) {
	        productService.deleteById(id);
	        return "redirect:/products";
	    }
	    
	    @GetMapping("/low-stock")
	    public String listLowStockProducts(Model model) {
	        List<Product> lowStockProducts = productService.findLowStockProducts();
	        model.addAttribute("products", lowStockProducts);
	        return "product/low_stock"; // Name of the new JSP page
	    }
	    
	    @PostMapping("/{id}/order") // Updated mapping
	    public String orderProduct(@RequestParam("quantity") int quantity, @PathVariable Long id) {
	        // Fetch the product based on ID
	        Product product = productService.getById(id);
	        if (product == null) {
	            // Handle the case where the product is not found
	            return "redirect:/products"; // Redirect back to products if not found
	        }
	        orderService.createOrder(product, quantity); // Pass product and quantity to create order
	        return "redirect:/orders"; // Redirect to orders page after ordering
	    }
}
