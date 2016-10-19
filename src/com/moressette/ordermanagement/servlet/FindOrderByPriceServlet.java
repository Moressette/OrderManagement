package com.moressette.ordermanagement.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moressette.ordermanagement.dao.OrderlistDao;
import com.moressette.ordermanagement.dao.impl.OrderlistDaoimpl;
import com.moressette.ordermanagment.entity.Order;

/**
 * Servlet implementation class FindOrderByPriceServlet
 */
@WebServlet("/FindOrderByPriceServlet")
public class FindOrderByPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindOrderByPriceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		
		double low = Double.valueOf((request.getParameter("low")));
		double high = Double.valueOf((request.getParameter("high")));
		OrderlistDao orderlistdao = new OrderlistDaoimpl();
		List<Order> orderFind = orderlistdao.findOrderByPrice(low,high);
		if(!orderFind.isEmpty()){
		request.getSession().setAttribute("orderFind", orderFind);
		out.print("<script>window.location.href=('detail.jsp');</script>");
		}else{
			out.print("<script>alert('找不到符合要求的订单');window.location.href=('admin.jsp');</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
