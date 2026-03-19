package com.projectttweb.webphone.model;

import java.sql.Date;

public class User {
private String userID;
private String userName;
private String passWord;
private String fullName;
private String email;
private String phoneNumber;
private Roles role;
private Date dateOfBirth;
private String sex;
private String address;
private Date createAt;
private String authenticationCode;
private Date confirmationTime;
private int status;
private String imageAvatar;
private String isKey;
private String soDu;
private String typeUser;
private int age;
private String cccd;
private String degree;
private SoTaiKhoan soTaiKhoan;
public User(String userID, String userName, String passWord, String fullName, String email, String phoneNumber,
		Roles role, Date dateOfBirth, String sex, String address, Date createAt, String authenticationCode,
		Date confirmationTime, int status, String imageAvatar, String isKey, String soDu, String typeUser) {
	this.userID = userID;
	this.userName = userName;
	this.passWord = passWord;
	this.fullName = fullName;
	this.email = email;
	this.phoneNumber = phoneNumber;
	this.role = role;
	this.dateOfBirth = dateOfBirth;
	this.sex = sex;
	this.address = address;
	this.createAt = createAt;
	this.authenticationCode = authenticationCode;
	this.confirmationTime = confirmationTime;
	this.status = status;
	this.imageAvatar = imageAvatar;
	this.isKey = isKey;
	this.soDu = soDu;
	this.typeUser = typeUser;
}




public User(String userID, String userName, String passWord, String fullName, String email, String phoneNumber,
		Roles role, Date dateOfBirth, String sex, String address, Date createAt, String authenticationCode,
		Date confirmationTime, int status, String imageAvatar, String isKey, String soDu, String typeUser, int age,
		String cccd, String degree, SoTaiKhoan numBank) {
	this.userID = userID;
	this.userName = userName;
	this.passWord = passWord;
	this.fullName = fullName;
	this.email = email;
	this.phoneNumber = phoneNumber;
	this.role = role;
	this.dateOfBirth = dateOfBirth;
	this.sex = sex;
	this.address = address;
	this.createAt = createAt;
	this.authenticationCode = authenticationCode;
	this.confirmationTime = confirmationTime;
	this.status = status;
	this.imageAvatar = imageAvatar;
	this.isKey = isKey;
	this.soDu = soDu;
	this.typeUser = typeUser;
	this.age = age;
	this.cccd = cccd;
	this.degree = degree;
	this.soTaiKhoan = numBank;
}




public User(String userID, String userName, String passWord, String fullName, String email, String phoneNumber, Roles role,
		Date dateOfBirth, String sex, String address, Date createAt, String imageAvatar) {
	super();
	this.userID = userID;
	this.userName = userName;
	this.passWord = passWord;
	this.fullName = fullName;
	this.email = email;
	this.phoneNumber = phoneNumber;
	this.role = role;
	this.dateOfBirth = dateOfBirth;
	this.sex = sex;
	this.address = address;
	this.createAt = createAt;
	this.imageAvatar = imageAvatar;
	this.isKey = "Hoạt động";
	this.soDu = "0";
	this.typeUser = "1";
}
public User(String userID, String userName, String passWord, String fullName, String email, String phoneNumber, Roles role,
		Date dateOfBirth, String sex, String address, Date createAt, String imageAvatar, String isKey) {
	super();
	this.userID = userID;
	this.userName = userName;
	this.passWord = passWord;
	this.fullName = fullName;
	this.email = email;
	this.phoneNumber = phoneNumber;
	this.role = role;
	this.dateOfBirth = dateOfBirth;
	this.sex = sex;
	this.address = address;
	this.createAt = createAt;
	this.imageAvatar = imageAvatar;
	this.isKey = isKey;
	this.soDu = "0";
	this.typeUser = "1";
}

public User() {
	super();
}

public User(String userID, String userName, String passWord, String email, String phoneNumber, Roles role,
		Date createAt, String imageAvatar) {
	this.userID = userID;
	this.userName = userName;
	this.passWord = passWord;
	this.email = email;
	this.phoneNumber = phoneNumber;
	this.role = role;
	this.createAt = createAt;
	this.imageAvatar = imageAvatar;
}
public String getUserID() {
	return userID;
}
public void setUserID(String userID) {
	this.userID = userID;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getPassWord() {
	return passWord;
}
public void setPassWord(String passWord) {
	this.passWord = passWord;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhoneNumber() {
	return phoneNumber;
}
public void setPhoneNumber(String phoneNumber) {
	this.phoneNumber = phoneNumber;
}
public Roles getRole() {
	return role;
}
public void setRole(Roles role) {
	this.role = role;
}
public Date getCreateAt() {
	return createAt;
}
public void setCreateAt(Date createAt) {
	this.createAt = createAt;
}
public String getAuthenticationCode() {
	return authenticationCode;
}
public void setAuthenticationCode(String authenticationCode) {
	this.authenticationCode = authenticationCode;
}
public Date getConfirmationTime() {
	return confirmationTime;
}
public void setConfirmationTime(Date confirmationTime) {
	this.confirmationTime = confirmationTime;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public String getImageAvatar() {
	return imageAvatar;
}
public void setImageAvatar(String imageAvatar) {
	this.imageAvatar = imageAvatar;
}


public Date getDateOfBirth() {
	return dateOfBirth;
}


public void setDateOfBirth(Date dateOfBirth) {
	this.dateOfBirth = dateOfBirth;
}


public String getSex() {
	return sex;
}


public void setSex(String sex) {
	this.sex = sex;
}


public String getAddress() {
	return address;
}


public void setAddress(String address) {
	this.address = address;
}


public String getFullName() {
	return fullName;
}


public void setFullName(String fullName) {
	this.fullName = fullName;
}


public String getIsKey() {
	return isKey;
}


public void setIsKey(String isKey) {
	this.isKey = isKey;
}


public String getSoDu() {
	return soDu;
}


public void setSoDu(String soDu) {
	this.soDu = soDu;
}



public String getTypeUser() {
	return typeUser;
}



public void setTypeUser(String typeUser) {
	this.typeUser = typeUser;
}




public int getAge() {
	return age;
}




public void setAge(int age) {
	this.age = age;
}




public String getCccd() {
	return cccd;
}




public void setCccd(String cccd) {
	this.cccd = cccd;
}




public String getDegree() {
	return degree;
}




public void setDegree(String degree) {
	this.degree = degree;
}




public SoTaiKhoan getSoTaiKhoan() {
	return soTaiKhoan;
}




public void setSoTaiKhoan(SoTaiKhoan soTaiKhoan) {
	this.soTaiKhoan = soTaiKhoan;
}












}
