package com.projectttweb.webphone.model;

import java.sql.Timestamp;

public class Accessory {
    private int accessoryID;
    private String name;
    private double price;
    private double originalPrice;
    private int discount;
    private String type;
    private String brand;
    private String image;
    private String description;
    private int stock;
    private Timestamp createdAt;

    // Constructor mặc định
    public Accessory() {
    }

    // Constructor đầy đủ
    public Accessory(int accessoryID, String name, double price, double originalPrice, int discount,
                     String type, String brand, String image, String description, int stock, Timestamp createdAt) {
        this.accessoryID = accessoryID;
        this.name = name;
        this.price = price;
        this.originalPrice = originalPrice;
        this.discount = discount;
        this.type = type;
        this.brand = brand;
        this.image = image;
        this.description = description;
        this.stock = stock;
        this.createdAt = createdAt;
    }

    // Getter và Setter
    public int getAccessoryID() {
        return accessoryID;
    }

    public void setAccessoryID(int accessoryID) {
        this.accessoryID = accessoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
