package com.admin.module;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.support.DBHandler;
@MultipartConfig
public class ProductServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String p_name = req.getParameter("item_name");
			int p_price = Integer.parseInt(req.getParameter("item_price"));
			String p_desc = req.getParameter("item_desc");
			Part p_img = req.getPart("item_img");
			String img_name = p_img.getSubmittedFileName();
			DBHandler.addItem(p_name, p_price, p_desc, img_name);
			
			//path finder
			String path = req.getRealPath("img/item_img/")+""+p_img.getSubmittedFileName();
			System.out.println(path);
			
			FileOutputStream fos = new FileOutputStream(path);
			InputStream is = p_img.getInputStream();
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			is.close();
			
			
			resp.sendRedirect("admin.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Add Item failed");
		}
	}
}
