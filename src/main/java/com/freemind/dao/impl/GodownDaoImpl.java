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

import com.freemind.dao.GodownDao;
import com.freemind.model.Godown;
import com.freemind.model.Unit;

@Repository("GodownDao")
@Transactional
public class GodownDaoImpl implements GodownDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Godown> getAllGodownList() {
		Session session;
		session = sessionFactory.openSession();
		Criteria queryCriteria= session.createCriteria(Godown.class);
		queryCriteria.add(Restrictions.eq("active",true));
		@SuppressWarnings("unchecked")
		List<Godown> listGodown = queryCriteria.list();
		return listGodown;
	}

	@Override
	public Godown getGodownById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Godown.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Godown godown = (Godown) criteria.uniqueResult();

		return godown;
	}

	@Override
	public void save(Godown godown) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(godown);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void update(Godown godown) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(godown);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void deleteGodownById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Godown.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();
	}

}
