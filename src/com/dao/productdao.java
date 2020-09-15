package com.dao;

import java.sql.*;
import java.util.*;


import com.dto.product;


public class productdao {

	
	public static List<String> getAllCategories() throws ClassNotFoundException, SQLException {
		Connection con=ConnectionUtility.getConnection();
		PreparedStatement ps=(PreparedStatement) con.prepareStatement("select distinct category from product");
		List<String>list=new ArrayList<String>();
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			list.add(rs.getString(1));
		}
		return list;
	}

	public static List<product> getAllproducts() throws ClassNotFoundException, SQLException {
		Connection con = ConnectionUtility.getConnection();
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("Select * from product");
		
		
		ResultSet rs = ps.executeQuery();

		List<product> list = new ArrayList<product>();
		product p = null;

		while (rs.next()) {
			p = new product(rs.getInt(1), rs.getString(2),rs.getInt(3), rs.getString(4),rs.getString(5));
			
			
			list.add(p);
			
		}

		return list;

	}

	public static List<product> distinctcategories(String c) throws SQLException, ClassNotFoundException {
		Connection con = ConnectionUtility.getConnection();
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("Select * from product where category=?");
		ps.setString(1,c);
		ResultSet rs=ps.executeQuery();
		
		
		List<product> list = new ArrayList<product>();
		product p=null;
		
		while(rs.next()){
			p = new product(rs.getInt(1), rs.getString(2),rs.getInt(3), rs.getString(4),rs.getString(5));
		  list.add(p);
		
		}
			
		
		
		return list;
	}

	public static product getItemwithId(int parseInt) throws ClassNotFoundException, SQLException {
		Connection con = ConnectionUtility.getConnection();
		PreparedStatement ps = con.prepareStatement("Select * from product where id=?");
		ps.setInt(1, parseInt);
		ResultSet rs=ps.executeQuery();
		
		product p=null;
		
		while(rs.next()){
		
			return (new product(rs.getInt(1), rs.getString(2),rs.getInt(3), rs.getString(4),rs.getString(5)));
		 
		
		}
		
		return null;
		
		
		
	}

	
	
	

}
