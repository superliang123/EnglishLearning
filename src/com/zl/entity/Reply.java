package com.zl.entity;

import java.util.Date;

public class Reply {

	private int id;
	private int forumid;
	private int lou;
	private String author;
	private String content;
	private Date time;
	
	public int getLou() {
		return lou;
	}
	public void setLou(int lou) {
		this.lou = lou;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getForumid() {
		return forumid;
	}
	public void setForumid(int forumid) {
		this.forumid = forumid;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Reply [id=" + id + ", forumid=" + forumid + ", lou=" + lou
				+ ", author=" + author + ", content=" + content + ", time="
				+ time + "]";
	}
	
}
