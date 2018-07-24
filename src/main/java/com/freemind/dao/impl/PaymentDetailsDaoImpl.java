package com.freemind.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.freemind.dao.PaymentDetailsDao;
import com.freemind.model.PaymentDetails;
import com.freemind.model.Unit;

@Repository("PaymentDetailsDao")
@Transactional
public class PaymentDetailsDaoImpl implements PaymentDetailsDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<PaymentDetails> getAllPaymentDetailsList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<PaymentDetails> listPaymentDetails = session.createCriteria(PaymentDetails.class)
				.list();

		return listPaymentDetails;
	}

	@Override
	public PaymentDetails getPaymentDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(PaymentDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		PaymentDetails paymentDetails = (PaymentDetails) criteria.uniqueResult();

		return paymentDetails;
	}

	@Override
	public void save(PaymentDetails paymentDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(paymentDetails);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(PaymentDetails paymentDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(paymentDetails);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deletePaymentDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(PaymentDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
