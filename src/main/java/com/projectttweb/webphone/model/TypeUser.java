package com.projectttweb.webphone.model;

public class TypeUser {
	private String iD;
	private String typeName;
	public TypeUser(String iD, String typeName) {
		this.iD = iD;
		this.typeName = typeName;
	}
	public String getiD() {
		return iD;
	}
	public void setiD(String iD) {
		this.iD = iD;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	

}
