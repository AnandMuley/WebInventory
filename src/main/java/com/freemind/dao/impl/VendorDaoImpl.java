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

import com.freemind.dao.VendorDao;
import com.freemind.model.Vendors;
import com.freemind.model.Unit;

@Repository("VendorDao")
@Transactional
public class VendorDaoImpl implements VendorDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Vendors> getAllVendorList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Vendors> listVendor = session.createCriteria(Vendors.class).list();

		return listVendor;
	}

	@Override
	public Vendors getVendorById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Vendors.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Vendors vendor = (Vendors) criteria.uniqueResult();

		return vendor;
	}

	@Override
	public void save(Vendors vendor) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(vendor);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(Vendors vendor) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(vendor);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deleteVendorById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Vendors.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void updateVendorStatus(int id, boolean status) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Vendors.class);
		criteria.add(Restrictions.eq("id", id));
		Vendors vendor = (Vendors) criteria.uniqueResult();

		Transaction transaction = session.beginTransaction();
		vendor.setActive(status);
		session.update(vendor);
		transaction.commit();
		session.clear();
		session.close();

	}

}
