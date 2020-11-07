/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.dao.ProductDao;
import bkap.entity.Gift;
import bkap.entity.GiftProduct;
import bkap.entity.Images;
import bkap.entity.ProductParameter;
import bkap.entity.ProductParameterId;
import bkap.entity.ProductPolicy;
import bkap.entity.Products;
import bkap.util.HibernateUtil;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asuspc
 */
public class ProductsModels implements ProductDao {

    @Override
    public List<Products> getAllPro() {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Products");
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
    public List<Products> getProductPaginate(int start, int end)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Products");
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }

    @Override
    public boolean insertPro(Products pro) {
        Session session = null;
        Transaction trans = null;
        boolean check = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            //Insert product
           session.save(pro);
        
            session.flush();
            //Insert Image
            List<Images> listImg = new ArrayList<>(pro.getImageses());
            for (Images img : listImg) {
                img.setProducts(pro);
                session.save(img);
            }
            
            //Insert productParam
            List<ProductParameter> listPP = new ArrayList<>(pro.getProductParameters());
            for (ProductParameter pP: listPP) {
                pP.setId(new ProductParameterId(pro.getProductId(), pP.getParameter().getParamId()));
                pP.setProducts(pro);
                session.save(pP);
            }
            
            List<GiftProduct> listGP = new ArrayList<>(pro.getGiftProducts());
            for (GiftProduct gP: listGP) {
                gP.setProducts(pro);
                session.save(gP);
            }
            
            List<ProductPolicy> listProPoli = new ArrayList<>(pro.getProductPolicies());
            for (ProductPolicy proPoli: listProPoli) {
                proPoli.setProducts(pro);
                session.save(proPoli);
            }

            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return check;

    }

    @Override
    public boolean updatePro(Products pro) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            
            session.merge(pro);
            
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
    public Products getProById(int id) {
        Session session = null;
        Transaction trans = null;
        Products pro = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("FROM Products WHERE productId=:id");
            query.setInteger("id", id);
            pro = (Products) query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pro;
    }

    @Override
    public boolean deletePro(int id) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Products pro = getProById(id);
            if (pro!=null) {
                session.delete(pro);
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
    
    //tim kiem san pham theo ten và danh muc
    public List<Products> getProductByName(String search,int cateid)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Products WHERE productName LIKE :search AND categories.catId=:id");
        query.setString("search","%"+ search +"%");
        query.setInteger("id", cateid);
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
    //tim kiem san pham theo ten
    public  List<Products> getProBySearchName(String name)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Products WHERE productName LIKE :search ");
        query.setString("search","%"+ name +"%");
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
    
    public List<Products> getListProductById(int id,int qty)
    {
         Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Products WHERE categories.catId=:id");
        query.setInteger("id", id);
        query.setMaxResults(qty);
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
    
    //lay tat ca san pham co luot xxem nhieu nhat
    public List<Products> getListProByViewDESC(int qty)
    {
         Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin(); 
        Query query = session.createQuery("FROM Products ORDER BY productView DESC");        
        query.setMaxResults(qty);
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
      public List<Products> getListProductByParenId(int id)
    {
         Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        
        Query query = session.createQuery("FROM Products  WHERE categories.parentId=:id");
        query.setInteger("id", id);
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
    
    public List<Products> getListProByStatusTrue()
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Products WHERE productStatus = true");
      
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
    public List<Products> getListProByStatusFalse()
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Products WHERE productStatus = false");
      
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
    //lay san pham the hang
    public List<Products> getListProByBrand(int brandId)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Products WHERE brands.brandId=:brandId");
        query.setInteger("brandId", brandId);
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
        
    }
    //lay san pha mtheo hang phan trang
    public List<Products> getListProByBrandPaginate(int brandId,int start, int end )
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Products WHERE brands.brandId=:brandId");
        query.setInteger("brandId", brandId);
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
        
    }
    public List<Products> getListProByCate(int cateId)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Products WHERE categories.catId=:cateId");
        query.setInteger("cateId", cateId);
        
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
     public List<Products> getListProByCatePaginate(int cateId,int start, int end)
    {
        Session session = null;
        Transaction trans = null;
        session = HibernateUtil.getSessionFactory().openSession();
        trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("FROM Products WHERE categories.catId=:cateId");
        query.setInteger("cateId", cateId);
        query.setFirstResult(start);
        query.setMaxResults(end);
        List<Products> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
    

}
