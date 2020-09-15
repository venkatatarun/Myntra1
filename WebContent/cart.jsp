<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar bg-success">

	<div class="container">

		<img src="ProjectImages/myntralogo.jpeg"
			style="height: 60px; width: 60px;">


		<ul class="nav">
			<li class="nav-item"><button class="btn btn-primary"
					data-toggle="modal" data-target="#login">
					Welcome
					<%=session.getAttribute("n")%></button></li>&nbsp;
			<li class="nav-item"><button class="btn btn-primary"
					data-toggle="modal" data-target="#signup">Logout</button></li>


		</ul>
	</div>


	</nav>
	<center>
		<h1>Items in the cart are</h1>
	</center>

	<table class="table">
		<tr>
			<th>ItemID</th>
			<th>Image</th>
			<th>Name</th>
			<th>Unitprice</th>
			<th>Quantity</th>


		</tr>
		<c:forEach var="obj" items="${selecteditemlist}" varStatus="st">

			<tr>
				<td>${obj.id}</td>
				<td><img src="ProjectImages/${obj.image_url}"></td>
				<td class="name">${obj.getName()}</td>
				<td>${obj.getPrice()}</td>
				<td>${qlist.get(st.index)}</td>
			</tr>





		</c:forEach>
</table>
		<center>
			<h2>Total Order Price :${tp}</h2>
			<br> <br> 
			<form action="checkout.jsp"><input type="submit" class="btn btn-primary"
				value="Place Order" name="bt"> <br> <br> 
				</form>
				<!-- <input type="submit" class="btn btn-primary" value="More Shopping"
				name="bt"> -->
				<a href="loginhome.jsp" class="btn btn-primary">More Shopping</a>
		</center>
</body>
</html>