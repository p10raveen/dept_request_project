<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@ include file="cdn.jsp" %>
</head>
<body>
<%
	String nameRole = (String) session.getAttribute("nameRole");
	if(nameRole!=null)
	{
		response.sendRedirect("dashboard.jsp");
	}
	
	String status = request.getParameter("status");
    if(status!=null){
    	if(status.equals("false")){
    		   out.print("Incorrect login details!");	           		
    	}
    	else{
    		out.print("Some error occurred!");
    	}
    }

%>
<div class="Container">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4 well">
			<fieldset>
				<legend>Login</legend>
				<form method="post" action="loginRequestHandler.jsp">
					<input type="text" name="username" class="form-control" placeholder="Enter Username" required/><br/>
					<input type="password" name="password" class="form-control" placeholder="Enter Password" required/><br/>
					<select name="role" class="form-control" required>
						<option disabled selected>Select Department</option>
						<option value="Finance">Finance</option>
						<option value="Legal">Legal</option>
						<option value="Management">Management</option>
					</select><br/>
					<input type="submit" class="btn btn-info btn-block" value="Login"/>
				</form>
			</fieldset>
		</div>
		<div class="col-md-4"></div>
	</div>
</div>
</body>
</html>