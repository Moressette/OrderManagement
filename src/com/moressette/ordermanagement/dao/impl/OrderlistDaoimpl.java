package com.moressette.ordermanagement.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import com.moressette.ordermanagement.DataSource.ConnectionManager;
import com.moressette.ordermanagement.DataSource.SQLManager;
import com.moressette.ordermanagement.dao.OrderlistDao;
import com.moressette.ordermanagment.entity.Order;
import com.mysql.jdbc.Connection;

public class OrderlistDaoimpl implements OrderlistDao{
	ConnectionManager connectionManager = new ConnectionManager();
	Connection connection = (Connection) connectionManager.openConnection();
	SQLManager sqlManager = new SQLManager();
	
	public List<Order> findAllOrder(){
		List<Order> list = new ArrayList<Order>();
		
		String strSQL = "select * from orderlist ORDER BY id DESC";
		Object[] params = {};
		ResultSet rs = sqlManager.execQuery(connection, strSQL, params);
		try {
			while (rs.next()) {
				Order od = new Order();
				od.setId(rs.getInt("id"));
				od.setNo(rs.getString("no"));
				od.setConsignee_name(rs.getString("consignee_name"));
				od.setConsignee_addr(rs.getString("consignee_addr"));
				od.setConsignee_phone(rs.getString("consignee_phone"));
				od.setOrder_price(rs.getDouble("order_price"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.CHINESE);
				String strTime = sdf.format(rs.getTimestamp("order_time"));
				System.out.println(strTime);
				od.setOrder_time(strTime);	
				od.setOrder_amount(rs.getInt("order_amount"));
				list.add(od);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean addOrder(Order order) {

		String strSQL = "insert into orderlist(no,consignee_name,consignee_addr,consignee_phone,order_price,order_time,order_amount) values(?,?,?,?,?,?,?)";
		Timestamp d = new Timestamp(System.currentTimeMillis());
		Object[] params = {order.getNo(),order.getConsignee_name(),order.getConsignee_addr(),order.getConsignee_phone(),order.getOrder_price(),d,order.getOrder_amount() };
		if (sqlManager.execUpdate(connection, strSQL, params) > 0) {
			return true;
		}
		return false;
	}
	
	public Order findOrderByID(int id){
		Order od = new Order();
		String strSQL = "select * from orderlist where id=?";
		Object[] params = {id};
		ResultSet rs = sqlManager.execQuery(connection, strSQL, params);
		try {
			while (rs.next()) {
				od.setId(rs.getInt("id"));
				od.setNo(rs.getString("no"));
				od.setConsignee_name(rs.getString("consignee_name"));
				od.setConsignee_addr(rs.getString("consignee_addr"));
				od.setConsignee_phone(rs.getString("consignee_phone"));
				od.setOrder_price(rs.getDouble("order_price"));
				//od.setOrder_time(rs.getTimestamp("order_time"));				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.CHINESE);
				String strTime = sdf.format(rs.getTimestamp("order_time"));
				System.out.println(strTime);
				od.setOrder_time(strTime);				
				od.setOrder_amount(rs.getInt("order_amount"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return od;
	}
	
	public boolean updateOrder(Order order) {
		String strSQL = "update orderlist set consignee_addr=?,consignee_phone=?,order_price=? where id = ?";
		Object[] params = { order.getConsignee_addr(),order.getConsignee_phone(),order.getOrder_price(),order.getId() };
		if (sqlManager.execUpdate(connection, strSQL, params) > 0) {
			return true;
		}
		return false;
	}
	
	public boolean deleteOrder(int id){
		String strSQL = "delete from orderlist where id = ? ";
		Object[] params = { id };
		if (sqlManager.execUpdate(connection, strSQL, params) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public Order findOrderByNo(String no){
		Order od = new Order();
		String strSQL = "select * from orderlist where no=?";
		Object[] params = {no};
		ResultSet rs = sqlManager.execQuery(connection, strSQL, params);
		try {
			if (rs.next()) {
				od.setId(rs.getInt("id"));
				od.setNo(rs.getString("no"));
				od.setConsignee_name(rs.getString("consignee_name"));
				od.setConsignee_addr(rs.getString("consignee_addr"));
				od.setConsignee_phone(rs.getString("consignee_phone"));
				od.setOrder_price(rs.getDouble("order_price"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.CHINESE);
				String strTime = sdf.format(rs.getTimestamp("order_time"));
				System.out.println(strTime);
				od.setOrder_time(strTime);	
				od.setOrder_amount(rs.getInt("order_amount"));
				return od;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Order> findOrderByPrice(double low,double high){
		List<Order> list = new ArrayList<Order>();
		String strSQL = "select * from orderlist where order_price between ? and ? ORDER BY order_price";
		Object[] params = {low,high};
		ResultSet rs = sqlManager.execQuery(connection, strSQL, params);
		try {
			while (rs.next()) {
				Order od = new Order();
				od.setId(rs.getInt("id"));
				od.setNo(rs.getString("no"));
				od.setConsignee_name(rs.getString("consignee_name"));
				od.setConsignee_addr(rs.getString("consignee_addr"));
				od.setConsignee_phone(rs.getString("consignee_phone"));
				od.setOrder_price(rs.getDouble("order_price"));
				//Format Time
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.CHINESE);
				String strTime = sdf.format(rs.getTimestamp("order_time"));
				System.out.println(strTime);
				//Format time END
				od.setOrder_time(strTime);	
				od.setOrder_amount(rs.getInt("order_amount"));
				list.add(od);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
}
