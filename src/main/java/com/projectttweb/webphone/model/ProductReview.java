package com.projectttweb.webphone.model;

import java.sql.Date;

public class ProductReview {
private String reviewID;
private User user;
private Product product;
private int rating;
private String comment;
private Date createAt;
public ProductReview(String reviewID, User user, Product product, int rating, String comment, Date createAt) {
	super();
	this.reviewID = reviewID;
	this.user = user;
	this.product = product;
	this.rating = rating;
	this.comment = comment;
	this.createAt = createAt;
}
public String getReviewID() {
	return reviewID;
}
public void setReviewID(String reviewID) {
	this.reviewID = reviewID;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
public int getRating() {
	return rating;
}
public void setRating(int rating) {
	this.rating = rating;
}
public String getComment() {
	return comment;
}
public void setComment(String comment) {
	this.comment = comment;
}
public Date getCreateAt() {
	return createAt;
}
public void setCreateAt(Date createAt) {
	this.createAt = createAt;
}

}
