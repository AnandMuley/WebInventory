package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.PaymentDetailsDao;
import com.freemind.model.PaymentDetails;
import com.freemind.services.PaymentDetailsService;


@Service("PaymentDetailsService")
public class PaymentDetailsServiceImpl implements PaymentDetailsService {

	@Autowired
	PaymentDetailsDao paymentDetailsDao;

	@Override
	public List<PaymentDetails> getAllPaymentDetailsList() {
		return paymentDetailsDao.getAllPaymentDetailsList();
	}

	@Override
	public PaymentDetails getPaymentDetailsById(int id) {
		return paymentDetailsDao.getPaymentDetailsById(id);
	}

	@Override
	public void save(PaymentDetails paymentDetails) {
		paymentDetailsDao.save(paymentDetails);
	}

	@Override
	public void update(PaymentDetails paymentDetails) {
		paymentDetailsDao.update(paymentDetails);
	}

	@Override
	public void deletePaymentDetailsById(int id) {
		paymentDetailsDao.deletePaymentDetailsById(id);
	}

}
