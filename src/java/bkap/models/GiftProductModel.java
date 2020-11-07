/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.entity.GiftProduct;
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
public class GiftProductModel {
    public List<GiftProduct> getAllGiftPro()
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM GiftProduct");
        List<GiftProduct> listGP = query.list();
        session.getTransaction().commit();
        session.close();
        return listGP;
    }
    
    public List<GiftProduct> getGiftProductByProId(int id)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM GiftProduct WHERE products.productId=:id");
        query.setInteger("id", id);
        List<GiftProduct> listGP = query.list();
        session.getTransaction().commit();
        session.close();
        return listGP;
    }
    
    public boolean deleteGiftPro(int id)
    {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            List<GiftProduct> listGP = getGiftProductByProId(id);
            for (GiftProduct gP : listGP) {
                session.delete(gP);
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
    
    public boolean insertGiftPro(List<GiftProduct> listGP)
    {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            for (GiftProduct gP : listGP) {
                session.save(gP);
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
