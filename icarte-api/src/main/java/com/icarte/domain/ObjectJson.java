package com.icarte.domain;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

import static com.icarte.commons.Constants.NamedQueries.*;


@NamedQueries({

@NamedQuery(name = FIND_JSON_BY_PARENT_AND_LANG, query = "from ObjectJson jsonData where jsonData.parentId = :parentId and jsonData.recordType = :recordType") })
@Entity
@Table(name = "OBJECT_JSON")
public class ObjectJson implements Serializable {

	private RefLanguages language;
	private Long recordType;
	private Long parentId;
	private String jsonData;
	private Resturant restaurant;
	private Long jsonVersion;//TODO: rename jsonVersion to responseVersion
	private Long id;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "JSON_ID", unique = true, nullable = false)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "LANGUAGE_ID", nullable = false)
	public RefLanguages getLanguage() {
		return language;
	}

	public void setLanguage(RefLanguages language) {
		this.language = language;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "RESTURANT_ID", nullable = false)
	public Resturant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Resturant restaurant) {
		this.restaurant = restaurant;
	}

	@Column(name = "record_type")
	public Long getRecordType() {
		return recordType;
	}

	public void setRecordType(Long recordType) {
		this.recordType = recordType;
	}

	@Column(name = "parent_id")
	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	@Column(name = "JSON_DATA")
	public String getJsonData() {
		return jsonData;
	}

	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}

	@Column(name = "JSON_VERSION")
	public Long getJsonVersion() {
		return jsonVersion;
	}

	public void setJsonVersion(Long jsonVersion) {
		this.jsonVersion = jsonVersion;
	}
}

