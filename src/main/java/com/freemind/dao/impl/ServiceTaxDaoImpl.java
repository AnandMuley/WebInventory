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

import com.freemind.dao.ServiceTaxDao;
import com.freemind.model.ServiceTax;

@Repository("ServiceTaxDao")
@Transactional
public class ServiceTaxDaoImpl implements ServiceTaxDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<ServiceTax> getAllServiceTaxList() {
		Session session;
		session = sessionFactory.openSession();
		 
		Criteria queryCriteria=session.createCriteria(ServiceTax.class);
		queryCriteria.add(Restrictions.eq("active", true));
		@SuppressWarnings("unchecked")
		List<ServiceTax> listServiceTax =queryCriteria.list();
		return listServiceTax;
	}

	@Override
	public ServiceTax getServiceTaxById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(ServiceTax.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		ServiceTax serviceTax = (ServiceTax) criteria.uniqueResult();

		return serviceTax;
	}

	@Override
	public void save(ServiceTax serviceTax) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(serviceTax);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(ServiceTax serviceTax) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(serviceTax);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void deleteServiceTaxById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(ServiceTax.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((ServiceTax) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
