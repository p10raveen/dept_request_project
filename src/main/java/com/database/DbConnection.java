package com.database;


import java.sql.*;
import java.util.ArrayList;

public class DbConnection {

	public static Connection takeConnection()
	{
		Connection con = null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava","root","bhopal");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	
	public static boolean checkLogin(String username, String password, String role)
	{
		boolean status = false;
		try
		{
			Connection con = takeConnection();
			String query = "select * from department where username=? and password=? and role=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,username);
			ps.setString(2,password);
			ps.setString(3,role);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				status = true;
				break;
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	public static int  insertRecord(String username, String title, String description, String request_date, String request_dept)
	{
		int status = 0;
		try
		{
			Connection con = takeConnection();
			String query = "insert into approval(title, description,request_by,request_date,request_dept ) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,title);
			ps.setString(2,description);
			ps.setString(3,username);
			ps.setString(4,request_date);
			ps.setString(5,request_dept);
			status= ps.executeUpdate();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	public static ArrayList<ArrayList<String>> getRecord()
	{
		ArrayList<ArrayList<String>> a = new ArrayList<ArrayList<String>>();
		try
		{
			Connection con = takeConnection();
			String query = "select * from approval order by request_id desc";
			PreparedStatement ps = con.prepareStatement(query);
	
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ArrayList<String> b = new ArrayList<String>();
				b.add(rs.getString(1));
				b.add(rs.getString(2));
				b.add(rs.getString(3));
				b.add(rs.getString(4));
				b.add(rs.getString(5));
				b.add(rs.getString(6));
				b.add(rs.getString(7));
				b.add(rs.getString(8));
				b.add(rs.getString(9));
				a.add(b);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return a;
	}
	
	public static ArrayList<ArrayList<String>> getRecordForFinance()
	{
		ArrayList<ArrayList<String>> a = new ArrayList<ArrayList<String>>();
		try
		{
			Connection con = takeConnection();
			String query = "select * from approval where request_dept='Finance' order by request_id desc";
			PreparedStatement ps = con.prepareStatement(query);
	
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ArrayList<String> b = new ArrayList<String>();
				b.add(rs.getString(1));
				b.add(rs.getString(2));
				b.add(rs.getString(3));
				b.add(rs.getString(4));
				b.add(rs.getString(5));
				b.add(rs.getString(6));
				b.add(rs.getString(7));
				b.add(rs.getString(8));
				b.add(rs.getString(9));
				a.add(b);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return a;
	}
	
	public static ArrayList<ArrayList<String>> getRecordForLegal()
	{
		ArrayList<ArrayList<String>> a = new ArrayList<ArrayList<String>>();
		try
		{
			Connection con = takeConnection();
			String query = "select * from approval where request_dept='Legal' order by request_id desc";
			PreparedStatement ps = con.prepareStatement(query);
	
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ArrayList<String> b = new ArrayList<String>();
				b.add(rs.getString(1));
				b.add(rs.getString(2));
				b.add(rs.getString(3));
				b.add(rs.getString(4));
				b.add(rs.getString(5));
				b.add(rs.getString(6));
				b.add(rs.getString(7));
				b.add(rs.getString(8));
				b.add(rs.getString(9));
				a.add(b);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return a;
	}
	
	
	public static int  updateRecord(String request_id, String username, String status)
	{
		int i = 0;
		try
		{
			Connection con = takeConnection();
			String query = "update approval set status=?, approval_person=?, approval_date=? where request_id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,status);
			ps.setString(2,username);
			ps.setString(3,new java.util.Date().toString());
			ps.setString(4,request_id);
			i= ps.executeUpdate();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
	}
}
