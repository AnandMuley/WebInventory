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

import com.freemind.dao.PurchasePaymentDetailsDao;
import com.freemind.model.PurchasePaymentDetails;
import com.freemind.model.Unit;

@Repository("PurchasePaymentDetailsDao")
@Transactional
public class PurchasePaymentDetailsDaoImpl implements PurchasePaymentDetailsDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<PurchasePaymentDetails> getAllPurchasePaymentDetailsList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<PurchasePaymentDetails> listPurchasePaymentDetails = session.createCriteria(PurchasePaymentDetails.class)
				.list();

		return listPurchasePaymentDetails;
	}

	@Override
	public PurchasePaymentDetails getPurchasePaymentDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(PurchasePaymentDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		PurchasePaymentDetails purchasePaymentDetails = (PurchasePaymentDetails) criteria.uniqueResult();

		return purchasePaymentDetails;
	}

	@Override
	public void save(PurchasePaymentDetails purchasePaymentDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(purchasePaymentDetails);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(PurchasePaymentDetails purchasePaymentDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(purchasePaymentDetails);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deletePurchasePaymentDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(PurchasePaymentDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
