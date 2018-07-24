package com.freemind.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.freemind.dao.ItemDao;
import com.freemind.model.Item;
import com.freemind.model.Unit;

@Repository("ItemDao")
public class ItemDaoImpl implements ItemDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Item> getAllItemList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Item> listItem = session.createCriteria(Item.class).list();

		return listItem;
	}

	@Override
	public Item getItemById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Item.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Item item = (Item) criteria.uniqueResult();

		return item;
	}

	@Override
	public void save(Item item) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(item);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(Item item) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(item);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deleteItemById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Item.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
