package com.emma.network.dao;


import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.emma.network.model.Photo;


public abstract class DAO {
    
	public Session getSession(){
		return HibernateUtil.getSessionFactory().openSession();
    }
		 
	protected DAO() {
	}

    protected void begin() {
	   getSession().beginTransaction();
	}

	protected void commit() {
	   getSession().getTransaction().commit();
	}

	protected void rollback() {
		try {
			getSession().getTransaction().rollback();
		} catch (HibernateException e) {
			
	       	}
	       	try {
	       		getSession().close();
	       	} catch (HibernateException e) {
	       	}
	}

	public  void close() {
		getSession().close();
	}



}
