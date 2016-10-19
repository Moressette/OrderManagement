package com.moressette.ordermanagement.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moressette.ordermanagement.dao.OrderlistDao;
import com.moressette.ordermanagement.dao.impl.OrderlistDaoimpl;
import com.moressette.ordermanagment.entity.Order;

/**
 * Servlet implementation class AddOrderServlet
 */
@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrderServlet() {
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
		String no = (String) request.getParameter("order_no");
		String consignee_name = (String) request.getParameter("consignee_name");
		String consignee_addr = (String) request.getParameter("consignee_addr");
		String consignee_phone = (String) request.getParameter("consignee_phone");
		double order_price = Double.valueOf(request.getParameter("order_price"));
		int order_amount = Integer.parseInt(request.getParameter("order_amount"));
		
		Order order = new Order();
		order.setNo(no);
		order.setConsignee_name(consignee_name);
		order.setConsignee_addr(consignee_addr);
		order.setConsignee_phone(consignee_phone);
		order.setOrder_price(order_price);
		order.setOrder_amount(order_amount);
		OrderlistDao od = new OrderlistDaoimpl();
		boolean flag = od.addOrder(order);
		if (flag) {
			out.print("<script>alert('订单添加成功');window.location.href=('AdminServlet');</script>");
		} else {
			out.print("<script>alert('该订单编号已存在');window.location.href=('AdminServlet');</script>");
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
