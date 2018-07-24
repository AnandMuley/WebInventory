package com.freemind.command;

import java.util.ArrayList;
import java.util.List;

public class SalePaymentDetails {
	private int id;
	private int saleId;

	List<PaymentDetails> paymentDetailsList = new ArrayList<PaymentDetails>();

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

	public List<PaymentDetails> getPaymentDetailsList() {
		return paymentDetailsList;
	}

	public void setPaymentDetailsList(List<PaymentDetails> paymentDetailsList) {
		this.paymentDetailsList = paymentDetailsList;
	}

}
