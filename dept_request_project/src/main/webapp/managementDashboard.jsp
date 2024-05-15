<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Management Dashboard</title>
<%@ include file="cdn.jsp" %>
<%@ page import="java.util.Date,java.util.ArrayList,com.database.DbConnection" %>
</head>
<body>
<%
	String username = (String)session.getAttribute("username");
	if(username==null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{
%>
<div class="container">
		<div class="row">
			<nav class="navbar navbar-inverse ">
				<div class="container-fluid">
					<div class="navbar-header">
						<p class="navbar-brand">Management Dashboard</p>
					</div>
					
					<ul class="nav navbar-nav navbar-right">
						<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>
								Logout</a></li>
					</ul>
				</div>
			</nav>
		</div>
		<div class="row">
			<div class="col-md-8 well">
				<fieldset>
					<legend>Request Form</legend>
					<form method="post" action="managementData.jsp">
						<input type="text" name="title" class="form-control" placeholder="Enter Request Title"/><br/>
						<textarea name="description" class="form-control" placeholder="Describe your request" rows="10" cols="8"></textarea><br/>
						<select name="department" class="form-control" required>
						<option disabled selected>Select Department</option>
						<option value="Finance">Finance</option>
						<option value="Legal">Legal</option>
					</select><br/>
					<input type="text" name="username" value="<%= username%>" hidden />
					<input type="text" name="request_date" value="<%= new Date()%>" hidden/>
					<input type="submit" class="btn btn-primary btn-block" value="Send Request"/>
					</form>
				</fieldset>
			</div>
			<div class="col-md-4">
			<%ArrayList<ArrayList<String>> a = DbConnection.getRecord();
				int pending_finance_count=0;
				int approve_finance_count=0;
				int deny_finance_count=0;
				
				int pending_legal_count=0;
				int approve_legal_count=0;
				int deny_legal_count=0;
				for(ArrayList<String> b: a){
				if(b.get(8).equals("Pending"))
				{
					if(b.get(5).equals("Legal"))
					{
						pending_legal_count++;
					}
					if(b.get(5).equals("Finance"))
					{
						pending_finance_count++;
					}
					
				}
				if(b.get(8).equals("Approved"))
				{
					if(b.get(5).equals("Legal"))
					{
						approve_legal_count++;
					}
					if(b.get(5).equals("Finance"))
					{
						approve_finance_count++;
					}
				}
				if(b.get(8).equals("Denied"))
				{
					if(b.get(5).equals("Legal"))
					{
						deny_legal_count++;
					}
					if(b.get(5).equals("Finance"))
					{
						deny_finance_count++;
					}
				}
				}
				%>
				<fieldset>
				<legend>Summary Section</legend>
				<div class="row">
					<div class="col-md-12">
							<h5 align="center">Finance Department</h5>
							<p style="color:blue;"><span class="glyphicon glyphicon-ok "></span>&nbsp;Approved Requests: <%=approve_finance_count %></p>
							<p style="color:red;"><span class="glyphicon glyphicon-remove"></span>&nbsp;Deny Requests: <%=deny_finance_count %></p>
							<p style="color:green;"><span class="glyphicon glyphicon-retweet"></span>&nbsp;Pending Requests: <%=pending_finance_count %></p>
							<hr/>
							<h5 align="center">Legal Department</h5>
							<p style="color:blue;"><span class="glyphicon glyphicon-ok "></span>&nbsp;Approved Requests: <%=approve_legal_count %></p>
							<p style="color:red;"><span class="glyphicon glyphicon-remove"></span>&nbsp;Deny Requests: <%=deny_legal_count %></p>
							<p style="color:green;"><span class="glyphicon glyphicon-retweet"></span>&nbsp;Pending Requests: <%=pending_legal_count %></p>
					</div>	
				</div>
				</fieldset>
			</div>
			
		</div>
		<hr/>
			<div class="row">
				<div class="col-md-12">
				
					<table class="table table-striped">
						<tr>
							<th>Request ID</th>
							<th>Request Title</th>
							<th>Description</th>
							<th>Request Date</th>
							<th>Request Department</th>
							<th>Approval Person</th>
							<th>Approval Date</th>
							<th>Status</th>
						</tr>
						<%for(ArrayList<String> b: a){ %>
							<tr>
								<td><%=b.get(0)%></td>
								<td><%=b.get(1)%></td>
								<td><%=b.get(2)%></td>
								<td><%=b.get(4)%></td>
								<td><%=b.get(5)%></td>
								<td><%=b.get(6)%></td>
								<td><%=b.get(7)%></td>
								<% if(b.get(8).equals("Pending")){%>
								<td><p style='color:green;'><%=b.get(8)%></p></td>
								<% }if(b.get(8).equals("Approved")){%>
								<td><p style='color:blue;'><%=b.get(8)%></p></td>
								<% }if(b.get(8).equals("Denied")){%>
								<td><p style='color:red;'><%=b.get(8)%></p></td>
								<%} %>
							</tr>
						<%} %>
					</table>
					
				</div>
			</div>
	</div>
	<%} %>
</body>
</html>