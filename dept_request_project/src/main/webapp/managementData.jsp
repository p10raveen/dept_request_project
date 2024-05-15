<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.database.DbConnection" %>
<% 
	String username = request.getParameter("username");
	String title = request.getParameter("title");
	String description = request.getParameter("description");
	String request_date = request.getParameter("request_date");
	String request_dept = request.getParameter("department");
	
	int status = DbConnection.insertRecord(username, title, description, request_date, request_dept);
	
	response.sendRedirect("managementDashboard.jsp");

%>