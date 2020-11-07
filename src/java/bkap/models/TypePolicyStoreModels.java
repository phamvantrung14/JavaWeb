/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.dao.TypePolicyStoreDao;
import bkap.entity.TypePolicyStore;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class TypePolicyStoreModels implements TypePolicyStoreDao{

    @Override
    public List<TypePolicyStore> getAllTypePolicyStore() {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM TypePolicyStore");
        List<TypePolicyStore> listTypePs = query.list();
        session.getTransaction().commit();
        session.close();
        return listTypePs;
    }
    
   //paginate phan trang
    public List<TypePolicyStore> getTypePoliPaginate(int start,int end)
    {
           Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM TypePolicyStore");
         query.setFirstResult(start);
        query.setMaxResults(end);
        List<TypePolicyStore> listTypePs = query.list();
        session.getTransaction().commit();
        session.close();
        return listTypePs;
    }

    @Override
    public boolean insertTypePolicyStore(TypePolicyStore typePolicystore) {
      Session session = null;
      Transaction trans =null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.save(typePolicystore);
            
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
    public boolean updateTypePolicyStore(TypePolicyStore typePolicystore) {
       Session session = null;
       Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.merge(typePolicystore);
            
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
    public TypePolicyStore getTypePolicyStoreById(int id) {
        Session session = null;
        Transaction trans = null;
        TypePolicyStore typePs = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            Query query = session.createQuery("FROM TypePolicyStore WHERE typePsid=:id");
            query.setInteger("id", id);
            typePs = (TypePolicyStore) query.uniqueResult();
            
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return typePs;
    }

    @Override
    public boolean deleteTypePolicyStore(int id) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            TypePolicyStore typePs = getTypePolicyStoreById(id);
            if (typePs!=null) {
                session.delete(typePs);
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
