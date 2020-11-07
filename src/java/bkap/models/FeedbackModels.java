/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.entity.Feedback;
import bkap.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class FeedbackModels {
    public boolean insertFeedback(Feedback feedback) throws ParseException
    {
        //set ngay hien tai cho feedback
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
        Date dateNow = new Date();  
        feedback.setCreated(new SimpleDateFormat("yyyy-MM-dd").parse(formatter.format(dateNow)));
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(feedback);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    public List<Feedback> getAllFeedback()
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Feedback ORDER BY created DESC");
        List<Feedback> listFB = query.list();
        session.getTransaction().commit();
        session.close();
        return listFB;
    }
    public Feedback getFBById(int id)
    {
        Session session = null;
        Transaction trans = null;
        Feedback feeb = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("FROM Feedback WHERE feedbackId=:id");
            query.setInteger("id", id);
            feeb = (Feedback) query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feeb;
    }
}
