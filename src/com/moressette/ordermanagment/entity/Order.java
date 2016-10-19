package com.moressette.ordermanagment.entity;

import java.sql.Timestamp;

public class Order {

	private int id;
	private String no;
	private String consignee_name;
	private String consignee_addr;
	private String consignee_phone;
	private double order_price;
	private String order_time;
	private int order_amount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getConsignee_name() {
		return consignee_name;
	}
	public void setConsignee_name(String consignee_name) {
		this.consignee_name = consignee_name;
	}
	public String getConsignee_addr() {
		return consignee_addr;
	}
	public void setConsignee_addr(String consignee_addr) {
		this.consignee_addr = consignee_addr;
	}
	public String getConsignee_phone() {
		return consignee_phone;
	}
	public void setConsignee_phone(String consignee_phone) {
		this.consignee_phone = consignee_phone;
	}
	public double getOrder_price() {
		return order_price;
	}
	public void setOrder_price(double order_price) {
		this.order_price = order_price;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	
}
