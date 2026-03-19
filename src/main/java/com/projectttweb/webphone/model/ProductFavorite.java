package com.projectttweb.webphone.model;

public class ProductFavorite {
private String productFavoriteID;
private Product product;
private User user;
public ProductFavorite(String productFavoriteID, Product product, User user) {
	this.productFavoriteID = productFavoriteID;
	this.product = product;
	this.user = user;
}
public String getProductFavoriteID() {
	return productFavoriteID;
}
public void setProductFavoriteID(String productFavoriteID) {
	this.productFavoriteID = productFavoriteID;
}
public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}


}
