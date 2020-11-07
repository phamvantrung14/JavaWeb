/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.entity.Images;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class ImagesModel {
    public List<Images> getImage()
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Images");
        List<Images> listImage = query.list();
        session.getTransaction().commit();
        session.close();
        return listImage;
    }
    public boolean insertImage(Images img)
    {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(img);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    public Images getImageById(int id)
    {
        Session session = null;
        Transaction trans = null;
        Images imgs = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("FROM Images  WHERE imageId=:id");
            query.setInteger("id", id);
            imgs = (Images) query.uniqueResult();
            
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return imgs;
    }
    public List<Images> getImageByProductId(int id)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Images  WHERE products.productId=:id");
        query.setInteger("id", id);
        List<Images> listImgs = query.list();
        session.getTransaction().commit();
        session.close();
        return listImgs;
    }
    public boolean deleteImagePro(int id)
    {
        Session session = null;
        Transaction trans =null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            List<Images> listImgs = getImageByProductId(id);
            for (Images imgs: listImgs) {
                session.delete(imgs);
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
    
    public boolean deleteImages(int id)
    {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Images img = getImageById(id);
            if (img!=null) {
                session.delete(img);
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
