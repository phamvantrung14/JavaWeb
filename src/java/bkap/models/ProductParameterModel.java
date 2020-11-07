/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.entity.ProductParameter;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class ProductParameterModel {
    
    public List<ProductParameter> getParamProByProductId(int id)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM ProductParameter WHERE products.productId=:id");
        query.setInteger("id", id);
        List<ProductParameter> listProParam = query.list();
        session.getTransaction().commit();
        session.close();
        return listProParam;
    }
   public boolean insertProParam(List<ProductParameter> productParameter)
   {
       Session session = null;
       Transaction trans = null;
     
       try {
           session = HibernateUtil.getSessionFactory().openSession();
           trans = session.getTransaction();
           trans.begin();
           for (ProductParameter pP:productParameter) {
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
   
   public boolean deleteProParam(int id)
   {
       Session session = null;
       Transaction trans = null;
       try {
           session = HibernateUtil.getSessionFactory().openSession();
           trans = session.getTransaction();
           trans.begin();
           
           List<ProductParameter> listProParam = getParamProByProductId(id);
           for (ProductParameter pp:  listProParam) {
               session.delete(pp);
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
