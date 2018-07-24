package com.freemind.dao;

import java.util.List;

import com.freemind.model.PaymentDetails;

public interface PaymentDetailsDao {
	public List<PaymentDetails> getAllPaymentDetailsList();

	public PaymentDetails getPaymentDetailsById(int id);

	public void save(PaymentDetails paymentDetails);

	public void update(PaymentDetails paymentDetails);

	public void deletePaymentDetailsById(int id);

}
