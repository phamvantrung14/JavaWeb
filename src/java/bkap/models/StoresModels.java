/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.dao.StoreDao;
import bkap.entity.Stores;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class StoresModels implements StoreDao{

    @Override
    public List<Stores> getAllStore() {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Stores");
        List<Stores> listStore = query.list();
        session.getTransaction().commit();
        session.close();
        return listStore;
    }
    
    public List<Stores> getAllStoreTrue()
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Stores WHERE storeStatus = 1");
        List<Stores> listStore = query.list();
        session.getTransaction().commit();
        session.close();
        return listStore;
    }
   //paginate
    public  List<Stores> getStorePaginate(int start,int end)
    {
         Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Stores");
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<Stores> listStore = query.list();
        session.getTransaction().commit();
        session.close();
        return listStore;
    }
    
    @Override
    public boolean insertStore(Stores stores) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.save(stores);
            
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }

    @Override
    public boolean updateStore(Stores stores) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.merge(stores);
            
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }

    @Override
    public Stores getStoresById(int id) {
        Session session = null;
        Transaction trans = null;
        Stores store = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            Query query = session.createQuery("FROM Stores WHERE storeId=:id");
            query.setInteger("id", id);
            store = (Stores) query.uniqueResult();
            session.getTransaction().commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return store;
    }

    @Override
    public boolean deleteStore(int id) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            Stores store = getStoresById(id);
            if (store!=null) {
                session.delete(store);
            }
            
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
}
