package com.projectttweb.webphone.model;

public class SoTaiKhoan {
private String iD;
private String stk;
private double soDu;
private String maPin;
private String nganHang;
public SoTaiKhoan(String iD,String stk, double soDu, String maPin, String nganHang) {
	this.iD = iD;
	this.stk = stk;
	this.soDu = soDu;
	this.maPin = maPin;
	this.nganHang = nganHang;
}
public String getStk() {
	return stk;
}
public void setStk(String stk) {
	this.stk = stk;
}
public double getSoDu() {
	return soDu;
}
public void setSoDu(double soDu) {
	this.soDu = soDu;
}

public String getMaPin() {
	return maPin;
}
public void setMaPin(String maPin) {
	this.maPin = maPin;
}
public String getNganHang() {
	return nganHang;
}
public void setNganHang(String nganHang) {
	this.nganHang = nganHang;
}
public String getiD() {
	return iD;
}
public void setiD(String iD) {
	this.iD = iD;
}





}
