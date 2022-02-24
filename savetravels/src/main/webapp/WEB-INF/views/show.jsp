<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
	
	<div class="container py-5">
		<div class="d-flex justify-content-center">
			<div class="container">
				<div class="card">
					<div class="card-header">
						<h3><c:out value="${expense.name}"></c:out></h3>
					</div>
					<div class="card-body">
						<p><span class="fw-bold">Description:</span> <c:out value="${expense.description}"></c:out></p>
						<p><span class="fw-bold">Vendor:</span> <c:out value="${expense.vendor}"></c:out></p>
						<p><span class="fw-bold">Amount:</span> <fmt:formatNumber value = "${expense.amount}" type = "currency" currencySymbol="$"/></p>
						
					</div>
					<div class="card-footer">
						<div class="d-flex justify-content-center align-items-center">
						<a href="/expenses">Go back</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>