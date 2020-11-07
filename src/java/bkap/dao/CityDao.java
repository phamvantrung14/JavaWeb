/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import bkap.entity.Citys;
import java.util.List;

/**
 *
 * @author asuspc
 */
public interface CityDao {
    public List<Citys> getAllCity();
    public boolean insertCity(Citys citys);
    public boolean updateCity(Citys citys);
    public Citys getCityById(int id);
    public boolean deleteCity(int id);
}
