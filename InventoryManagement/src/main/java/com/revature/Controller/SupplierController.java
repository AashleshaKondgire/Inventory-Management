package com.revature.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.revature.Service.SupplierService;
import com.revature.model.Product;
import com.revature.model.Supplier;

@Controller
@RequestMapping("/suppliers")
public class SupplierController {
    
    @Autowired
    private SupplierService service;

    @GetMapping
    public String listSuppliers(Model model) {
        List<Supplier> suppliers = service.getAllSuppliers();
        model.addAttribute("suppliers", suppliers);
        return "supplier/list"; // Return to the supplier list JSP
    }
    
    @GetMapping("/new")
    public String showCreateSupplierForm(Model model) {
        model.addAttribute("supplier", new Supplier());
        return "supplier/create"; // Return to the supplier create form JSP
    }

    @PostMapping
    public String createSupplier(@ModelAttribute Supplier supplier) {
        service.createSupplier(supplier);
        return "redirect:/suppliers"; // Redirect to the supplier list page
    }

    @GetMapping("/{id}/edit")
    public String showEditSupplierForm(@PathVariable Long id, Model model) {
        Supplier supplier = service.getSupplierById(id);
        model.addAttribute("supplier", supplier);
        return "supplier/edit"; // Return to the supplier edit form JSP
    }

    /*
    @PutMapping("/{id}")
    public String updateSupplier(@PathVariable Long id, @ModelAttribute Supplier supplier) {
        service.updateSupplier(id, supplier);
        return "redirect:/suppliers"; // Redirect to the supplier list page
    }
    */

 // SupplierController.java
    @PostMapping("/edit/{id}")
    public String updateSupplier(@PathVariable Long id, @ModelAttribute Supplier supplier) {
        service.updateSupplier(id, supplier); // Pass the id and supplier object
        return "redirect:/suppliers"; // Redirect to the supplier list page
    }

    @GetMapping("/{id}/delete")
    public String deleteSupplier(@PathVariable Long id) {
        service.deleteSupplier(id);
        return "redirect:/suppliers"; // Redirect to the supplier list page
    }
}
