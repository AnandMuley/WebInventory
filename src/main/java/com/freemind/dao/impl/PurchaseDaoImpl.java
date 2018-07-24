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

import com.freemind.dao.PurchaseDao;
import com.freemind.model.Purchase;
import com.freemind.model.Unit;

@Repository("PurchaseDao")
@Transactional
public class PurchaseDaoImpl implements PurchaseDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Purchase> getAllPurchaseList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Purchase> listPurchase = session.createCriteria(Purchase.class)
				.list();

		return listPurchase;
	}

	@Override
	public Purchase getPurchaseById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Purchase.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Purchase purchase = (Purchase) criteria.uniqueResult();

		return purchase;
	}

	@Override
	public void save(Purchase purchase) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(purchase);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(Purchase purchase) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(purchase);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deletePurchaseById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Purchase.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
