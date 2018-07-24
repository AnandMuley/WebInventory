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

import com.freemind.dao.CustomerDao;
import com.freemind.model.Customer;
import com.freemind.model.Unit;

@Repository("CustomerDao")
@Transactional
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Customer> getAllCustomerList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Customer> listCustomer = session.createCriteria(Customer.class)
				.add(Restrictions.eq("active", true)).list();

		return listCustomer;
	}

	@Override
	public Customer getCustomerById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Customer.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Customer customer = (Customer) criteria.uniqueResult();

		return customer;
	}
	@Override
	public Customer getCustomerByMobileNo(String id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Customer.class);
		criteria.add(Restrictions.eq("mobileNo", id));
		Customer customer = (Customer) criteria.uniqueResult();

		return customer;
	}
	@Override
	public void save(Customer customer) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(customer);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(Customer customer) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(customer);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deleteCustomerById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Customer.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void updateCustomerActivityStatus(int id, boolean status) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Customer.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Customer customer = (Customer) criteria.uniqueResult();
		customer.setActive(status);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void updateCustomerDefaulter(int id, boolean defaulter) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Customer.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Customer customer = (Customer) criteria.uniqueResult();
		customer.setDefaulter(defaulter);
		transaction.commit();
		session.clear();
		session.close();

	}

}
