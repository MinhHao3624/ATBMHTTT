package com.projectttweb.webphone.model;

public class TheCao {
	private String nhaMang;
	private String soSeri;
	private String maThe;
	private String menhGia;
	public TheCao(String nhaMang, String soSeri, String maThe, String menhGia) {
		this.nhaMang = nhaMang;
		this.soSeri = soSeri;
		this.maThe = maThe;
		this.menhGia = menhGia;
	}
	public String getNhaMang() {
		return nhaMang;
	}
	public void setNhaMang(String nhaMang) {
		this.nhaMang = nhaMang;
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
	
	

}
