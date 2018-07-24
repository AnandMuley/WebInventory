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

import com.freemind.dao.PurchaseDetailsDao;
import com.freemind.model.PurchaseDetails;
import com.freemind.model.Unit;

@Repository("PurchaseDetailsDao")
@Transactional
public class PurchaseDetailsDaoImpl implements PurchaseDetailsDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<PurchaseDetails> getAllPurchaseDetailsList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<PurchaseDetails> listPurchaseDetails = session.createCriteria(PurchaseDetails.class)
				.list();

		return listPurchaseDetails;
	}

	@Override
	public PurchaseDetails getPurchaseDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(PurchaseDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		PurchaseDetails purchaseDetails = (PurchaseDetails) criteria.uniqueResult();

		return purchaseDetails;
	}

	@Override
	public void save(PurchaseDetails purchaseDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(purchaseDetails);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(PurchaseDetails purchaseDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(purchaseDetails);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deletePurchaseDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(PurchaseDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
