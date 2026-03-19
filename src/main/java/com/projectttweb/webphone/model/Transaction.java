package com.projectttweb.webphone.model;

import java.sql.Date;

public class Transaction {
private String transactionID;
private Orders order;
private String paymentMethods;
private String paymentStatus;
private Date transactionDate;
public Transaction(String transactionID, Orders order, String paymentMethods, String paymentStatus,
		Date transactionDate) {
	this.transactionID = transactionID;
	this.order = order;
	this.paymentMethods = paymentMethods;
	this.paymentStatus = paymentStatus;
	this.transactionDate = transactionDate;
}
public String getTransactionID() {
	return transactionID;
}
public void setTransactionID(String transactionID) {
	this.transactionID = transactionID;
}
public Orders getOrder() {
	return order;
}
public void setOrder(Orders order) {
	this.order = order;
}
public String getPaymentMethods() {
	return paymentMethods;
}
public void setPaymentMethods(String paymentMethods) {
	this.paymentMethods = paymentMethods;
}
public String getPaymentStatus() {
	return paymentStatus;
}
public void setPaymentStatus(String paymentStatus) {
	this.paymentStatus = paymentStatus;
}
public Date getTransactionDate() {
	return transactionDate;
}
public void setTransactionDate(Date transactionDate) {
	this.transactionDate = transactionDate;
}


}
