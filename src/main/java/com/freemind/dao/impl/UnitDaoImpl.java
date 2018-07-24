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

import com.freemind.dao.UnitDao;
import com.freemind.model.Unit;

@Repository("UnitDao")
@Transactional
public class UnitDaoImpl implements UnitDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Unit> getAllUnitList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Unit> listUnit = session.createCriteria(Unit.class)
				.add(Restrictions.eq("active", new Boolean(true))).list();

		return listUnit;
	}

	@Override
	public Unit getUnitById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Unit.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Unit unit = (Unit) criteria.uniqueResult();

		return unit;
	}

	@Override
	public void save(Unit unit) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(unit);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(Unit unit) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(unit);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void deleteUnitById(int id, boolean status) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Unit.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));

		Unit unit = (Unit) criteria.uniqueResult();
		unit.setActive(status);
		session.update(unit);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public Unit getUnitByName(String unitName) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Unit.class);
		criteria.add(Restrictions.eq("unitName", unitName));
		Unit unit = (Unit) criteria.uniqueResult();

		return unit;
	}
}
