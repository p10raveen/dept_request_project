<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Finance Dashboard</title>
<%@ page import="java.util.Date,java.util.ArrayList,com.database.DbConnection" %>
<%@ include file="cdn.jsp"%>
</head>
<body>
	<%
	String username = (String) session.getAttribute("username");
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
						<p class="navbar-brand">Finance Dashboard</p>
					</div>
					
					<ul class="nav navbar-nav navbar-right">
						<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>
								Logout</a></li>
					</ul>
				</div>
			</nav>
		</div>
		
			<%ArrayList<ArrayList<String>> a = DbConnection.getRecordForLegal();
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
		<div class="row">	
			<div class="col-md-2">
				<fieldset>
				<legend>Summary</legend>
				<div class="row">
					<div class="col-md-12">
							<p style="color:blue;"><span class="glyphicon glyphicon-ok "></span>&nbsp;Approved Requests: <%=approve_legal_count %></p>
							<p style="color:red;"><span class="glyphicon glyphicon-remove"></span>&nbsp;Deny Requests: <%=deny_legal_count %></p>
							<p style="color:green;"><span class="glyphicon glyphicon-retweet"></span>&nbsp;Pending Requests: <%=pending_legal_count %></p>
					</div>	
				</div>
				</fieldset>
			</div>
			
				<div class="col-md-10">
					<fieldset>
					<legend>Request Status</legend>
					<table class="table table-striped table-bordered">
						<tr>
							<th>Request ID</th>
							<th>Request Title</th>
							<th>Description</th>
							<th>Request Date</th>
							<th>Request By</th>
							<th>Approval Person</th>
							<th>Approval Date</th>
							<th colspan="2">Status</th>
						</tr>
						<%for(ArrayList<String> b: a){ %>
							<tr>
								<td><%=b.get(0)%></td>
								<td><%=b.get(1)%></td>
								<td><%=b.get(2)%></td>
								<td><%=b.get(4)%></td>
								<td><%=b.get(3)%></td>
								<td><%=b.get(6)%></td>
								<td><%=b.get(7)%></td>
								<%
									if(b.get(8).equals("Pending"))
									{
										out.println("<td><a href='approvalRecord.jsp?request_id="+b.get(0)+"&username="+username+"&dept=Legal&status=Approved' class='btn btn-info' onClick='''approval('Approved')'''>Approve</a></td>");
										out.println("<td><a href='approvalRecord.jsp?request_id="+b.get(0)+"&username="+username+"&dept=Legal&status=Denied' class='btn btn-danger'>Deny</a></td>");
										
									}
									else
									{
										if(b.get(8).equals("Approved"))
										{
											out.println("<td colspan='2'><p align='center' style='color:blue;'>"+b.get(8)+"</p></td>");
										}
										else
										{
											out.println("<td colspan='2'><p align='center' style='color:red;'>"+b.get(8)+"</p></td>");
										}
									}
								%>
								
							</tr>
						<%} %>
					</table>
					<fieldset>
				</div>
			</div>
	</div>
	<%} %>
	
</body>
</html>