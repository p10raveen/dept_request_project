<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.database.DbConnection" %>
<%
String username = request.getParameter("username");
String request_id = request.getParameter("request_id");
String status = request.getParameter("status");
String departement = request.getParameter("dept");

int i = DbConnection.updateRecord(request_id, username, status);
if(i==1 && departement.equals("Finance"))
{
	response.sendRedirect("financeDashboard.jsp");
}
else if(i==1 && departement.equals("Legal"))
{
	response.sendRedirect("legalDashboard.jsp");
}
else if(i==0 && departement.equals("Finance"))
{
	response.sendRedirect("financeDashboard.jsp");
}
else if(i==0 && departement.equals("Legal"))
{
	response.sendRedirect("legalDashboard.jsp");
}
%>