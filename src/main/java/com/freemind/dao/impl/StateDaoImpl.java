package com.freemind.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.freemind.dao.StateDao;
import com.freemind.model.State;
import com.freemind.model.Unit;

@Repository("StateDao")
@Transactional
public class StateDaoImpl implements StateDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<String> getAllStateList() {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(State.class);
		criteria.setProjection(Projections.distinct(Projections
				.property("stateName")));
		@SuppressWarnings("unchecked")
		List<String> listState = criteria.list();
		return listState;
	}

	@Override
	public void save(State customer) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(customer);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(State customer) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(customer);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deleteStateById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(State.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public List<String> getCityListByStateName(String name) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(State.class);
		criteria.add(Restrictions.eq("stateName", name));
		criteria.setProjection(Projections.property("cityName"));
		@SuppressWarnings("unchecked")
		List<String> listState = criteria.list();

		return listState;
	}

}
