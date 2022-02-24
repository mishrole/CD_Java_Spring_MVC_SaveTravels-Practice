package com.codingdojo.savetravels.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.savetravels.entity.Expense;
import com.codingdojo.savetravels.service.ExpenseService;

@Controller
@RequestMapping("/expenses")
public class ExpenseController {
	
	@Autowired
	private ExpenseService expenseService;
	
	@RequestMapping()
	public String index(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index";
	}
	
	@RequestMapping("/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Expense result = expenseService.findExpense(id);
		model.addAttribute("expense", result);
		return "edit";
	}
	
	@RequestMapping("/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Expense result = expenseService.findExpense(id);
		model.addAttribute("expense", result);
		return "show";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
			return "index";
		}
		
		expenseService.createExpense(expense);
		return "redirect:/expenses";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
			return "edit";
		}
		
		expenseService.updateExpense(id, expense);
		return "redirect:/expenses";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
		expenseService.deleteExpense(id);
		return "redirect:/expenses";
	}
	
}
