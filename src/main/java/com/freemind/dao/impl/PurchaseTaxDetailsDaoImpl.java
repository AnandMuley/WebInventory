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

import com.freemind.dao.PurchaseTaxDetailsDao;
import com.freemind.model.PurchaseTaxDetails;
import com.freemind.model.Unit;

@Repository("PurchaseTaxDetailsDao")
@Transactional
public class PurchaseTaxDetailsDaoImpl implements PurchaseTaxDetailsDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<PurchaseTaxDetails> getAllPurchaseTaxDetailsList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<PurchaseTaxDetails> listPurchaseTaxDetails = session.createCriteria(PurchaseTaxDetails.class)
				.list();

		return listPurchaseTaxDetails;
	}

	@Override
	public PurchaseTaxDetails getPurchaseTaxDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(PurchaseTaxDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		PurchaseTaxDetails purchaseTaxDetails = (PurchaseTaxDetails) criteria.uniqueResult();

		return purchaseTaxDetails;
	}

	@Override
	public void save(PurchaseTaxDetails purchaseTaxDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(purchaseTaxDetails);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(PurchaseTaxDetails purchaseTaxDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(purchaseTaxDetails);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deletePurchaseTaxDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(PurchaseTaxDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
