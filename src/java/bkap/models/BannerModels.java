/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.dao.BannerDao;
import bkap.entity.Banner;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class BannerModels implements BannerDao{

    @Override
    public List<Banner> getAllBanner() {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Banner");
        List<Banner> listBanner = query.list();
        
        session.getTransaction().commit();
        session.close();
        return listBanner;
    }
    
    //paginate Phan trang
    public List<Banner> getBannerPaginate(int start, int end)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Banner");
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<Banner> listBanner = query.list();
        
        session.getTransaction().commit();
        session.close();
        return listBanner;
    }

    @Override
    public boolean insertBanner(Banner banner) {
        Session session = null;
        Transaction trans =null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.save(banner);
            
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
    public boolean updateBanner(Banner banner) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.merge(banner);
            
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
    public Banner getBannerById(int id) {
        Session session = null;
        Transaction trans = null;
        Banner banner = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            Query query = session.createQuery("FROM Banner WHERE bannerId=:id");
            query.setInteger("id", id);
            banner = (Banner) query.uniqueResult();
            
            session.getTransaction().commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();;
        }
        return banner;
    }

    @Override
    public boolean deleteBanner(int id) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            Banner banner = getBannerById(id);
            if (banner!=null) {
                session.delete(banner);
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
    
    //truy vấn 1 danh sách slide trên trang chủ
    public  List<Banner> getBannerByType(int typeId)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();

        Query query = session.createQuery("FROM Banner WHERE bannerType.bannerTypeId=:typeId");
        query.setInteger("typeId", typeId);
        List<Banner> banner =query.list();

        session.getTransaction().commit();
        session.close();
        return banner;
    }
    
    //truy vấn ra 1 banner nhỏ tại website
    
    public Banner getBannerByType1(int typeId)
    {
        Session session = null;
        Transaction trans =null;
        Banner banner = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            Query query = session.createQuery("FROM Banner WHERE bannerType.bannerTypeId=:typeId AND bannerStatus=true ").setMaxResults(1);
            query.setInteger("typeId", typeId);
            banner = (Banner) query.uniqueResult();
            session.getTransaction().commit();
            session.close();            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return banner;
    }
    
}
