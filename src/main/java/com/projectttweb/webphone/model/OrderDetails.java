package com.projectttweb.webphone.model;

import java.util.List;

public class OrderDetails {
private String orderDetailsID;
private int quantity;
private Product product;
private Orders order;
private double unitPrice;
public OrderDetails(String orderDetailsID, int quantity, Product product, Orders order, double unitPrice) {
	this.orderDetailsID = orderDetailsID;
	this.quantity = quantity;
	this.product = product;
	this.order = order;
	this.unitPrice = unitPrice;
}
public OrderDetails() {
	super();
}
public String getOrderDetailsID() {
	return orderDetailsID;
}
public void setOrderDetailsID(String orderDetailsID) {
	this.orderDetailsID = orderDetailsID;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
public Orders getOrder() {
	return order;
}
public void setOrder(Orders order) {
	this.order = order;
}
public double getUnitPrice() {
	return unitPrice;
}
public void setUnitPrice(double unitPrice) {
	this.unitPrice = unitPrice;
}



}
