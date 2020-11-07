/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import bkap.entity.Categories;
import java.util.List;

/**
 *
 * @author asuspc
 */
public interface CategoriesDao {
    public List<Categories> getAllCate();
    public boolean insertCate(Categories cate);
    public boolean updateCate(Categories cate);
    public Categories getCateById(int id);
    public boolean  deleteCate(int id);
}
