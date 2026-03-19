package com.projectttweb.webphone.model;

public class Roles {
private int roleID;
private String roleName;
public Roles(int roleID, String roleName) {
	super();
	this.roleID = roleID;
	this.roleName = roleName;
}
public Roles() {
	super();
}
public int getRoleID() {
	return roleID;
}
public void setRoleID(int roleID) {
	this.roleID = roleID;
}
public String getRoleName() {
	return roleName;
}
public void setRoleName(String roleName) {
	this.roleName = roleName;
}
@Override
public String toString() {
	return "Roles [roleID=" + roleID + ", roleName=" + roleName + "]";
}


}
