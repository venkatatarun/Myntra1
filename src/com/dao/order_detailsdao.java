package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.dto.order_details;

public class order_detailsdao {

	public static boolean insert(int oid, int pid, int qno) throws ClassNotFoundException, SQLException {
		Connection con=ConnectionUtility.getConnection();
		PreparedStatement ps =  con.prepareStatement("insert into order_details(order_id,product_id,quantity) values (?,?,?)");
		ps.setInt(1, oid);
		ps.setInt(2, pid);
		ps.setInt(3, qno);
		int val=ps.executeUpdate();
		if(val>0)
			return true;
			
		return false;
	}

	

}
