package com.projectttweb.webphone.model;

import java.sql.Date;

public class AtmRechargeHistory {
	private String iD;
	private User userID;
	private String amountBeforeDesposit;
	private String amountDesposit;
	private String amountAfterDesposit;
	private Date date;
	private String status;
	private String bank;
	private String numAccount;
	private String pinCode;
	public AtmRechargeHistory(String iD, User userID, String amountBeforeDesposit, String amountDesposit,
			String amountAfterDesposit, Date date, String status, String bank, String numAccount, String pinCode) {
		this.iD = iD;
		this.userID = userID;
		this.amountBeforeDesposit = amountBeforeDesposit;
		this.amountDesposit = amountDesposit;
		this.amountAfterDesposit = amountAfterDesposit;
		this.date = date;
		this.status = status;
		this.bank = bank;
		this.numAccount = numAccount;
		this.pinCode = pinCode;
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
	public String getAmountBeforeDesposit() {
		return amountBeforeDesposit;
	}
	public void setAmountBeforeDesposit(String amountBeforeDesposit) {
		this.amountBeforeDesposit = amountBeforeDesposit;
	}
	public String getAmountDesposit() {
		return amountDesposit;
	}
	public void setAmountDesposit(String amountDesposit) {
		this.amountDesposit = amountDesposit;
	}
	public String getAmountAfterDesposit() {
		return amountAfterDesposit;
	}
	public void setAmountAfterDesposit(String amountAfterDesposit) {
		this.amountAfterDesposit = amountAfterDesposit;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getNumAccount() {
		return numAccount;
	}
	public void setNumAccount(String numAccount) {
		this.numAccount = numAccount;
	}
	public String getPinCode() {
		return pinCode;
	}
	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}
	
	

}
