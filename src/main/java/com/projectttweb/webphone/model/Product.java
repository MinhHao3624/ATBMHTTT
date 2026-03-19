package com.projectttweb.webphone.model;

import java.sql.Date;
import java.text.DecimalFormat;

public class Product {
private String productID;
private String name;
private String price;
private String priceDis;
private int stockQuantity;
private String description;
private String image;
private Date createAt;
private ProductCategories categories;
private InformationProduct informationPro;
private User userID;
private String status;
public Product(String productID, String name, String price, int stockQuantity, String description, String image,
		Date createAt, ProductCategories categories, InformationProduct informationPro) {
	this.productID = productID;
	this.name = name;
	this.price = price;
	this.priceDis = capNhat(price);
	this.stockQuantity = stockQuantity;
	this.description = description;
	this.image = image;
	this.createAt = createAt;
	this.categories = categories;
	this.informationPro = informationPro;
}





public Product(String productID, String name, String price, String priceDis, int stockQuantity, String description,
		String image, Date createAt, ProductCategories categories, InformationProduct informationPro, User userID,
		String status) {
	super();
	this.productID = productID;
	this.name = name;
	this.price = price;
	this.priceDis = capNhat(price);
	this.stockQuantity = stockQuantity;
	this.description = description;
	this.image = image;
	this.createAt = createAt;
	this.categories = categories;
	this.informationPro = informationPro;
	this.userID = userID;
	this.status = status;
}




public Product(String name, String price, int stockQuantity, String description, ProductCategories categories,
		InformationProduct informationPro) {
	this.name = name;
	this.price = price;
	this.stockQuantity = stockQuantity;
	this.description = description;
	this.categories = categories;
	this.informationPro = informationPro;
}



public Product(String productID, String name, String price, String priceDis, int stockQuantity, String description,
		String image, Date createAt, ProductCategories categories, InformationProduct informationPro) {
	this.productID = productID;
	this.name = name;
	this.price = price;
	this.priceDis = priceDis;
	this.stockQuantity = stockQuantity;
	this.description = description;
	this.image = image;
	this.createAt = createAt;
	this.categories = categories;
	this.informationPro = informationPro;
}


private String capNhat(String price2) {
	// TODO Auto-generated method stub
	String ans = "";
	for (int i = 0; i < price2.length(); i++) {
		if(price2.charAt(i) == '.') {
			continue;
		}else {
			ans += price2.charAt(i);
		}
	}
	int priceInt = Integer.valueOf(ans);
	double priceDis = priceInt * 0.1;
	double priceReal = priceInt + priceDis;
	DecimalFormat df = new DecimalFormat("#");
    String m = df.format(priceReal);
	return m;
}

public Product() {
	super();
}


public String getProductID() {
	return productID;
}
public void setProductID(String productID) {
	this.productID = productID;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}

public int getStockQuantity() {
	return stockQuantity;
}
public void setStockQuantity(int stockQuantity) {
	this.stockQuantity = stockQuantity;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public Date getCreateAt() {
	return createAt;
}
public void setCreateAt(Date createAt) {
	this.createAt = createAt;
}
public ProductCategories getCategories() {
	return categories;
}
public void setCategories(ProductCategories categories) {
	this.categories = categories;
}
public InformationProduct getInformationPro() {
	return informationPro;
}
public void setInformationPro(InformationProduct informationPro) {
	this.informationPro = informationPro;
}

public String getPrice() {
	return price;
}

public void setPrice(String price) {
	this.price = price;
}

public String getPriceDis() {
	return priceDis;
}

public void setPriceDis(String priceDis) {
	this.priceDis = priceDis;
}





public User getUserID() {
	return userID;
}





public void setUserID(User userID) {
	this.userID = userID;
}





public String getStatus() {
	return status;
}





public void setStatus(String status) {
	this.status = status;
}










}
