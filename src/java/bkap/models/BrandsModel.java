/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.dao.BrandsDao;
import bkap.entity.Brands;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class BrandsModel implements BrandsDao{

    @Override
    public List<Brands> getAllBrands() {
       Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Brands");
        List<Brands> listBrand = query.list();
        session.getTransaction().commit();
        session.close();
        return listBrand;
    }
    public  List<Brands> getBrandPaginate(int start, int end)
    {
          Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Brands");
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<Brands> listBrand = query.list();
        session.getTransaction().commit();
        session.close();
        return listBrand;
    }
  
    public List<Brands> getBrandByLimit(int limit)
    {
         Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Brands").setMaxResults(limit);
        List<Brands> listBrand = query.list();
        session.getTransaction().commit();
        session.close();
        return listBrand;
    }

    @Override
    public boolean insertBrand(Brands brand) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(brand);
            
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
    public boolean updateBrand(Brands brand) {
       Session session = null;
       Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.merge(brand);
            
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
    public Brands getBrandById(int id) {
        Session session = null;
        Transaction trans = null;
        Brands brand = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("FROM Brands WHERE id=:id");
            query.setInteger("id", id);
            brand = (Brands) query.uniqueResult();
            session.getTransaction().commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return brand;
    }

    @Override
    public boolean deleteBrand(int id) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Brands brand = getBrandById(id);
            if (brand!=null) {
                session.delete(brand);
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
