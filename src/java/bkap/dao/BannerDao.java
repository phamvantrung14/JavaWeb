/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import bkap.entity.Banner;
import java.util.List;

/**
 *
 * @author asuspc
 */
public interface BannerDao {
    public List<Banner> getAllBanner();
    public boolean insertBanner(Banner banner);
    public boolean updateBanner(Banner banner);
    public Banner getBannerById(int id);
    public boolean deleteBanner(int id);
}
