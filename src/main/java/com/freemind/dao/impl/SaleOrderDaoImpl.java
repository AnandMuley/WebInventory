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

import com.freemind.dao.SaleOrderDao;
import com.freemind.model.SaleOrder;
import com.freemind.model.Unit;

@Repository("SaleOrderDao")
@Transactional
public class SaleOrderDaoImpl implements SaleOrderDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<SaleOrder> getAllSaleOrderList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<SaleOrder> listSaleOrder = session.createCriteria(SaleOrder.class)
				.list();

		return listSaleOrder;
	}

	@Override
	public SaleOrder getSaleOrderById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(SaleOrder.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		SaleOrder saleOrder = (SaleOrder) criteria.uniqueResult();

		return saleOrder;
	}

	@Override
	public void save(SaleOrder saleOrder) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(saleOrder);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(SaleOrder saleOrder) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(saleOrder);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deleteSaleOrderById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(SaleOrder.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
