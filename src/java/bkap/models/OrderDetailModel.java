/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.entity.OrderDetail;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class OrderDetailModel {
    public List<OrderDetail> ListOrderDetailByOrderId(int orderId)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM OrderDetail WHERE orders.orderId=:orderId");
        query.setInteger("orderId", orderId);
        List<OrderDetail> listOrderDetail = query.list();
        session.getTransaction().commit();
        session.close();
        return listOrderDetail;
    }
    
}
