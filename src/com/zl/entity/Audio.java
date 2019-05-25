package com.zl.entity;

import java.util.Date;

public class Audio {


	private int id;
	private String title; 
	private String author; 
	private String path; 
	private Date time; 
	private String remark;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Audio [id=" + id + ", title=" + title + ", author=" + author + ", path=" + path + ", time=" + time
				+ ", remark=" + remark + "]";
	}
	
}
