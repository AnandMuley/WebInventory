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



import com.freemind.dao.CategoryDao;
import com.freemind.model.CategoryModel;

@Repository("categoryDao")
@Transactional
public class CategoryDaoImpl implements CategoryDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveCategory(CategoryModel categorymodel) {
		// TODO Auto-generated method stub
		Session session =null;
		 try {
			  
			    session = sessionFactory.openSession();
				Transaction tx = session.beginTransaction();
				session.saveOrUpdate(categorymodel);
				tx.commit();
			
             }
		     catch (Exception ex) {
			 ex.printStackTrace();
		     }
		     finally {
		    	   session.clear();
				  session.close();
		     }

	    }

	@SuppressWarnings("unchecked")
	@Override
	public List<CategoryModel> listCategory() {
		// TODO Auto-generated method stub
		List<CategoryModel> categorylist=null ;
		Session session =null;
		try {
			  session = sessionFactory.openSession();
		     Criteria queryCriteria = session.createCriteria(CategoryModel.class);
		     queryCriteria.add(Restrictions.eq("active",false));
		     categorylist = queryCriteria.list();
			
	        }
		      catch (Exception ex) {
				ex.printStackTrace();
			}
		   finally {
	    	   session.clear();
			  session.close();
	     }
		   
			return categorylist;
	  

	}

	@Override
	public CategoryModel categoryListById(Integer id) {
		// TODO Auto-generated method stub
		CategoryModel categoryModel =new CategoryModel();
		Session session =null;
		try {
			  session = sessionFactory.openSession();
		      Criteria queryCriteria = session.createCriteria(CategoryModel.class);
		      queryCriteria.add(Restrictions.eq("categoryId",id));
		      categoryModel =  (CategoryModel) queryCriteria.uniqueResult();
			  }
		      catch (Exception ex) {
				ex.printStackTrace();
			}
		   finally {
	    	   session.clear();
			  session.close();
	         }
		   
		     return categoryModel;
	
	  }

	@Override
	public void updateCategory(CategoryModel categorymodel) {
		// TODO Auto-generated method stub
		Session session=null;
		try
		{   
		    session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.saveOrUpdate(categorymodel);
			tx.commit();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	    finally {
    	     session.clear();
		     session.close();
          }
	}

	@Override
	public CategoryModel getCategoryByName(String categoryName) {
		Session session=null;
		CategoryModel categoryModel=null;
		try
		{   
		    session = sessionFactory.openSession();
			Criteria criteria=session.createCriteria(CategoryModel.class);
			criteria.add(Restrictions.eq("categoryName", categoryName));
			categoryModel=(CategoryModel)criteria.uniqueResult();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	    finally {
    	     session.clear();
		     session.close();
          }
		return categoryModel;
	}
	
	

}
