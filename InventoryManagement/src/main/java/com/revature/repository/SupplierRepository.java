package com.revature.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.revature.model.Supplier;

public interface SupplierRepository extends JpaRepository<Supplier, Long> {

}
