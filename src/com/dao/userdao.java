package com.dao;

import java.sql.*;



public class userdao {

	

	public static boolean checkEmailExistsorNot(String e) throws ClassNotFoundException, SQLException {
		Connection con=ConnectionUtility.getConnection();
		PreparedStatement ps =  con.prepareStatement("Select * from user where email=?");
		ps.setString(1, e);
		ResultSet rs = ps.executeQuery();
		if (rs.next())
			return true;

		return false;
	}
	public static boolean register(String n,String e,String p) throws ClassNotFoundException, SQLException {
		Connection con=ConnectionUtility.getConnection();
		PreparedStatement ps =  con.prepareStatement("insert into user(name,email,password) values(?,?,?)");

		ps.setString(1, n);
		ps.setString(2, e);
		ps.setString(3, p);

		if (ps.executeUpdate() > 0)
			return true;

		return false;
	}
	public static boolean emailexistsornot(String n, String p) throws SQLException, ClassNotFoundException {
		Connection con=ConnectionUtility.getConnection();
		PreparedStatement ps =  con.prepareStatement("select * from user where email=? && password=?");
		ps.setString(1,n);
		ps.setString(2, p);
		ResultSet rs=ps.executeQuery();
		
		if(rs.next())
			return true;
		
		
		return false;
	}
	public static String getnameafterwelcome(String e) throws ClassNotFoundException, SQLException {
		Connection con=ConnectionUtility.getConnection();
		PreparedStatement ps =  con.prepareStatement("select name from user where email=?");
		ps.setString(1, e);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
			return rs.getString(1);
		return null;
	}
	public static int getIdUsingEmail(String e) throws ClassNotFoundException, SQLException {
		Connection con=ConnectionUtility.getConnection();
		PreparedStatement ps =  con.prepareStatement("select id from user where email=?");
		ps.setString(1, e);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
			return rs.getInt(1);
		
		return 0;
	}
			
		
		
		
	}


