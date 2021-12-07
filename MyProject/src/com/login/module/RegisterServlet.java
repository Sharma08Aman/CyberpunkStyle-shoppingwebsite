package com.login.module;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.support.DBHandler;

public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//fetch registration values
		String reg_uname=req.getParameter("uname");
		String reg_email=req.getParameter("email");
		String reg_pass=req.getParameter("pwd");
		try {
			DBHandler.insert(reg_uname,reg_email,reg_pass);
			//resp.getWriter().print("registration successful");
			HttpSession sess = req.getSession();
			sess.setAttribute("mesg","REGISTRATION SUCCESSFULL FOR USER : "+reg_uname);
			resp.sendRedirect("login.jsp");			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Some problem occurred");
		}
	}
}
