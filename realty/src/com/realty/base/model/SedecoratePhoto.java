package com.realty.base.model;

// Generated 2014-5-26 19:27:00 by Hibernate Tools 3.4.0.CR1

import java.io.Serializable;

/**
 * SedecoratePhoto generated by hbm2java
 */
public class SedecoratePhoto implements java.io.Serializable {

	private int decoratephotoId;
	private int houseId;
	private String photopath;

	public SedecoratePhoto() {
	}

	public SedecoratePhoto(int decoratephotoId) {
		this.decoratephotoId = decoratephotoId;
	}

	public SedecoratePhoto(int decoratephotoId, int houseId,
			String photopath) {
		this.decoratephotoId = decoratephotoId;
		this.houseId = houseId;
		this.photopath = photopath;
	}

	public int getDecoratephotoId() {
		return this.decoratephotoId;
	}

	public void setDecoratephotoId(int decoratephotoId) {
		this.decoratephotoId = decoratephotoId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public String getPhotopath() {
		return this.photopath;
	}

	public void setPhotopath(String photopath) {
		this.photopath = photopath;
	}

}
