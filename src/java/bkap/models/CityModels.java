/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.dao.CityDao;
import bkap.entity.Citys;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class CityModels implements CityDao{

    @Override
    public List<Citys> getAllCity() {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Citys");
        List<Citys> listCity = query.list();
        session.getTransaction().commit();
        session.close();
        return listCity;
    }
    //paginate phan trang
    public List<Citys> getCityPaginate(int start,int end)
    {
        Session session = null;
        Transaction trans =null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Citys");
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<Citys> listCity = query.list();
        session.getTransaction().commit();
        session.close();
        return listCity;
        
    }
    @Override
    public boolean insertCity(Citys citys) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.save(citys);
            
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
    public boolean updateCity(Citys citys) {
       Session session = null;
       Transaction trans =null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.merge(citys);
            
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
    public Citys getCityById(int id) {
        Session session = null;
        Transaction trans =null;
        Citys city = null;
        try {
            session  = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            Query query = session.createQuery("FROM Citys WHERE cityId=:id");
            query.setInteger("id", id);
            city =(Citys)query.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return city;
    }

    @Override
    public boolean deleteCity(int id) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            Citys city = getCityById(id);
            if (city!=null) {
                session.delete(city);
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
