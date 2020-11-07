/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.dao.BannerTypeDao;
import bkap.entity.BannerType;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class BannerTypeModels implements BannerTypeDao{

    @Override
    public List<BannerType> getAllBannerType() {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM BannerType");
        List<BannerType> listBannerType = query.list();
        session.getTransaction().commit();
        session.close();
        return listBannerType;
    }
    //paginate phan trang
    public  List<BannerType> getBannerTypePaginate(int start, int end)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM BannerType");
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<BannerType> listBannerType = query.list();
        session.getTransaction().commit();
        session.close();
        return listBannerType;
    }

    @Override
    public boolean insertBannerType(BannerType bannerType) {
      Session session = null;
      Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(bannerType);
            
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
    public boolean updateBannerType(BannerType bannerType) {
        Session session =null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.merge(bannerType);
            
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
    public BannerType getBannerTypeById(int id) {
        Session session = null;
        Transaction trans = null;
        BannerType bannerType = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("FROM BannerType WHERE bannerTypeId=:id");
            query.setInteger("id", id);
            bannerType = (BannerType) query.uniqueResult();
            session.getTransaction().commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bannerType;
    }

    @Override
    public boolean deleteBannerType(int id) {
       Session session = null;
       Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            BannerType bannerType = getBannerTypeById(id);
            if (bannerType!= null) {
               session.delete(bannerType);
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
