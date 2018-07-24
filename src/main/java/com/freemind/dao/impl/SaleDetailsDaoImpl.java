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

import com.freemind.dao.SaleDetailsDao;
import com.freemind.model.SaleDetails;
import com.freemind.model.Unit;

@Repository("SaleDetailsDao")
@Transactional
public class SaleDetailsDaoImpl implements SaleDetailsDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<SaleDetails> getAllSaleDetailsList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<SaleDetails> listSaleDetails = session.createCriteria(SaleDetails.class)
				.list();

		return listSaleDetails;
	}

	@Override
	public SaleDetails getSaleDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(SaleDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		SaleDetails saleDetails = (SaleDetails) criteria.uniqueResult();

		return saleDetails;
	}

	@Override
	public void save(SaleDetails saleDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(saleDetails);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(SaleDetails saleDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(saleDetails);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deleteSaleDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(SaleDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
