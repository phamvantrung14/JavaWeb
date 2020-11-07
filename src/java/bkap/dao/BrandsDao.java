/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import bkap.entity.Brands;
import java.util.List;

/**
 *
 * @author asuspc
 */
public interface BrandsDao {
    public List<Brands> getAllBrands();
    public boolean insertBrand(Brands brand);
    public boolean updateBrand(Brands brand);
    public Brands getBrandById(int id);
    public boolean deleteBrand(int id);
}
