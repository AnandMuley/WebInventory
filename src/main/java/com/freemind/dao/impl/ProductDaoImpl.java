package com.freemind.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.freemind.dao.ProductDao;
import com.freemind.model.Product;
import com.freemind.model.Unit;


@Repository("ProductDao")
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<Product> getAllProductList() {
		Session session;
		session = sessionFactory.openSession();
		Criteria queryCriteria=session.createCriteria(Product.class);
		queryCriteria.add(Restrictions.eq("activityStatus", true));
		@SuppressWarnings("unchecked")
		List<Product> listProduct = queryCriteria.list();
		return listProduct;
	}

	@Override
	public Product getProductById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Product.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Product product = (Product) criteria.uniqueResult();

		return product;
	}
	@Override
	public List<Product> getProductListByCatId(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Product.class);
		criteria.add(Restrictions.eq("categoryModel.id",new Integer(id)));
		return criteria.list();
	}
	@Override
	public void save(Product product) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(product);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(Product product) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(product);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void deleteProductById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Product.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
