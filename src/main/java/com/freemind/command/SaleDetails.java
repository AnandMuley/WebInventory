package com.freemind.command;

public class SaleDetails {
	private int id;
	private int saleId;
	private int productId;
	private String productCode;
	private String productName;
	private double qauntity;
	private String unit;
	private double gstPerc;
	private double gstRs;
	private double saleRate;
	private double total;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSaleId() {
		return saleId;
	}

	public void setSaleId(int saleId) {
		this.saleId = saleId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public double getQauntity() {
		return qauntity;
	}

	public void setQauntity(double qauntity) {
		this.qauntity = qauntity;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
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

	public double getGstPerc() {
		return gstPerc;
	}

	public void setGstPerc(double gstPerc) {
		this.gstPerc = gstPerc;
	}

	public double getGstRs() {
		return gstRs;
	}

	public void setGstRs(double gstRs) {
		this.gstRs = gstRs;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getSaleRate() {
		return saleRate;
	}

	public void setSaleRate(double saleRate) {
		this.saleRate = saleRate;
	}

}
