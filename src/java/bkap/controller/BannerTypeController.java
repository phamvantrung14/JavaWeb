/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.BannerType;
import bkap.entity.PaginateDto;
import bkap.models.BannerTypeModels;
import bkap.models.PaginateModel;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author asuspc
 */
@Controller
@RequestMapping(value = "/bannerTypeController")
public class BannerTypeController {
    private BannerTypeModels bannerTypeModels;
    private PaginateModel pagiModel;
    private int totalBannerTypePage = 10;
    public BannerTypeController()
    {
        bannerTypeModels = new BannerTypeModels();
        pagiModel = new PaginateModel();
    }
    
    @RequestMapping(value = "/getAll")
    public ModelAndView getAllBannerType(int page)
    {
        ModelAndView mav = new ModelAndView("admin/bannerType/listBannerType");
        List<BannerType> listBannerType = bannerTypeModels.getAllBannerType();
        //paginate
        int totalData = bannerTypeModels.getAllBannerType().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalBannerTypePage, page);
        List<BannerType> listBannerTPagi = bannerTypeModels.getBannerTypePaginate(paginateInfo.getStart(), totalBannerTypePage);
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listBannerType",listBannerTPagi);
        BannerType bannerType = new BannerType();
        mav.addObject("bannerTypeNew",bannerType);
        return mav;
    }
    
    @RequestMapping(value = "/insertBNType",method = RequestMethod.POST)
    public String storeBannerType(BannerType bnType)
    {
        boolean check = bannerTypeModels.insertBannerType(bnType);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }else
        {
             return "redirect:getAll.htm?page=1";
        }
    }
    
    @RequestMapping(value = "/editBNType")
    public ModelAndView editBannerType(int id)
    {
        ModelAndView mav = new ModelAndView("admin/bannerType/editBannerType");
        BannerType bannerType = bannerTypeModels.getBannerTypeById(id);
        mav.addObject("bnTypeEdit",bannerType);
        return mav;
    }
    
    @RequestMapping(value = "/updateBNType",method = RequestMethod.POST)
    public String updateBNType(BannerType bnType)
    {
        boolean check = bannerTypeModels.updateBannerType(bnType);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else{
            return "redirect:getAll.htm?page=1";
        }
    }
    
    @RequestMapping(value = "/deleteBNType")
    public String deleteBNType(int id)
    {
        boolean check = bannerTypeModels.deleteBannerType(id);
        if(check)
        {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "redirect:getAll.htm?page=1";
        }
    }
}
