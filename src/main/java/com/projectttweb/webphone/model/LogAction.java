package com.projectttweb.webphone.model;

import java.sql.Date;

public class LogAction {
	private String iDLog;
	private String level;
	private Date khiNao;
	private String oDau;
	private String resource;
	private User user;
	private String dataBefore;
	private String dataAfter;
	public LogAction(String iDLog, String level, Date khiNao, String oDau, String resource, User user,
			String dataBefore, String dataAfter) {
		this.iDLog = iDLog;
		this.level = level;
		this.khiNao = khiNao;
		this.oDau = oDau;
		this.resource = resource;
		this.user = user;
		this.dataBefore = dataBefore;
		this.dataAfter = dataAfter;
	}
	public String getiDLog() {
		return iDLog;
	}
	public void setiDLog(String iDLog) {
		this.iDLog = iDLog;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public Date getKhiNao() {
		return khiNao;
	}
	public void setKhiNao(Date khiNao) {
		this.khiNao = khiNao;
	}
	public String getoDau() {
		return oDau;
	}
	public void setoDau(String oDau) {
		this.oDau = oDau;
	}
	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getDataBefore() {
		return dataBefore;
	}
	public void setDataBefore(String dataBefore) {
		this.dataBefore = dataBefore;
	}
	public String getDataAfter() {
		return dataAfter;
	}
	public void setDataAfter(String dataAfter) {
		this.dataAfter = dataAfter;
	}
	
	

}
