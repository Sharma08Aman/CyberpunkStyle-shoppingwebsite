package com.login.module;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.support.DBHandler;

public class LoginServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out= resp.getWriter();
		//fetching values from web page- login form
		String wb_uname=req.getParameter("usrnm");
		String wb_pass=req.getParameter("pswd");
		//fetch password for user wb_uname from database
		String db_pass ="";
		try {
			db_pass = DBHandler.getPass(wb_uname);			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Login Interrupted");
		}
		
		if(wb_pass.equals(db_pass)){
			HttpSession sess=req.getSession();
			sess.setAttribute("user", wb_uname);
			if(wb_uname.equals("admin")){
				resp.sendRedirect("admin.jsp");
			}
			else{
				resp.sendRedirect("home.jsp");
			}
		}
		else{
			resp.sendRedirect("login.jsp");
		}
	}
}
