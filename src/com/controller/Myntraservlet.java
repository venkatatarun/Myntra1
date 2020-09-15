package com.controller;

import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.order_detailsdao;
import com.dao.ordersdao;
import com.dao.productdao;
import com.dao.userdao;
import com.dto.order_details;
import com.dto.orders;
import com.dto.product;

@WebServlet("/Myntraservlet")
public class Myntraservlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String button = request.getParameter("bt");
		HttpSession se = request.getSession();
		PrintWriter pw = response.getWriter();

		if (button == null) {
			List<String> cList;
			List<product> list;
			try {
				cList = productdao.getAllCategories();
				list = productdao.getAllproducts();
				se.setAttribute("list", list);

				se.setAttribute("cList", cList);
				request.getRequestDispatcher("login.jsp").forward(request, response);

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String button = request.getParameter("bt");
		PrintWriter pw = response.getWriter();
		HttpSession se = request.getSession();
		if (button.equals("Register")) {

			String n = request.getParameter("f1");

			String e = request.getParameter("f2");
			String p = request.getParameter("f3");

			try {
				boolean check = userdao.checkEmailExistsorNot(e);
				if (check) {

					pw.println("already exists");

				} else {
					boolean insert = userdao.register(n, e, p);
					if (insert) {
						pw.println("Registered sucessfully");
						request.getRequestDispatcher("register.jsp").forward(request, response);

					} else {
						pw.println("Registration not sucessfull");
					}

				}

			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

		}

		else if (button.equals("Login")) {
			String e = request.getParameter("t1");
			String p = request.getParameter("t2");

			try {
				boolean login = userdao.emailexistsornot(e, p);
				String welcomename = userdao.getnameafterwelcome(e);
				int uid = userdao.getIdUsingEmail(e);
				se.setAttribute("uid", uid);
				if (login) {
					pw.println("logged in");
					se.setAttribute("n", welcomename);
					request.getRequestDispatcher("loginhome.jsp").forward(request, response);
				} else {
					pw.println("incorret credentials");
				}
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} else if (button.equals("Go")) {
			List<product> list;
			String c = request.getParameter("category");

			try {
				list = productdao.distinctcategories(c);
				se.setAttribute("list", list);

				request.getRequestDispatcher("login.jsp").forward(request, response);

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (button.equals("Add to Cart")) {

			String id[] = request.getParameterValues("id");
			String quantity[] = request.getParameterValues("qty");

			List<product> selecteditemlist = new ArrayList<product>();
			List<String> qlist = new ArrayList<String>();

			product pb = null;
			int tp = 0;
			if (se.getAttribute("selecteditemlist") == null) {
				for (int i = 0; i < quantity.length; i++) {

					try {
						if (Integer.parseInt(quantity[i]) > 0) {

							pb = productdao.getItemwithId(Integer.parseInt(id[i]));
							tp = tp + (pb.getPrice() * Integer.parseInt(quantity[i]));
							selecteditemlist.add(pb);
							qlist.add(quantity[i]);
						}
					} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			} else {
				selecteditemlist=(List<product>) se.getAttribute("selecteditemlist");
				qlist=(List<String>) se.getAttribute("qlist");
                    
				for (int i = 0; i < quantity.length; i++) {

					try {
						if (Integer.parseInt(quantity[i]) > 0) {
                            
							pb = productdao.getItemwithId(Integer.parseInt(id[i]));
							tp = tp + (pb.getPrice() * Integer.parseInt(quantity[i]));
							selecteditemlist.add(pb);
							qlist.add(quantity[i]);
						}
					} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			}
			se.setAttribute("selecteditemlist", selecteditemlist);
			se.setAttribute("qlist", qlist);
			se.setAttribute("tp", tp);

			request.getRequestDispatcher("cart.jsp").forward(request, response);
		} else if (button.equals("Continue")) {
			int uid = (int) se.getAttribute("uid");
			int totalPrice = (int) se.getAttribute("tp");
			int c = 0;
			Date d = new Date();
			Timestamp ts = new Timestamp(d.getTime());
			//System.out.println("time"+ts);
			List<product> selecteditemlist = (List<product>) se.getAttribute("selecteditemlist");
			List<String> qlist = (List<String>) se.getAttribute("qlist");

			try {
				boolean insert = ordersdao.insertdetailsbyuid(uid, totalPrice, ts);
				int oid = ordersdao.getorderId(uid, ts);
				if (insert) {
					for (int i = 0; i < selecteditemlist.size(); i++) {
						int pid = (int) selecteditemlist.get(i).getId();
						int qno = Integer.parseInt(qlist.get(i));
						boolean insertorderdetails = order_detailsdao.insert(oid, pid, qno);
						if (insertorderdetails) {
							c++;
						}

					}
				}

				if (c == selecteditemlist.size()) {
					request.getRequestDispatcher("final.jsp").forward(request, response);
				} else {
					pw.println("not inserted in orderdetails table");
				}
				/*
				 * if (insert) { System.out.println("Inserted Successfully");
				 * request.getRequestDispatcher("final.jsp").forward( request,
				 * response); } else { pw.println("Not Inserted"); }
				 */

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
}
