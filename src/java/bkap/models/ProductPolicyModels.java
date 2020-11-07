/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.entity.GiftProduct;
import bkap.entity.ProductPolicy;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class ProductPolicyModels {
   public List<ProductPolicy> getProductPolicyByProId(int id)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM ProductPolicy WHERE products.productId=:id");
        query.setInteger("id", id);
        List<ProductPolicy> listPP = query.list();
        session.getTransaction().commit();
        session.close();
        return listPP;
    }
   public boolean insertProductPolicy(List<ProductPolicy> listProPoli)
   {
       Session session = null;
       Transaction trans = null;
       try {
           session = HibernateUtil.getSessionFactory().openSession();
           trans = session.getTransaction();
           trans.begin();
           for (ProductPolicy pP : listProPoli) {
               session.save(pP);
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
   public boolean deleteProductPolicy(int id)
   {
       Session session = null;
       Transaction trans = null;
       try {
           session = HibernateUtil.getSessionFactory().openSession();
           trans = session.getTransaction();
           trans.begin();
           List<ProductPolicy> listPP = getProductPolicyByProId(id);
           for (ProductPolicy pP : listPP) {
               session.delete(pP);
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
