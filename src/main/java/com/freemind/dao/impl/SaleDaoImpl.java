package com.freemind.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.freemind.dao.SaleDao;
import com.freemind.model.PaymentDetails;
import com.freemind.model.Sale;
import com.freemind.model.SaleDetails;
import com.freemind.model.SalePaymentDetails;
import com.freemind.model.Unit;

@Repository("SaleDao")
@Transactional
public class SaleDaoImpl implements SaleDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Sale> getAllSaleList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Sale> listSale = session.createCriteria(Sale.class).list();

		return listSale;
	}

	@Override
	public Sale getSaleById(int id) {
		Session session;
		session = sessionFactory.openSession();

		Criteria criteria = session.createCriteria(Sale.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Sale sale = (Sale) criteria.uniqueResult();

		return sale;
	}

	@Override
	public void save(Sale sale) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(sale);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void update(Sale sale) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(sale);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void deleteSaleById(int id) {
		Session session;
		session = sessionFactory.getCurrentSession();
		if (session == null) {
			session = sessionFactory.openSession();
		}
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Sale.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public boolean saveAll(Sale sale, SalePaymentDetails salePaymentDetails) {
		Session session;
		session = sessionFactory.getCurrentSession();
		if (session == null) {
			session = sessionFactory.openSession();
		}
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			List<SaleDetails> saleDetailsList = new ArrayList<SaleDetails>(sale.getListSaleDetails());
			sale.getListSaleDetails().clear();
			if (sale.getId() == 0) {
				session.save(sale);
			} else {
				session.update(sale);
			}
			for (SaleDetails saleDetails : saleDetailsList) {
				if (saleDetails.getId() == 0) {
					saleDetails.setSale(sale);
					session.save(saleDetails);
				} else {
					saleDetails.setSale(sale);
					session.update(saleDetails);
				}
			}
			salePaymentDetails.setSale(sale);

			if (salePaymentDetails.getId() == 0) {
				session.save(salePaymentDetails);
			} else {
				session.update(sale);
			}

			List<PaymentDetails> listPaymentDetails = new ArrayList<PaymentDetails>(
					salePaymentDetails.getListPaymentDetails());
			salePaymentDetails.getListPaymentDetails().clear();

			for (PaymentDetails paymentDetails : listPaymentDetails) {
				if (paymentDetails.getId() == 0) {
					paymentDetails.setSalePaymentDetails(salePaymentDetails);
					session.save(paymentDetails);
				} else {
					paymentDetails.setSalePaymentDetails(salePaymentDetails);
					session.update(paymentDetails);
				}
			}
			transaction.commit();
			return true;
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Integer getSaleBillNo() {
		Session session;
		session = sessionFactory.openSession();

		Criteria criteria = session.createCriteria(Sale.class).setProjection(Projections.max("billNo"));
		Integer billNo = (Integer) criteria.uniqueResult();

		return billNo;
	}

	@Override
	public Sale getBillByBillNo(int billNo) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Sale.class);
		criteria.add(Restrictions.eq("billNo", billNo));
		Sale sale = (Sale) criteria.uniqueResult();
		if (sale != null) {
			Hibernate.initialize(sale.getListSaleDetails());
		}
		return sale;
	}

}
