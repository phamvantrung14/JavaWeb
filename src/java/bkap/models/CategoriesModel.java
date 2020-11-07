/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.dao.CategoriesDao;
import bkap.entity.Categories;
import bkap.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;

/**
 *
 * @author asuspc
 */
public class CategoriesModel implements CategoriesDao{

    @Override
    public List<Categories> getAllCate() {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Categories ORDER BY catName ASC");
        List<Categories> listCate = query.list();
        session.getTransaction().commit();
        session.close();
        return listCate;
    }
    //paginate phan trang
    public  List<Categories> getCatePaginate(int start, int end)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Categories ORDER BY catName ASC");
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<Categories> listCate = query.list();
        session.getTransaction().commit();
        session.close();
        return listCate;
    }
    
    
    //paginate
    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory)
    {
        this.sessionFactory = sessionFactory;
    } 
    public List<Categories> getCategories(Integer offset,Integer maxResults)
    {
        return sessionFactory.openSession().createCriteria(Categories.class)
                .setFirstResult(offset!=null ? offset:0)
                .setMaxResults(maxResults != null ? maxResults:10)
                .list();
    }
    public  long getTotalCategories()
    {
        return (Long)sessionFactory.openSession()
                .createCriteria(Categories.class)
                .setProjection(Projections.rowCount())
                .uniqueResult();
    }
    @Override
    public boolean insertCate(Categories cate) {
        Session session = null;
        Transaction trans =null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(cate);
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
    public boolean updateCate(Categories cate) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.merge(cate);
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
    public Categories getCateById(int id) {
        Session session = null;
        Transaction trans = null;
        Categories cate = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("FROM Categories WHERE id=:id");
            query.setInteger("id", id);
            cate = (Categories) query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cate;
    }

    @Override
    public boolean deleteCate(int id) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Categories cate = getCateById(id);
            if (cate!=null) {
                session.delete(cate);
            }
            session.getTransaction().commit();
            session.close();
            return  true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    //tiem kiem theo trang thái
    public List<Categories> getCateByStatusFalse()
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Categories c WHERE c.catStatus = false");
        //query.setInteger("st", st);
        List<Categories> listCate = query.list();
        session.getTransaction().commit();
        session.close();
        return listCate;
    }
     public List<Categories> getCateByStatusTrue()
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Categories c WHERE c.catStatus = true");
        //query.setInteger("st", st);
        List<Categories> listCate = query.list();
        session.getTransaction().commit();
        session.close();
        return listCate;
    }
     
     public List<Categories> getCateByParentId(int id)
     {
         Session session = null;
         Transaction trans = null;
         session = HibernateUtil.getSessionFactory().openSession();
         trans = session.getTransaction();
         trans.begin();
         Query query = session.createQuery("FROM Categories WHERE catStatus = True AND parentId=:id");
         query.setInteger("id", id);
         List<Categories> listCate = query.list();
         session.getTransaction().commit();
         session.close();
         return listCate;
     }
    
}
