package com.projectttweb.webphone.model;

import java.sql.Date;

public class CardRechargeHistory {
private String idCard;
private User user;
private String soSeri;
private String maThe;
private String menhGia;
private String status;
private String soTienReal;
private String nhaMang;
private Date ngayNap;
public CardRechargeHistory(String idCard, User user, String soSeri, String maThe, String menhGia, String status,
		String soTienReal, String nhaMang, Date date) {
	this.idCard = idCard;
	this.user = user;
	this.soSeri = soSeri;
	this.maThe = maThe;
	this.menhGia = menhGia;
	this.status = status;
	this.soTienReal = soTienReal;
	this.nhaMang = nhaMang;
	this.ngayNap = date;
}
public String getIdCard() {
	return idCard;
}
public void setIdCard(String idCard) {
	this.idCard = idCard;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public String getSoSeri() {
	return soSeri;
}
public void setSoSeri(String soSeri) {
	this.soSeri = soSeri;
}
public String getMaThe() {
	return maThe;
}
public void setMaThe(String maThe) {
	this.maThe = maThe;
}
public String getMenhGia() {
	return menhGia;
}
public void setMenhGia(String menhGia) {
	this.menhGia = menhGia;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getSoTienReal() {
	return soTienReal;
}
public void setSoTienReal(String soTienReal) {
	this.soTienReal = soTienReal;
}
public String getNhaMang() {
	return nhaMang;
}
public void setNhaMang(String nhaMang) {
	this.nhaMang = nhaMang;
}
public Date getNgayNap() {
	return ngayNap;
}
public void setNgayNap(Date ngayNap) {
	this.ngayNap = ngayNap;
}




}
