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
					data-toggle="modal" data-target="#login">welcome <%=session.getAttribute("n")%></button></li>&nbsp;
				<a href="logout.jsp">Logout</a>

		</ul>
	</div>


	</nav>

	
	
	
<div class="modal" id="signup">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Enter Details!</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<form action="Myntraservlet" method="post">


						<div class="form-group">
							Enter name : <input type="text" name="f1" class="form-control">
						</div>
						<div class="form-group">
							Enter email : <input type="email" name="f2" class="form-control">
						</div>

						<div class="form-group">
							Enter password : <input type="password" name="f3"
								class="form-control">
						</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">

					<input type="submit" value="Register" name="bt" />
				</div>

				</form>

			</div>
		</div>
	</div>



	<div class="modal" id="login">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Welcome!</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<form action="Myntraservlet" method="post">


						<div class="form-group">
							Enter email :
							<br>
							
							 <input type="email" name="t1"
								class="form-control col-sm-6">
						</div>
						<br>
						
						<div class="form-group">
							Enter password :
							<br>
							
							 <input type="password" name="t2"
								class="form-control col-sm-6">
						</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<input type="submit" value="Login" name="bt" />


				</div>

				</form>

			</div>
		</div>
	</div>


	
	<br>
	<br>
	<br>
	<form action="Myntraservlet" method="post"> 
	<input type="submit" class="btn btn-primary" value="Go" name="bt"> -->
	<br> Select Category &nbsp;&nbsp;&nbsp;&nbsp;
	<select name="category">
		<c:forEach var="obj" items="${cList}">
			<option>${obj}</option>
		</c:forEach>


	</select>
	
	
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	
 	
 	
	<table class="table">
		<tr>
			    
				<th>Image</th>
				<th>Name</th>
				<th>Unit price</th>
				<th>Quantity</th>
		</tr>
		
		


<c:forEach var="obj" items="${list}">
<tr>
<input type="hidden" value="${obj.id}" name="id"> 
		<td><img src="ProjectImages/${obj.image_url}"></td> 
		<td>${obj.name} </td>
		<td>${obj.price}</td>
		<td><input type="number" name="qty" min="0" max="50"></td>
		 </tr>
</c:forEach>


		


	</table>
	
	<input type="submit" value="Add to Cart" name="bt" class="btn btn-primary">

	 
	
	
	</form>
	<br>
	<br>
	<br>
	<br>

</body>
</html>