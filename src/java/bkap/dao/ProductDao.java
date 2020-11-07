/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import bkap.entity.Products;
import java.util.List;

/**
 *
 * @author asuspc
 */
public interface ProductDao {
    public List<Products> getAllPro();
    public boolean insertPro(Products pro);
    public boolean updatePro(Products pro);
    public Products getProById(int id);
    public boolean deletePro(int id);
}
