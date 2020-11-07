/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.entity.Users;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class UsersModel {
    public boolean registerUser(Users user)
    {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.save(user);
            
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    public List<Users> getAllUser()
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans  = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Users");
        List<Users> listUser = query.list();
        
        session.getTransaction().commit();
        session.close();
        return listUser;        
    }
}
