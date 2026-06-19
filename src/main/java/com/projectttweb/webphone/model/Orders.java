package com.projectttweb.webphone.model;

import java.sql.Date;

public class Orders {
private String orderID;
private Date ordersDate;
private User user;
private String status;
private double totalAmount;
private String shippingAddress;
private String phone;
private String signatureStatus;
private String digitalSignature;
private String publicKeyUsed;
private java.sql.Timestamp signatureDeadline;

public Orders(String orderID, Date ordersDate, User user, String status, double totalAmount, String shippingAddress,
		String phone) {
	this.orderID = orderID;
	this.ordersDate = ordersDate;
	this.user = user;
	this.status = status;
	this.totalAmount = totalAmount;
	this.shippingAddress = shippingAddress;
	this.phone = phone;
	this.signatureStatus = "Chưa ký xác nhận"; // Default
}
public Orders(String orderID, Date ordersDate, User user, String status, double totalAmount, String shippingAddress,
		String phone, String signatureStatus, String digitalSignature, String publicKeyUsed, java.sql.Timestamp signatureDeadline) {
	this.orderID = orderID;
	this.ordersDate = ordersDate;
	this.user = user;
	this.status = status;
	this.totalAmount = totalAmount;
	this.shippingAddress = shippingAddress;
	this.phone = phone;
	this.signatureStatus = signatureStatus;
	this.digitalSignature = digitalSignature;
	this.publicKeyUsed = publicKeyUsed;
	this.signatureDeadline = signatureDeadline;
}
public String getOrderID() {
	return orderID;
}
public void setOrderID(String orderID) {
	this.orderID = orderID;
}
public Date getOrdersDate() {
	return ordersDate;
}
public void setOrdersDate(Date ordersDate) {
	this.ordersDate = ordersDate;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public double getTotalAmount() {
	return totalAmount;
}
public void setTotalAmount(double totalAmount) {
	this.totalAmount = totalAmount;
}
public String getShippingAddress() {
	return shippingAddress;
}
public void setShippingAddress(String shippingAddress) {
	this.shippingAddress = shippingAddress;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getSignatureStatus() {
	return signatureStatus;
}
public void setSignatureStatus(String signatureStatus) {
	this.signatureStatus = signatureStatus;
}
public String getDigitalSignature() {
	return digitalSignature;
}
public void setDigitalSignature(String digitalSignature) {
	this.digitalSignature = digitalSignature;
}
public String getPublicKeyUsed() {
	return publicKeyUsed;
}
public void setPublicKeyUsed(String publicKeyUsed) {
	this.publicKeyUsed = publicKeyUsed;
}
public java.sql.Timestamp getSignatureDeadline() {
	return signatureDeadline;
}
public void setSignatureDeadline(java.sql.Timestamp signatureDeadline) {
	this.signatureDeadline = signatureDeadline;
}

}
