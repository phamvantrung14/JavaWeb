/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.dao.PolicyDao;
import bkap.entity.Policy;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class PolicysModel implements PolicyDao{

    @Override
    public List<Policy> getAllPolicys() {
        Session session =null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Policy");
        List<Policy> listPoli = query.list();
        session.getTransaction().commit();
        session.close();
        return listPoli;
    }
    //paginate chinh sach
    public List<Policy> getPolicysPaginate(int start, int end)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Policy");
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<Policy> listPoli = query.list();
        session.getTransaction().commit();
        session.close();
        return listPoli;
    }

    @Override
    public boolean insertPolicy(Policy poli) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(poli);
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
    public boolean updatePolicy(Policy poli) {
         Session session = null;
         Transaction trans = null;
         try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.merge(poli);
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
    public Policy getPolicyById(int id) {
        Session session = null;
        Transaction trans = null;
        Policy poli = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("FROM Policy WHERE policyId=:id");
            query.setInteger("id", id);
            poli = (Policy) query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
        }
        return poli;
    }

    @Override
    public boolean deletePolicy(int id) {
       Session session = null;
       Transaction trans = null;
        try {
            sessiontrans(session, trans);
            Policy poli = getPolicyById(id);
            if (poli!=null) {
                session.delete(poli);
            }
            comitSession(session);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    public void sessiontrans(Session session,Transaction trans)
    {
        session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
    }
    public void comitSession(Session session)
    {
         session.getTransaction().commit();
            session.close();
    }
    
}
