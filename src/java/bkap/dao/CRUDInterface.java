/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import java.util.List;

/**
 *
 * @author asuspc
 */
public interface CRUDInterface {
    public List<Object> getAll();
    public boolean insertData(Object object);
    public boolean updateData(Object object);
    public Object getDataById(int id);
    public boolean deleteData(int id);
    
}
