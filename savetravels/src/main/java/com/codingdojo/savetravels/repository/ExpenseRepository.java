package com.codingdojo.savetravels.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.savetravels.entity.Expense;

@Repository
public interface ExpenseRepository extends JpaRepository<Expense, Long> {
	List<Expense> findAll();
	Page<Expense> findAll(Pageable pageable);
}
