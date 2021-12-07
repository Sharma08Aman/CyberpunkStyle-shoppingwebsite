package com.support;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBHandler {
	static Connection con;
	//establishing connection
	public static void establishCon(){
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String usr="system";
		String pw="system";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(url,usr,pw);
		} catch (Exception e) {
			System.out.println("Some Problem occurred");// TODO: handle exception
		}
		
	}
	//inserting into database
	public static void insert(String user, String mail, String password) throws SQLException{
		establishCon();
		String sql="insert into user_data values(?,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, user);
		st.setString(2, mail);
		st.setString(3, password);
		st.executeUpdate();
		con.commit();
	}
	//login password logic check
	public static String getPass(String user) throws SQLException{
		establishCon();
		String sql="Select password from user_info where username =?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1,user);
		ResultSet rs=st.executeQuery();
		rs.next();
		return rs.getString(1);		
	}
	//category database entry
	public static void addCategory(String c_name, String c_desc) throws SQLException{
		establishCon();
		String sql="insert into Category values(?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, c_name);
		st.setString(2, c_desc);
		st.executeUpdate();
		con.commit();
	}
	//counting users
	public static int getUserCount(){
		establishCon();
		String sql="select count(*) from user_info";
		try {
			Statement st=con.prepareStatement(sql);
			ResultSet rs=st.executeQuery(sql);
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			System.out.println("Couldn't count user");
		}
		return 0;
	}
	public static int getCatCount(){
		establishCon();
		String sql="select count(*) from category";
		try {
			Statement st= con.prepareStatement(sql);
			ResultSet rs=st.executeQuery(sql);
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			System.out.println("Couldn't count categories");
		}
		return 0;
	}
	public static ArrayList getCat(){
		establishCon();
		ArrayList<String> al=new ArrayList<String>();
		String sql="select * from category";
		try {
			Statement st= con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()==true)
			{
				al.add(rs.getString(1)+" : "+rs.getString(2));
			}
			
			return al;
		} catch (Exception e) {
			System.out.println("Couldn't see categories");
		}
		return al;
	}	
	public static void addItem(String p_name, int p_price, String p_desc, String img_name) throws SQLException{
		establishCon();
		String sql="insert into Product values(?,?,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, p_name);
		st.setInt(2, p_price);
		st.setString(3, p_desc);
		st.setString(4, img_name);
		st.executeUpdate();
		con.commit();
	}
	
	public static ArrayList getProductImg(){
		establishCon();
		ArrayList<String> al=new ArrayList<String>();
		String sql="select * from Product";
		try {
			Statement st= con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()==true)
			{
				//al.add(rs.getString(1)+" : "+rs.getString(2)+" : "+rs.getString(3)+" : "+
				al.add(rs.getString(4));
			}
			
			return al;
		} catch (Exception e) {
			System.out.println("Couldn't see categories");
		}
		return al;
	}
	public static ArrayList getProduct(){
		establishCon();
		ArrayList<String> al=new ArrayList<String>();
		String sql="select * from Product";
		try {
			Statement st= con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()==true)
			{
				al.add(rs.getString(1)+" : Rs."+rs.getString(2)+" : "+rs.getString(3));
				//al.add(rs.getString(4));
			}
			
			return al;
		} catch (Exception e) {
			System.out.println("Couldn't see categories");
		}
		return al;
	}

}
