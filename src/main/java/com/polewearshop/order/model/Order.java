package com.polewearshop.order.model;

import java.util.Date;

public class Order {
	private int id;
	private String type;
	private int orderUserId;
	private int deliveryFee;
	private String deliveredAddress;
	private String deliveredPhoneNumber;
	private String deliveredComment;
	private String deliveredName;
	private Date createdAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getOrderUserId() {
		return orderUserId;
	}
	public void setOrderUserId(int orderUserId) {
		this.orderUserId = orderUserId;
	}
	public int getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public String getDeliveredAddress() {
		return deliveredAddress;
	}
	public void setDeliveredAddress(String deliveredAddress) {
		this.deliveredAddress = deliveredAddress;
	}
	public String getDeliveredPhoneNumber() {
		return deliveredPhoneNumber;
	}
	public void setDeliveredPhoneNumber(String deliveredPhoneNumber) {
		this.deliveredPhoneNumber = deliveredPhoneNumber;
	}
	public String getDeliveredComment() {
		return deliveredComment;
	}
	public void setDeliveredComment(String deliveredComment) {
		this.deliveredComment = deliveredComment;
	}
	public String getDeliveredName() {
		return deliveredName;
	}
	public void setDeliveredName(String deliveredName) {
		this.deliveredName = deliveredName;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
}
