/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.entity.OrderDetail;
import bkap.entity.Orders;
import bkap.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class OrdersModel {
    public List<Orders> getAllOrder()
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Orders");
        List<Orders> listOrder = query.list();
        session.getTransaction().commit();
        session.close();
        return listOrder;
    }
    
    public boolean insertOrder(Orders orders) throws ParseException
    {
        //set ngay hien tai
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date dateNow = new Date();
        orders.setCreated(new SimpleDateFormat("yyyy-MM-dd").parse(formatter.format(dateNow)));
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(orders);
            session.flush();
            List<OrderDetail> listOrderDetail = new ArrayList<>(orders.getOrderDetails());
            for (OrderDetail odd: listOrderDetail) {
                odd.setOrders(orders);
                session.save(odd);
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
    public List<Orders> getOrderByStatus()
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Orders ORDER BY orderStatus ASC");
        List<Orders> listOrder  = query.list();
        session.getTransaction().commit();
        session.close();       
        return listOrder;
    }
    //paginate
    public List<Orders> getOrderPaginate(int start, int end)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Orders ORDER BY orderStatus ASC");
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<Orders> listOrder  = query.list();
        session.getTransaction().commit();
        session.close();       
        return listOrder;
    }
    // get order by status
    public List<Orders> getOrderByStatus(int start, int end,int status)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Orders WHERE orderStatus=:status ORDER BY orderStatus ASC");
        query.setInteger("status", status);
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<Orders> listOrder  = query.list();
        session.getTransaction().commit();
        session.close();       
        return listOrder;
    }
    public List<Orders> getOrderByStatusCount(int status)
    {
         Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Orders WHERE orderStatus=:status ORDER BY orderStatus ASC");
        query.setInteger("status", status);
        List<Orders> listOrder  = query.list();
        session.getTransaction().commit();
        session.close();       
        return listOrder;
    }
    public Orders getOrderById(int id)
    {
        Session session = null;
        Transaction trans = null;
        Orders order = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("FROM Orders WHERE id=:id");
            query.setInteger("id", id);
            order = (Orders) query.uniqueResult();
            session.getTransaction().commit();
            session.close();          
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }
    public Boolean update(Orders order)
    {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.merge(order);
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
