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

import com.freemind.dao.SaleTaxDetailsDao;
import com.freemind.model.SaleTaxDetails;
import com.freemind.model.Unit;

@Repository("SaleTaxDetailsDao")
@Transactional
public class SaleTaxDetailsDaoImpl implements SaleTaxDetailsDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<SaleTaxDetails> getAllSaleTaxDetailsList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<SaleTaxDetails> listSaleTaxDetails = session.createCriteria(SaleTaxDetails.class)
				.list();

		return listSaleTaxDetails;
	}

	@Override
	public SaleTaxDetails getSaleTaxDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(SaleTaxDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		SaleTaxDetails saleTaxDetails = (SaleTaxDetails) criteria.uniqueResult();

		return saleTaxDetails;
	}

	@Override
	public void save(SaleTaxDetails saleTaxDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(saleTaxDetails);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(SaleTaxDetails saleTaxDetails) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(saleTaxDetails);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deleteSaleTaxDetailsById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(SaleTaxDetails.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
