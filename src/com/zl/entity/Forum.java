package com.zl.entity;

import java.util.Date;

public class Forum {

		private int id;
		private String title;
		private String author;
		private Date time;
		private String content;
		private String type;
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
		public Date getTime() {
			return time;
		}
		public void setTime(Date time) {
			this.time = time;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		@Override
		public String toString() {
			return "Forum [id=" + id + ", title=" + title + ", author="
					+ author + ", time=" + time + ", content=" + content
					+ ", type=" + type + "]";
		}
		
}
