package com.realty.base.model;

// Generated 2014-5-15 22:00:12 by Hibernate Tools 3.4.0.CR1

import java.io.Serializable;
import java.util.Date;

/**
 * News generated by hbm2java
 */
public class News implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int newsId;
	private String title;
	private Integer newscategoryId;
	private Date date;
	private Integer browses;
	private String contents;
	private String newsFile;

	public News() {
	}

	public News(int newsId) {
		this.newsId = newsId;
	}

	public News(int newsId, String title, Integer newscategoryId,
			Date date, Integer browses, String contents,
			String newsFile) {
		this.newsId = newsId;
		this.title = title;
		this.newscategoryId = newscategoryId;
		this.date = date;
		this.browses = browses;
		this.contents = contents;
		this.newsFile = newsFile;
	}

	public int getNewsId() {
		return this.newsId;
	}

	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getNewscategoryId() {
		return this.newscategoryId;
	}

	public void setNewscategoryId(Integer newscategoryId) {
		this.newscategoryId = newscategoryId;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getBrowses() {
		return this.browses;
	}

	public void setBrowses(Integer browses) {
		this.browses = browses;
	}

	public String getContents() {
		return this.contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getNewsFile() {
		return this.newsFile;
	}

	public void setNewsFile(String newsFile) {
		this.newsFile = newsFile;
	}

}
