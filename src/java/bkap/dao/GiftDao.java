/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import bkap.entity.Gift;
import java.util.List;

/**
 *
 * @author asuspc
 */
public interface GiftDao {
    public List<Gift> getAllGift();
    public  boolean insertGift(Gift gift);
    public boolean updateGift(Gift gift);
    public Gift getGiftById(int id);
    public boolean deleteGift(int id);
}
