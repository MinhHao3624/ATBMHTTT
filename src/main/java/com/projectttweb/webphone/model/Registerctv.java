package com.projectttweb.webphone.model;

import java.sql.Date;

public class Registerctv {
	private String iD;
	private User userID;
	private Date dateRegister;
	private int sospdadangban;
	private int sospdathuhoi;
	private int sospbantrongthang;
	private String soTienKiemDuoc;
	public Registerctv(String iD, User userID, Date dateRegister, int sospdadangban, int sospdathuhoi,
			int sospbantrongthang, String soTienKiemDuoc) {
		this.iD = iD;
		this.userID = userID;
		this.dateRegister = dateRegister;
		this.sospdadangban = sospdadangban;
		this.sospdathuhoi = sospdathuhoi;
		this.sospbantrongthang = sospbantrongthang;
		this.soTienKiemDuoc = soTienKiemDuoc;
	}
	public String getiD() {
		return iD;
	}
	public void setiD(String iD) {
		this.iD = iD;
	}
	public User getUserID() {
		return userID;
	}
	public void setUserID(User userID) {
		this.userID = userID;
	}
	public Date getDateRegister() {
		return dateRegister;
	}
	public void setDateRegister(Date dateRegister) {
		this.dateRegister = dateRegister;
	}
	public int getSospdadangban() {
		return sospdadangban;
	}
	public void setSospdadangban(int sospdadangban) {
		this.sospdadangban = sospdadangban;
	}
	public int getSospdathuhoi() {
		return sospdathuhoi;
	}
	public void setSospdathuhoi(int sospdathuhoi) {
		this.sospdathuhoi = sospdathuhoi;
	}
	public int getSospbantrongthang() {
		return sospbantrongthang;
	}
	public void setSospbantrongthang(int sospbantrongthang) {
		this.sospbantrongthang = sospbantrongthang;
	}
	public String getSoTienKiemDuoc() {
		return soTienKiemDuoc;
	}
	public void setSoTienKiemDuoc(String soTienKiemDuoc) {
		this.soTienKiemDuoc = soTienKiemDuoc;
	}
	
	
	
	

}
