package com.projectttweb.webphone.model;

import com.projectttweb.webphone.database.ProductDao;

public class ProductCategories {
private String productCategoriesID;
private String nameCategories;
public ProductCategories(String productCategoriesID, String nameCategories) {
	this.productCategoriesID = productCategoriesID;
	this.nameCategories = nameCategories;
}
public ProductCategories() {
	super();
}
public String getProductCategoriesID() {
	return productCategoriesID;
}
public void setProductCategoriesID(String productCategoriesID) {
	this.productCategoriesID = productCategoriesID;
}
public String getNameCategories() {
	return nameCategories;
}
public void setNameCategories(String nameCategories) {
	this.nameCategories = nameCategories;
}
public int getNumPhone() {
	ProductDao proDAO = new ProductDao();
	int sl = proDAO.getNumPhoneByCate(this.nameCategories);
	return sl;
}


}
