package com.revature.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.model.Supplier;
import com.revature.repository.SupplierRepository;

@Service
public class SupplierService {

		@Autowired
		private SupplierRepository repo;
		
		//create supplier
		public Supplier createSupplier(Supplier supplier) {
			return repo.save(supplier);
		}
		
		//get all suppliers
		public List<Supplier> getAllSuppliers() {
			 return repo.findAll();
		}
		
		//get by id
		public Supplier getSupplierById(Long id) {
			return repo.findById(id).orElse(null);
		}
		
		//delete supplier
		public void deleteSupplier(Long id) {
			repo.deleteById(id);
		}
		
		//update
		public Supplier updateSupplier(Long id, Supplier supplierDetails) {
			Supplier supplier = repo.findById(id)
					.orElseThrow(()-> new RuntimeException("Supplier not found od id: "+id));
			
			supplier.setName(supplierDetails.getName());
			supplier.setContact(supplier.getContact());
			
			return repo.save(supplier);
		}
		
	

	}


