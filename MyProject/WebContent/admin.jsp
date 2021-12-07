<%@page import="com.support.DBHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="styling/adminstyle.css">
<title>Hello, world!</title>
</head>
<body>
	<form action="logout">
		<input type="submit" value="LOGOUT">
	</form>
	<%
			if(session.getAttribute("user")==null){
				response.sendRedirect("login.jsp");
			}
		%>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-4" data-toggle="modal" data-target="#categoryModal">
				<div class="card">
					<div class="card-body text-center">
						<h1>Add Category</h1>
						<img src="img/menu.png" class="img-fluid" style="max-width: 70%;">
					</div>
				</div>
			</div>
			<div class="col-md-4" data-toggle="modal" data-target="#productModal">
				<div class="card">
					<div class="card-body text-center">
						<h1>Add Product</h1>
						<img src="img/box.png" class="img-fluid" style="max-width: 70%;">
					</div>
				</div>
			</div>
			<div class="col-md-4" data-toggle="modal" data-target="#detailModal">
				<div class="card">
					<div class="card-body text-center">
						<h1>View Details</h1>
						<img src="img/detail.png" class="img-fluid"	style="max-width: 70%;">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add category modal starts-->
	<!-- Button trigger modal -->
	<!-- Modal -->
	<div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Add Categories</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="cat" method="post">
						<div class="form-group">
							<label>Category Name</label> <input type="text"	class="form-control" name="cat_name">
						</div>
						<div class="form-group">
							<label>Category Description</label>
							<textarea class="form-control" name="cat_desc" rows="3"></textarea>
						</div>
						<br> <input type="submit" class="btn btn-success" value="ADD CATEGORY">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Add category modal ends -->

	<!-- Add product modal starts-->
	<!-- Button trigger modal -->
	<!-- Modal -->
	<div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Add Product</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="item" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label>Item Name</label> <input type="text" class="form-control" name="item_name">
						</div>
						<div class="form-group">
							<label>Item Price</label>
							<textarea class="form-control" name="item_price" rows="3"></textarea>
						</div>
						<div class="form-group">
							<label>Item Description</label>
							<textarea class="form-control" name="item_desc" rows="3"></textarea>
						</div>
						<br>						
						<div class="form-group">
							<label for="exampleFormControlFile1">Add Item Photo</label> 
							<input type="file" class="form-control-file" id="exampleFormControlFile1" name="item_img">
						</div>
						<br> <input type="submit" class="btn btn-info"	value="ADD ITEM">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"	data-dismiss="modal">Close</button>					
				</div>
			</div>
		</div>
	</div>
	<!-- Add product modal ends -->

	<!-- View details modal starts-->
	<!-- Button trigger modal -->
	<!-- Modal -->
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">View	Details</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h2>
						Number of USERS: <% out.print(DBHandler.getUserCount()); %>
					</h2>
					<h2>
						Number of CATEGORIES: <% out.print(DBHandler.getCatCount()); %>
					</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- View Details modal ends -->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>