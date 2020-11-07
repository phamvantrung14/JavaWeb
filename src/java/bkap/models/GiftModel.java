/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.dao.GiftDao;
import bkap.entity.Gift;
import bkap.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class GiftModel implements GiftDao{

    @Override
    public List<Gift> getAllGift() {
         Session session = null;
         Transaction trans = null;
         session = HibernateUtil.getSessionFactory().openSession();
         trans = session.getTransaction();
         trans.begin();
         Query query = session.createQuery("FROM Gift");
         
         List<Gift> listGift = query.list();
         session.getTransaction().commit();
         session.close();
         return listGift;
    }
    public  List<Gift> getGiftPaginate(int start, int end)
    {
        Session session = null;
         Transaction trans = null;
         session = HibernateUtil.getSessionFactory().openSession();
         trans = session.getTransaction();
         trans.begin();
         Query query = session.createQuery("FROM Gift");
         query.setFirstResult(start);
         query.setMaxResults(end);
         List<Gift> listGift = query.list();
         session.getTransaction().commit();
         session.close();
         return listGift;
    }
    //search gift theo ten
    public List<Gift> getGiftByNameNoPaginate(String search)
    {
         Session session = null;
         Transaction trans = null;
         session = HibernateUtil.getSessionFactory().openSession();
         trans = session.getTransaction();
         trans.begin();
         Query query = session.createQuery("FROM Gift WHERE giftCode LIKE :search");
         query.setString("search","%"+ search +"%");         
         List<Gift> listGift = query.list();
         session.getTransaction().commit();
         session.close();
         return listGift;
    }
    //search theo ten phan trang
    public List<Gift> getGiftByName(String search,int start, int end)
    {
         Session session = null;
         Transaction trans = null;
         session = HibernateUtil.getSessionFactory().openSession();
         trans = session.getTransaction();
         trans.begin();
         Query query = session.createQuery("FROM Gift WHERE giftCode LIKE :search");
         query.setString("search","%"+ search +"%");
         query.setFirstResult(start);
         query.setMaxResults(end);
         List<Gift> listGift = query.list();
         session.getTransaction().commit();
         session.close();
         return listGift;
    }
    @Override
    public boolean insertGift(Gift gift) {
         //set ngay hien tai cho feedback
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
        Date dateNow = new Date();  
        try {
            gift.setCreated(new SimpleDateFormat("yyyy-MM-dd").parse(formatter.format(dateNow)));
        } catch (ParseException ex) {
            Logger.getLogger(GiftModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(gift);
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
    public boolean updateGift(Gift gift) {
         SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
        Date dateNow = new Date();  
        try {
            gift.setCreated(new SimpleDateFormat("yyyy-MM-dd").parse(formatter.format(dateNow)));
        } catch (ParseException ex) {
            Logger.getLogger(GiftModel.class.getName()).log(Level.SEVERE, null, ex);
        }
       Session session = null;
       Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.merge(gift);
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
    public Gift getGiftById(int id) {
        Session session= null;
        Transaction trans = null;
        Gift gift = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("FROM Gift WHERE giftId=:id");
            query.setInteger("id", id);
            gift = (Gift) query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return gift;
    }

    @Override
    public boolean deleteGift(int id) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Gift gift = getGiftById(id);
            if (gift!= null) {
                session.delete(gift);
               
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
