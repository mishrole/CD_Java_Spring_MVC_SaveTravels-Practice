<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- PUT -->
<%@ page isErrorPage="true" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Expense</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	
	<div class="container py-5">
		<div class="d-flex justify-content-center">
			<div class="container">
				<div class="pt-2 pb-4"><a href="/expenses">Go back</a></div>
			
				<h3 class="text-center">Edit Expense</h3>
				<div class="card">
					<div class="card-body">
						<form:form action="/expenses/${expense.id}" method="POST" id="validate" modelAttribute="expense">
							<input type="hidden" name="_method" value="PUT">
							
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
				</div>
			</div>
		</div>
	</div>
	
	<!-- jQuery (No necesario en Bootstrap 5) -->
	<!-- <script src="/webjars/jquery/jquery.min.js"></script> -->
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- Javascript Local -->
	<script src="/js/validateHelper.js"></script>
	<script src="/js/validateForm.js"></script>
</body>
</html>