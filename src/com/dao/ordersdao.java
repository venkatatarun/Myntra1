package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import com.dto.orders;

public class ordersdao {

	public static boolean insertdetailsbyuid(int uid, int totalPrice, Timestamp ts) throws ClassNotFoundException, SQLException {
		Connection con=ConnectionUtility.getConnection();
		PreparedStatement ps =  con.prepareStatement("insert into orders(user_id,total_amount,order_date) values(?,?,?)");
		ps.setInt(1, uid);
		ps.setInt(2, totalPrice);
		ps.setTimestamp(3, ts);
		if(ps.executeUpdate()>0)
			return true;
		
		return false;
	}

	public static int getorderId(int uid, Timestamp ts) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Connection con=ConnectionUtility.getConnection();
		PreparedStatement ps =  con.prepareStatement("select id from orders where user_id=? and order_date=?");
		ps.setInt(1, uid);
		ps.setTimestamp(2, ts);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
			return rs.getInt(1);

		return 0;
	}
	
	

	

}
