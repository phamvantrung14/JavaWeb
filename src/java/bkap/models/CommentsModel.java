/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.entity.Comments;
import bkap.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class CommentsModel {
    
    public boolean insertComment(Comments cm) throws ParseException
    {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date dateNow = new Date();
        cm.setCreated(new SimpleDateFormat("yyyy-MM-dd").parse(formatter.format(dateNow)));
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.save(cm);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    public List<Comments> getListCommentByProId(int proId)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Comments WHERE products.productId=:proId");
        query.setInteger("proId", proId);
        List<Comments> listComent = query.list();
        session.getTransaction().commit();
        session.close();
        return listComent;
    }
    public List<Comments> getListCommentByParentId(int id)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Comments WHERE parenId=:id");
        query.setInteger("id", id);
        List<Comments> listCm = query.list();
        session.getTransaction().commit();
        session.close();
        return listCm;
    }
    
}
