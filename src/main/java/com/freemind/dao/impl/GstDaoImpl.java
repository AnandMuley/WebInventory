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

import com.freemind.dao.GstDao;
import com.freemind.model.GST;

@Repository("GstDao")
@Transactional
public class GstDaoImpl implements GstDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<GST> getAllGstList() {
		Session session;
		session = sessionFactory.openSession();

		Criteria queryCriteria = session.createCriteria(GST.class);
		queryCriteria.add(Restrictions.eq("active", true));
		@SuppressWarnings("unchecked")
		List<GST> listGst = queryCriteria.list();
		return listGst;
	}

	@Override
	public GST getGstById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(GST.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		GST Gst = (GST) criteria.uniqueResult();

		return Gst;
	}

	@Override
	public void save(GST Gst) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(Gst);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void deleteGstById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(GST.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((GST) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(GST Gst) {
		// TODO Auto-generated method stub

	}

}
