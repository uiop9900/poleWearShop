package com.polewearshop.studio.model;

import java.util.Date;

public class StudioReserve {
	private int id;
	private int studioId;
	private String visitorName;
	private String visitorPhoneNumber;
	private String visitorDate;
	private String visitorTime;
	private Integer price;
	private Date createdAt;
	private Date updatedAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStudioId() {
		return studioId;
	}
	public void setStudioId(int studioId) {
		this.studioId = studioId;
	}
	public String getVisitorName() {
		return visitorName;
	}
	public void setVisitorName(String visitorName) {
		this.visitorName = visitorName;
	}
	public String getVisitorPhoneNumber() {
		return visitorPhoneNumber;
	}
	public void setVisitorPhoneNumber(String visitorPhoneNumber) {
		this.visitorPhoneNumber = visitorPhoneNumber;
	}
	public String getVisitorDate() {
		return visitorDate;
	}
	public void setVisitorDate(String visitorDate) {
		this.visitorDate = visitorDate;
	}
	public String getVisitorTime() {
		return visitorTime;
	}
	public void setVisitorTime(String visitorTime) {
		this.visitorTime = visitorTime;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
