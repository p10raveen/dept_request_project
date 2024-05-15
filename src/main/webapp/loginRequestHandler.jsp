<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.database.DbConnection" %>
<%

String username = request.getParameter("username");
String password = request.getParameter("password");
String role = request.getParameter("role");

boolean status = DbConnection.checkLogin(username, password, role);

if(status == true )
{
	session.setAttribute("username", username);
	if(role.equals("Management"))
	{
		response.sendRedirect("managementDashboard.jsp");
	}
	else if(role.equals("Finance"))
	{
		response.sendRedirect("financeDashboard.jsp");
	}
	else if(role.equals("Legal"))
	{
		response.sendRedirect("legalDashboard.jsp");
	}	
}
else
{
	response.sendRedirect("index.jsp?status=false");
}

%>