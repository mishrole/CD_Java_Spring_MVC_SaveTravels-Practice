package com.codingdojo.savetravels.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.codingdojo.savetravels.entity.Expense;
import com.codingdojo.savetravels.repository.ExpenseRepository;

@Service
public class ExpenseService implements IExpenseService {
	
	@Autowired
	private ExpenseRepository expenseRepository;

	@Override
	public List<Expense> allExpenses() {
		return expenseRepository.findAll();
	}

	@Override
	public Expense createExpense(Expense expense) {
		return expenseRepository.save(expense);
	}

	@Override
	public Expense findExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		
		if (optionalExpense.isPresent()) {
			return optionalExpense.get();
		}
		
		return null;
	}

	@Override
	public Expense updateExpense(Long id, Expense expense) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		
		if (optionalExpense.isPresent()) {
			Expense data = optionalExpense.get();
			data.setName(expense.getName());
			data.setDescription(expense.getDescription());
			data.setVendor(expense.getVendor());
			data.setAmount(expense.getAmount());
			
			return expenseRepository.save(expense);
		}
		
		return null;
	}

	@Override
	public void deleteExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		
		if (optionalExpense.isPresent()) {
			expenseRepository.deleteById(id);
		}
		
	}

	@Override
	public Page<Expense> findAllPageable(Pageable pageable) {
		return expenseRepository.findAll(pageable);
	}

}
