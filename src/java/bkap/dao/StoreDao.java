/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import bkap.entity.Stores;
import java.util.List;


/**
 *
 * @author asuspc
 */
public interface StoreDao {
    public List<Stores> getAllStore();
    public boolean insertStore(Stores stores);
    public boolean updateStore(Stores stores);
    public Stores getStoresById(int id);
    public boolean deleteStore(int id);
}
