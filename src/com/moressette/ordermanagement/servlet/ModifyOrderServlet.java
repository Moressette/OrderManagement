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
 * Servlet implementation class ModifyOrderServlet
 */
@WebServlet("/ModifyOrderServlet")
public class ModifyOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		Order singleOrder = (Order)request.getSession().getAttribute("order");
		int order_id = singleOrder.getId();
		String consignee_addr = (String) request.getParameter("consignee_addr");
		String consignee_phone = (String) request.getParameter("consignee_phone");
		double order_price = Double.valueOf(request.getParameter("order_price"));
		
		//Test System.out.println(order_id+consignee_addr+consignee_phone+order_price);
		Order order = new Order();
		order.setId(order_id);
		order.setConsignee_addr(consignee_addr);
		order.setConsignee_phone(consignee_phone);
		order.setOrder_price(order_price);
		OrderlistDao od = new OrderlistDaoimpl();
		boolean flag = od.updateOrder(order);
		if (flag) {
			out.print("<script>alert('订单修改成功');window.location.href=('AdminServlet');</script>");
		} else {
			out.print("<script>alert('订单修改失败');window.location.href=('AdminServlet');</script>");
		}
	}

}
