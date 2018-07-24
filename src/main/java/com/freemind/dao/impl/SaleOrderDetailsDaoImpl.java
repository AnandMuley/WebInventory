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

import com.freemind.dao.SaleOrderDetailsDao;
import com.freemind.model.SaleOrderDetails;
import com.freemind.model.Unit;

@Repository("SaleOrderDetailsDao")
@Transactional
public class SaleOrderDetailsDaoImpl implements SaleOrderDetailsDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<SaleOrderDetails> getAllSaleOrderDetailsList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<SaleOrderDetails> listSaleOrderDetails = session.createCriteria(SaleOrderDetails.class)
				.list();

		return listSaleOrderDetails;
	}

	@Override
	public SaleOrderDetails getSaleOrderDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(SaleOrderDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		SaleOrderDetails saleOrderDetails = (SaleOrderDetails) criteria.uniqueResult();

		return saleOrderDetails;
	}

	@Override
	public void save(SaleOrderDetails saleOrderDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(saleOrderDetails);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(SaleOrderDetails saleOrderDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(saleOrderDetails);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deleteSaleOrderDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(SaleOrderDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
