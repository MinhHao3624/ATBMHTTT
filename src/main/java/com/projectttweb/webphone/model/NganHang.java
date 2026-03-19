package com.projectttweb.webphone.model;

import java.util.LinkedHashMap;
import java.util.Map;

public class NganHang {
private Map<String, SoTaiKhoan> map = new LinkedHashMap<String, SoTaiKhoan>();

public NganHang(Map<String, SoTaiKhoan> map) {
	this.map = map;
}

public NganHang() {
	this.map.put("BIDV", new SoTaiKhoan("0001", "17284927462738", 12000, "4455", "BIDV"));
	this.map.put("Sacombank", new SoTaiKhoan("0002","98736471872453", 120000000, "6677", "Sacombank"));
	this.map.put("MoMo", new SoTaiKhoan("0003","12343258294762", 120000000, "9988", "MoMo"));
	this.map.put("MBBank", new SoTaiKhoan("0004","374826482122", 120000000, "2211", "MBBank"));
	this.map.put("TPBank", new SoTaiKhoan("0005","452378459182", 120000000, "6655", "TPBank"));
}

public Map<String, SoTaiKhoan> getMap() {
	return map;
}

public void setMap(Map<String, SoTaiKhoan> map) {
	this.map = map;
}



}
