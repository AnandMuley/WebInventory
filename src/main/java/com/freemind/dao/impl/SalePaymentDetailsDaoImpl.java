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

import com.freemind.dao.SalePaymentDetailsDao;
import com.freemind.model.SalePaymentDetails;
import com.freemind.model.Unit;

@Repository("SalePaymentDetailsDao")
@Transactional
public class SalePaymentDetailsDaoImpl implements SalePaymentDetailsDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<SalePaymentDetails> getAllSalePaymentDetailsList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<SalePaymentDetails> listSalePaymentDetails = session
				.createCriteria(SalePaymentDetails.class).list();

		return listSalePaymentDetails;
	}

	@Override
	public SalePaymentDetails getSalePaymentDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(SalePaymentDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		SalePaymentDetails salePaymentDetails = (SalePaymentDetails) criteria
				.uniqueResult();

		return salePaymentDetails;
	}

	@Override
	public void save(SalePaymentDetails salePaymentDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(salePaymentDetails);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(SalePaymentDetails salePaymentDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(salePaymentDetails);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deleteSalePaymentDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(SalePaymentDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
