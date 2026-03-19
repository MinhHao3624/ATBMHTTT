package com.projectttweb.webphone.model;

import java.util.ArrayList;
import java.util.List;

public class NganHangTheCao {
public  List<TheCao> listCardVietThel() {
	List<TheCao> list1 = new ArrayList<TheCao>();
	list1.add(new TheCao("Viethel", "1583749502", "16274628942", "500000"));
	list1.add(new TheCao("Viethel", "1583749534", "16274434942", "100000"));
	list1.add(new TheCao("Viethel", "1583749343", "16273434942", "200000"));
	return list1;
}
public  List<TheCao> listCardMobiPhone() {
	List<TheCao> list1 = new ArrayList<TheCao>();
	list1.add(new TheCao("MobiPhone", "1583742323", "13432628942", "500000"));
	list1.add(new TheCao("MobiPhone", "1583742323", "16434434942", "100000"));
	list1.add(new TheCao("MobiPhone", "1583749782", "32373434942", "200000"));
	return list1;
}
public  List<TheCao> listCardVinaPhone() {
	List<TheCao> list1 = new ArrayList<TheCao>();
	list1.add(new TheCao("VinaPhone", "1583232324", "132323628942", "500000"));
	list1.add(new TheCao("VinaPhone", "4343442323", "132324434942", "100000"));
	list1.add(new TheCao("VinaPhone", "3243449782", "323323134942", "200000"));
	return list1;
}

}
