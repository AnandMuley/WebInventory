package com.freemind.services;

import java.util.List;

import com.freemind.model.PaymentDetails;

public interface PaymentDetailsService {
	public List<PaymentDetails> getAllPaymentDetailsList();

	public PaymentDetails getPaymentDetailsById(int id);

	public void save(PaymentDetails paymentDetails);

	public void update(PaymentDetails paymentDetails);

	public void deletePaymentDetailsById(int id);

}
