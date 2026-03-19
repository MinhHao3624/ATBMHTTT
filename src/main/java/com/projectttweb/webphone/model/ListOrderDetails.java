package com.projectttweb.webphone.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ListOrderDetails {
private Map<Orders, ListOrderDetailsItem> map = new LinkedHashMap<Orders, ListOrderDetailsItem>();



public ListOrderDetails(Map<Orders, ListOrderDetailsItem> map) {
	super();
	this.map = map;
}



public ListOrderDetails() {
}




public Map<Orders, ListOrderDetailsItem> getMap() {
	return map;
}



public void setMap(Map<Orders, ListOrderDetailsItem> map) {
	this.map = map;
}



public void addPhanTu(Orders order, ListOrderDetailsItem listItem) {
	this.map.put(order, listItem);
}



}
