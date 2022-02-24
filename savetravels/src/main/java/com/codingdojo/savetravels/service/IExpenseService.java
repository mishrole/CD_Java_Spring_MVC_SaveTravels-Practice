package com.codingdojo.savetravels.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.codingdojo.savetravels.entity.Expense;

public interface IExpenseService {
	public abstract List<Expense> allExpenses();
	public abstract Expense createExpense(Expense expense);
	public abstract Expense findExpense(Long id);
	public abstract Expense updateExpense(Long id, Expense expense);
	public abstract void deleteExpense(Long id);
	public Page<Expense> findAllPageable(Pageable pageable);
}
