<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="styling/registerstyle.css">
    <title>Registration!</title>
    
  </head>
  <body>
  	<form action="reg" method="post">
	  <div class="form-group">
	    <label for="exampleInputUsername1">User Name</label>
	    <input type="text" class="form-control" id="exampleInputUser1" aria-describedby="emailHelp" placeholder="Enter username" name="uname">
	    <small id="emailHelp" class="form-text">We'll never share your username with anyone else.</small>
	  </div>
	  <div class="form-group">
	    <label for="exampleInputEmail1">Email address</label>
	    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email">
	    <small id="emailHelp" class="form-text">We'll never share your email with anyone else.</small>
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">Password</label>
	    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Password" name="pwd">
	  </div>	  	  
	  <button type="submit" class="btn btn-primary">Submit</button>
	</form>    
  </body>
</html>