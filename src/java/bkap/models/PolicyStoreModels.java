/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.dao.PolicyStoreDao;
import bkap.entity.PolicyStore;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class PolicyStoreModels implements PolicyStoreDao{

    @Override
    public List<PolicyStore> getAllPlicyStore() {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM PolicyStore");
        List<PolicyStore> listPolicyStore = query.list();
        
        session.getTransaction().commit();
        session.close();
        return listPolicyStore;
    }
    
   //paginate phan trang
    public List<PolicyStore> getPoliSTPaginate(int start,int end)
    {
          Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM PolicyStore");
         query.setFirstResult(start);
        query.setMaxResults(end); 
        List<PolicyStore> listPolicyStore = query.list();
       
        session.getTransaction().commit();
        session.close();
        return listPolicyStore;
    }

    @Override
    public boolean insertPolicyStore(PolicyStore policyStore) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.save(policyStore);
            
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
    public boolean updatePolicyStore(PolicyStore policyStore) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.merge(policyStore);
            
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
    public PolicyStore getPolicyStoreById(int id) {
        Session session = null;
        Transaction trans = null;
        PolicyStore policyStore = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            Query query = session.createQuery("FROM PolicyStore WHERE policyStoreId=:id");
            query.setInteger("id", id);
            policyStore = (PolicyStore)query.uniqueResult();
            
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return policyStore;
    }

    @Override
    public boolean deletePolicyStore(int id) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            PolicyStore policyStore = getPolicyStoreById(id);
            if (policyStore!=null) {
                session.delete(policyStore);
            }
            
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return true;
    }
    
    public List<PolicyStore> getPoliStoreByType(int type)
    {
        Session session = null;
        Transaction trans = null;
           session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM PolicyStore WHERE typePolicyStore.typePsid =:type");
        query.setInteger("type", type);
        List<PolicyStore> listPolicyStore = query.list();
        
        session.getTransaction().commit();
        session.close();
        return listPolicyStore;
    }
    
}
