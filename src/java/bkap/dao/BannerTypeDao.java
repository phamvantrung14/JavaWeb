/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import bkap.entity.BannerType;
import java.util.List;

/**
 *
 * @author asuspc
 */
public interface BannerTypeDao {
    public List<BannerType> getAllBannerType();
    public boolean insertBannerType(BannerType bannerType);
    public boolean updateBannerType(BannerType bannerType);
    public BannerType getBannerTypeById(int id);
    public boolean deleteBannerType(int id);
}
