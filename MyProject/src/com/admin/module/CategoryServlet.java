package com.admin.module;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.support.DBHandler;

public class CategoryServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String c_name=req.getParameter("cat_name");
			String c_desc=req.getParameter("cat_desc");
			DBHandler.addCategory(c_name,c_desc);
			resp.sendRedirect("admin.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Category crashed");
		}
	}
}
