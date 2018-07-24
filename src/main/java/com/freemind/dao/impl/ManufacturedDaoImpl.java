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

import com.freemind.dao.ManufacturedDao;
import com.freemind.model.Manufactured;
import com.freemind.model.Unit;

@Repository("ManufacturedDao")
@Transactional
public class ManufacturedDaoImpl implements ManufacturedDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Manufactured> getAllManufacturedList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Manufactured> listManufactured = session.createCriteria(Manufactured.class)
				.list();

		return listManufactured;
	}

	@Override
	public Manufactured getManufacturedById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Manufactured.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Manufactured manufactured = (Manufactured) criteria.uniqueResult();

		return manufactured;
	}

	@Override
	public void save(Manufactured manufactured) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(manufactured);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(Manufactured manufactured) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(manufactured);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deleteManufacturedById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Manufactured.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
