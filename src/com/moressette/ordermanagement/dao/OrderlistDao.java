package com.moressette.ordermanagement.dao;

import java.util.List;

import com.moressette.ordermanagment.entity.Order;

public interface OrderlistDao {
	public List<Order> findAllOrder();
	public boolean addOrder(Order order);
	public Order findOrderByID(int id);
	public boolean updateOrder(Order order);
	public boolean deleteOrder(int id);
	public Order findOrderByNo(String no);
	public List<Order> findOrderByPrice(double low,double high);
}
