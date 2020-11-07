/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.dao.ParameterDao;
import bkap.entity.Parameter;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class ParameterModels implements ParameterDao{

    @Override
    public List<Parameter> getAllParam() {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Parameter");
        List<Parameter> listParam = query.list();
        session.getTransaction().commit();
        session.close();
        return listParam;
    }
    
    public List<Parameter> getParamPaginate(int start, int end)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Parameter");
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<Parameter> listParam = query.list();
        session.getTransaction().commit();
        session.close();
        return listParam;
    }
    
    @Override
    public boolean insertParam(Parameter param) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(param);
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
    public boolean updateParam(Parameter param) {
       Session session = null;
       Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.merge(param);
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
    public Parameter getParamById(int id) {
        Session session = null;
        Transaction trans = null;
        Parameter param = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("FROM Parameter WHERE paramId=:id");
            query.setInteger("id", id);
            param = (Parameter) query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return param;
    }

    @Override
    public boolean deletePram(int id) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Parameter param = getParamById(id);
            if (param!=null) {
                session.delete(param);
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
