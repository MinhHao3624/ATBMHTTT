package com.projectttweb.webphone.model;

public class InformationProduct {
private String info_ID;
private String os;
private String screen;
private String glass;
private String screenSize;
private String resolution;
private String ram;
private String memory;
private String cpu;
private String gpu;
private String camera;
private String cameraSelfies;
private String sim;
private String memoryCard;
private String battery;
private String color;
public InformationProduct(String info_ID, String os, String screen, String glass, String screenSize, String resolution,
		String ram, String memory, String cpu, String gpu, String camera, String cameraSelfies, String sim,
		String memoryCard, String battery, String color) {
	this.info_ID = info_ID;
	this.os = os;
	this.screen = screen;
	this.glass = glass;
	this.screenSize = screenSize;
	this.resolution = resolution;
	this.ram = ram;
	this.memory = memory;
	this.cpu = cpu;
	this.gpu = gpu;
	this.camera = camera;
	this.cameraSelfies = cameraSelfies;
	this.sim = sim;
	this.memoryCard = memoryCard;
	this.battery = battery;
	this.color = color;
}
public InformationProduct() {
	super();
}
public String getInfo_ID() {
	return info_ID;
}
public void setInfo_ID(String info_ID) {
	this.info_ID = info_ID;
}
public String getOs() {
	return os;
}
public void setOs(String os) {
	this.os = os;
}
public String getScreen() {
	return screen;
}
public void setScreen(String screen) {
	this.screen = screen;
}
public String getGlass() {
	return glass;
}
public void setGlass(String glass) {
	this.glass = glass;
}
public String getScreenSize() {
	return screenSize;
}
public void setScreenSize(String screenSize) {
	this.screenSize = screenSize;
}
public String getResolution() {
	return resolution;
}
public void setResolution(String resolution) {
	this.resolution = resolution;
}
public String getRam() {
	return ram;
}
public void setRam(String ram) {
	this.ram = ram;
}
public String getMemory() {
	return memory;
}
public void setMemory(String memory) {
	this.memory = memory;
}
public String getCpu() {
	return cpu;
}
public void setCpu(String cpu) {
	this.cpu = cpu;
}
public String getGpu() {
	return gpu;
}
public void setGpu(String gpu) {
	this.gpu = gpu;
}
public String getCamera() {
	return camera;
}
public void setCamera(String camera) {
	this.camera = camera;
}
public String getCameraSelfies() {
	return cameraSelfies;
}
public void setCameraSelfies(String cameraSelfies) {
	this.cameraSelfies = cameraSelfies;
}
public String getSim() {
	return sim;
}
public void setSim(String sim) {
	this.sim = sim;
}
public String getMemoryCard() {
	return memoryCard;
}
public void setMemoryCard(String memoryCard) {
	this.memoryCard = memoryCard;
}
public String getBattery() {
	return battery;
}
public void setBattery(String battery) {
	this.battery = battery;
}
public String getColor() {
	return color;
}
public void setColor(String color) {
	this.color = color;
}



	
}
