<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
	
	<title>Spring Boot Login Application</title>
	
	<link href="static/css/bootstrap.min.css" rel="stylesheet">
	<link href="static/css/style.css" rel="stylesheet">
</head>

<body>
	<div>
		<div class="navbar navbar-inverse">
			<a href="/welcome" class="navbar-brand">Spring Boot</a>
			<div class="navbar-collapse collapse pull-right">
				<ul class="nav navbar-nav">
					<li><a href="/show-users">All Users</a></li>
					<li><a href="/register">Registration</a></li>
					<!-- <li><a href="#">Logout</a></li> -->
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode=='MODE_HOME' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h3>Welcome to Spring Boot App</h3>
					<!-- <h3>Feel free to share your experience</h3> -->
					<a href="/show-users">All Users</a><br>
					<a href="/register">Registration</a>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_REGISTER' }">
			<div class="container text-center">
				<h3>New Registration</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id" value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username" value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Full Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="fullname" value="${user.fullname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Email</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="email" value="${user.email }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password" value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
					</div>
				</form>
			</div>
			
		</c:when>
		<c:when test="${mode=='ALL_USERS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>All Users</h3>
				<hr>
				<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
				<div class="table-responsive">
					<table class="table table-striped table-bordered" id="myTable">
						<thead>
							<tr>
								<th>Id</th>
								<th>UserName</th>
								<th>Full Name</th>
								<th>Email</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users }">
								<tr>
									<td>${user.id}</td>
									<td>${user.username}</td>
									<td>${user.fullname}</td>
									<td>${user.email}</td>
									<td><a href="/delete-user?id=${user.id }"><span class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-user?id=${user.id }"><span class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_UPDATE' }">
			<div class="container text-center">
				<h3>Update User</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id" value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username" value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Full Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="fullname" value="${user.fullname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Email</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="email" value="${user.email }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password" value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
		</c:when>

		<%-- <c:when test="${mode=='MODE_LOGIN' }">
			<div class="container text-center">
				<h3>User Login</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="/login-user">
					<c:if test="${not empty error }">
						<div class= "alert alert-danger">
							<c:out value="${error }"></c:out>
							</div>
					</c:if>
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Login" />
					</div>
				</form>
			</div>
		</c:when> --%>
	</c:choose>
	
	<script type="text/javascript" src="static/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
	<script>
		function myFunction() {
			  var input, filter, table, tr, td, i;
			  input = document.getElementById("myInput");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("myTable");
			  tr = table.getElementsByTagName("tr");
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[0];
			    if (td) {
			      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    }       
			  }
			}
		
		</script>
	
</body>

</html>