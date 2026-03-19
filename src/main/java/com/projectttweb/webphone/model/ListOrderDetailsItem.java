package com.projectttweb.webphone.model;

import java.util.ArrayList;
import java.util.List;

public class ListOrderDetailsItem {
private List<OrderDetails> list = new ArrayList<OrderDetails>();

public ListOrderDetailsItem(List<OrderDetails> list) {
	this.list = list;
}

public ListOrderDetailsItem() {
	super();
}

public List<OrderDetails> getList() {
	return list;
}

public void setList(List<OrderDetails> list) {
	this.list = list;
}
public void addItem(OrderDetails orderDetails) {
	this.list.add(orderDetails);
}

public double getTotalAmount() {
	// TODO Auto-generated method stub
	double res = 0;
	for (OrderDetails orderDetails : list) {
		res += orderDetails.getUnitPrice();
	}
	return res;
}


}
