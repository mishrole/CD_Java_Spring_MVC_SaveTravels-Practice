<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Save Travels</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	
	<div class="container py-5">
		<div class="d-flex justify-content-center">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center pb-4">
					<h3>Save Travels</h3>
					<div>
						<!--<a href="/expenses/new" class="btn btn-primary">Add an expense</a> -->
						<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#saveExpenseModal">Add an expense</button>
					</div>
				</div>
				
				<div class="table-responsive">
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col">Expense</th>
					      <th scope="col">Vendor</th>
					      <th scope="col">Amount</th>
					      <th scope="col">Action</th>
					    </tr>
					  </thead>
					  <tbody>
						  <c:forEach var="expense" items="${expenses}">
							<tr>
						      <td><a href="/expenses/${expense.id}">${expense.name}</a></td>
						      <td>${expense.vendor}</td>
						      <td>
						      	<fmt:formatNumber value = "${expense.amount}" type = "currency" currencySymbol="$"/>
						      </td>
						      <td>
						      <div class="d-flex justify-content-between align-items-center">
						      	<a href="/expenses/${expense.id}/edit">Edit</a>
						      	<form action="/expenses/${expense.id}" method="post">
						      		<input type="hidden" name="_method" value="DELETE">
						      		<button type="submit" class="btn btn-default link">Delete</button>
						      	</form>
						      </div>
						      </td>
						    </tr>
						</c:forEach>
					  </tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="saveExpenseModal" tabindex="-1" aria-labelledby="saveExpenseModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="saveExpenseModalLabel">New Expense</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form:form action="/expenses" method="POST" id="validate" modelAttribute="expense">
				<div class="row mx-auto">
					<div class="col-12">
						<div class="form-floating mb-3">
						  <form:input path="name" type="text" name="name" id="name" class="form-control requires-validation validate-save" />
						  <div class="invalid-feedback"></div>
						  <form:errors path="name" class="text-danger backend-validation" />
						  <form:label for="name" path="name">Expense Name</form:label>
						</div>
					</div>
					
					<div class="col-12">
						<div class="form-floating mb-3">
						  <form:input path="vendor" type="text" name="vendor" id="vendor" class="form-control requires-validation validate-save" />
						  <div class="invalid-feedback"></div>
						  <form:errors path="vendor" class="text-danger backend-validation" />
						  <form:label path="vendor" for="vendor">Vendor</form:label>
						</div>
					</div>
					
					<div class="col-12">
						<div class="form-floating mb-3">
						  <form:input path="amount" type="text" name="amount" id="amount" class="form-control requires-validation validate-save" />
						  <div class="invalid-feedback"></div>
						  <form:errors path="amount" class="text-danger backend-validation" />
						  <form:label path="amount" for="amount">Amount</form:label>
						</div>
					</div>
					
					<div class="col-12">
						<div class="form-floating mb-3">
						  <form:textarea path="description" name="description" id="description" class="form-control requires-validation validate-save"></form:textarea>
						  <div class="invalid-feedback"></div>
						  <form:errors path="description" class="text-danger backend-validation" />
						  <form:label path="description" for="description">Description</form:label>
						</div>
					</div>
					
					<div class="col-12">
						<div class="d-flex align-items-center justify-content-end">
							<button class="btn btn-primary" type="submit" value="Submit">Save</button>
						</div>
					</div>
				</div>
			</form:form>
	      </div>
	      <!--<div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div> -->
	    </div>
	  </div>
	</div>
	
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- Javascript Local -->
	<script src="/js/validateHelper.js"></script>
	<script src="/js/validateForm.js"></script>
</body>
</html>