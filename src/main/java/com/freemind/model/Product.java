package com.freemind.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@SuppressWarnings("serial")
@Entity
@Table(name = "PRODUCT")
public class Product implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	int id;

	@Column(name = "PRODUCT_CODE")
	String productCode;

	@Column(name = "PRODUCT_NAME")
	String productName;

	@Column(name = "PRODUCT_DESCR")
	String productDescription;

	@Column(name = "QUANTITY")
	int quantity;

	@Column(name = "UNIT_NAME")
	String unitName;

	@Column(name = "GST_PERC")
	Double gstPerc;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "GODWAN_ID", nullable = true)
	@JsonIgnore
	Godown godowanModel;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CATEGORY_ID", nullable = true)
	@JsonIgnore
	CategoryModel categoryModel;

	@Column(name = "SALE_RATE")
	double saleRate;

	@Column(name = "CREATED_BY")
	int createdBy;

	@Column(name = "MODIFIED_BY")
	int modifyBy;

	@Column(name = "INSERTION_DATE")
	Date insertionDate;

	@Column(name = "LAST_MODIFIED_DATE")
	Date lastModifyDate;

	@Column(name = "ACTIVITY_STATUS", nullable = false, columnDefinition = "boolean default true")
	boolean activityStatus = true;

	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	List<Item> listItems;

	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	List<SaleOrderDetails> saleOrderDetailsList;


	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	List<SaleDetails> saleDetails;


	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	List<PurchaseDetails> purchaseDetailsList;

	public Double getGstPerc() {
		return gstPerc;
	}

	public void setGstPerc(Double gstPerc) {
		this.gstPerc = gstPerc;
	}

	public Godown getGodowanModel() {
		return godowanModel;
	}

	public void setGodowanModel(Godown godowanModel) {
		this.godowanModel = godowanModel;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getSaleRate() {
		return saleRate;
	}

	public void setSaleRate(double saleRate) {
		this.saleRate = saleRate;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getModifyBy() {
		return modifyBy;
	}

	public void setModifyBy(int modifyBy) {
		this.modifyBy = modifyBy;
	}

	public Date getInsertionDate() {
		return insertionDate;
	}

	public void setInsertionDate(Date insertionDate) {
		this.insertionDate = insertionDate;
	}

	public Date getLastModifyDate() {
		return lastModifyDate;
	}

	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}

	public List<Item> getListItems() {
		return listItems;
	}

	public void setListItems(List<Item> listItems) {
		this.listItems = listItems;
	}

	public boolean isActivityStatus() {
		return activityStatus;
	}

	public void setActivityStatus(boolean activityStatus) {
		this.activityStatus = activityStatus;
	}

	public List<SaleDetails> getSaleDetails() {
		return saleDetails;
	}

	public void setSaleDetails(List<SaleDetails> saleDetails) {
		this.saleDetails = saleDetails;
	}

	public List<SaleOrderDetails> getSaleOrderDetailsList() {
		return saleOrderDetailsList;
	}

	public void setSaleOrderDetailsList(List<SaleOrderDetails> saleOrderDetailsList) {
		this.saleOrderDetailsList = saleOrderDetailsList;
	}

	public List<PurchaseDetails> getPurchaseDetailsList() {
		return purchaseDetailsList;
	}

	public void setPurchaseDetailsList(List<PurchaseDetails> purchaseDetailsList) {
		this.purchaseDetailsList = purchaseDetailsList;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public CategoryModel getCategoryModel() {
		return categoryModel;
	}

	public void setCategoryModel(CategoryModel categoryModel) {
		this.categoryModel = categoryModel;
	}

}
