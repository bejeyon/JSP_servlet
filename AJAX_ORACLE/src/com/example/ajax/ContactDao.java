package com.example.ajax;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ContactDao { //ΩÃ±€≈œ √≥∏Æ
	private static ContactDao contactDao;	
	public static ContactDao getInstance() {
		if(contactDao == null) {
			contactDao = new ContactDao();
		}		
		return contactDao;
	}		
	String url="jdbc:oracle:thin:@127.0.0.1:1521/xepdb1";
    String uid="hr";    String pwd="hr";
    String driver="oracle.jdbc.driver.OracleDriver";    
	private ContactDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}	
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = 
				DriverManager.getConnection(url, uid, pwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return conn;
	}	
	public void closeAll(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}		
	
	public List<ContactVO> getAllContacts() {
		String sql = 
				"select no, name, birth_date, email, phone, address "
				+ " from contact "
				+ " order by no";
		Connection conn = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<ContactVO> contacts = new ArrayList<ContactVO>();		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ContactVO contact = new ContactVO();
				contact.setNo(rs.getInt("no"));
				contact.setName(rs.getString("name"));
				contact.setBirthDate(rs.getDate("birth_date"));
				contact.setEmail(rs.getString("email"));
				contact.setPhone(rs.getString("phone"));
				contact.setAddress(rs.getString("address"));
				contacts.add(contact);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, stmt, rs);
		}		
		return contacts;
	}
	
	public void addContact(ContactVO contact) {
		String sql = "insert into contact ( no,name, birth_date, email, phone, address) " +
					" values(contact_seq.nextval,?, ?, ?, ?, ?)";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contact.getName());
			pstmt.setDate(2, new Date(contact.getBirthDate().getTime()));
			pstmt.setString(3, contact.getEmail());
			pstmt.setString(4, contact.getPhone());
			pstmt.setString(5, contact.getAddress());
			pstmt.execute();
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}
	
	public void modifyContact(ContactVO contact) {
		String sql = "update contact "
				+ " set name=?, birth_date=?, email=?, phone=?, address=? " 
				+ " where no=?";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contact.getName());
			pstmt.setDate(2, new Date(contact.getBirthDate().getTime()));
			pstmt.setString(3, contact.getEmail());
			pstmt.setString(4, contact.getPhone());
			pstmt.setString(5, contact.getAddress());
			pstmt.setInt(6, contact.getNo());
			pstmt.execute();
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}
	
	public void removeContact(int no) {
		String sql = "delete from contact "
				+ " where no=?";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.execute();
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}	
	
}//end class
