package com.exam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.exam.beans.Employee;

public class EmployeeDAO {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn =
			DriverManager.getConnection(url, "system", "1234");
		return conn;
	}
	public static List<Employee> getAllRecords() throws ClassNotFoundException, SQLException{
		List<Employee> s = new ArrayList<Employee>();
		Connection conn = getConnection();
		
		String strSql = "SELECT * FROM EMPLOYEE ORDER BY ID ASC";
		PreparedStatement stmt = conn.prepareStatement(strSql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Employee d = new Employee();
			d.setId(rs.getInt("ID"));
			d.setName(rs.getString("NAME"));
			d.setEmail(rs.getString("EMAIL"));
			s.add(d);
		}
		return s;
	}
	public static Employee getRecordById(int id) throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		String strSql = "SELECT * FROM EMPLOYEE WHERE ID=?";
		PreparedStatement stmt = conn.prepareStatement(strSql);
		stmt.setInt(1, id);
		ResultSet rs =stmt.executeQuery();
		Employee d = null;
		while(rs.next()) {
			d = new Employee();
			d.setId(rs.getInt("ID"));
			d.setName(rs.getString("NAME"));
			d.setEmail(rs.getString("EMAIL"));
		}
		return d;
	}
	
	// Insert Data to Table
	public static int save(Employee d) throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		String strSql = "INSERT INTO EMPLOYEE VALUES(?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(strSql);
		stmt.setInt(1,d.getId());
		stmt.setString(2, d.getName());
		stmt.setString(3, d.getEmail());
		int ret = stmt.executeUpdate();
		return ret;
	}
	
	// Delete Data from Table
	public static int delete(int id) throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		String strSql = "DELETE FROM EMPLOYEE WHERE ID = ?";
		PreparedStatement stmt = conn.prepareStatement(strSql);
		stmt.setInt(1,id);
		int ret = stmt.executeUpdate();
		return ret;
	}
		
	// Update Data in Table
	public static int update(int id, String name, String EMAIL) throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		String strSql = "UPDATE EMPLOYEE SET NAME = ?, EMAIL = ? WHERE ID = ?";
		PreparedStatement stmt = conn.prepareStatement(strSql);
		stmt.setInt(3,id);
		stmt.setString(1, name);
		stmt.setString(2, EMAIL);
		int ret = stmt.executeUpdate();
		return ret;
	}
	
	
}