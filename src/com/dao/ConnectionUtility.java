package com.dao;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class ConnectionUtility {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");

		return (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Myntra", "root", "root");

	}


}
