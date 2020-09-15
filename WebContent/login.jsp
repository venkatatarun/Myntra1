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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>

</head>
<body>
	<nav class="navbar bg-success">

	<div class="container">

		<img src="ProjectImages/myntralogo.jpeg"
			style="height: 60px; width: 60px; margin-left:-10px">


		<ul class="nav">
			<li class="nav-item"><button class="btn btn-primary"
					data-toggle="modal" data-target="#login">Login</button></li>&nbsp;
			<li class="nav-item"><button class="btn btn-primary"
					data-toggle="modal" data-target="#signup">SignUp</button></li>


		</ul>
	</div>


	</nav>


	</center>

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


	<div class="container-fluid">

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="ProjectImages/casualmen.jpg" alt="casualmen"
						style="width: 100%;">
				</div>

				<div class="item">
					<img src="ProjectImages/casualwomen.jpg" alt="casualwomen"
						style="width: 100%;">
				</div>

				<div class="item">
					<img src="ProjectImages/mens_fashion.jpg" alt="mens_fashion"
						style="width: 100%;">
				</div>
				<div class="item">
					<img src="ProjectImages/women_fashion.jpg" alt="women_fashion"
						style="width: 100%;">
				</div>
				<div class="item">
					<img src="ProjectImages/ethnic.jpg" alt="ethnic"
						style="width: 100%;">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<br>
	<br>
	<br>
	<form action="Myntraservlet" method="post">
	<br> Select Category &nbsp;&nbsp;&nbsp;&nbsp;
	<select name="category">
		<c:forEach var="obj" items="${cList}">
			<option>${obj}</option>
		</c:forEach>


	</select>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" class="btn btn-primary" value="Go" name="bt">
	</form>
	<table class="table">
		<tr>
			
				<th>Image</th>
				<th>Name</th>
				<th>Unit price</th>
		</tr>
		
		


<c:forEach var="obj" items="${list}">
<tr>       
		<td><img src="ProjectImages/${obj.image_url}"></td> 
		<td>${obj.name} </td>
		<td>${obj.price}</td>
		 </tr>
</c:forEach>



	</table>
	

</body>
</html>