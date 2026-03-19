package com.projectttweb.webphone.model;

import java.sql.Date;

public class CustomerFeedback {
private String feedID;
private User user;
private Date createAt;
private String titleMessage;
private String messageUser;
private String messageAdmin;
public CustomerFeedback(String feedID, User user, Date createAt, String titleMessage, String messageUser,
		String messageAdmin) {
	super();
	this.feedID = feedID;
	this.user = user;
	this.createAt = createAt;
	this.titleMessage = titleMessage;
	this.messageUser = messageUser;
	this.messageAdmin = messageAdmin;
}
public String getFeedID() {
	return feedID;
}
public void setFeedID(String feedID) {
	this.feedID = feedID;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public Date getCreateAt() {
	return createAt;
}
public void setCreateAt(Date createAt) {
	this.createAt = createAt;
}
public String getTitleMessage() {
	return titleMessage;
}
public void setTitleMessage(String titleMessage) {
	this.titleMessage = titleMessage;
}
public String getMessageUser() {
	return messageUser;
}
public void setMessageUser(String messageUser) {
	this.messageUser = messageUser;
}
public String getMessageAdmin() {
	return messageAdmin;
}
public void setMessageAdmin(String messageAdmin) {
	this.messageAdmin = messageAdmin;
}

}
