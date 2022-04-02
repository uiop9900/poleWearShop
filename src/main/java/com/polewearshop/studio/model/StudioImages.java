package com.polewearshop.studio.model;

import java.util.Date;

public class StudioImages {
	private int studioId;
	private String studioImagePath;
	private String type;
	private Date createdAt;
	private Date updatedAt;
	
	public int getStudioId() {
		return studioId;
	}
	public void setStudioId(int studioId) {
		this.studioId = studioId;
	}
	public String getStudioImagePath() {
		return studioImagePath;
	}
	public void setStudioImagePath(String studioImagePath) {
		this.studioImagePath = studioImagePath;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
