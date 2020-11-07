/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Banner;
import bkap.entity.BannerType;
import bkap.entity.PaginateDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import bkap.models.BannerModels;
import bkap.models.BannerTypeModels;
import bkap.models.PaginateModel;
import bkap.util.MyUploadFile;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author asuspc
 */
@Controller
@RequestMapping(value = "/bannerController")
public class BannerController {
    private BannerModels bannerModels;
    private BannerTypeModels bnTypeModels;
    private PaginateModel pagiModel;
    private int totalBannerPage = 10;
    public BannerController()
    {
        bannerModels = new BannerModels();
        bnTypeModels = new BannerTypeModels();
        pagiModel = new PaginateModel();
    }
    
    
    @RequestMapping(value = "/getAll")
    public ModelAndView getAllBanner(int page)
    {
        ModelAndView mav = new ModelAndView("admin/banner/listBanner");
        List<Banner> listBanner = bannerModels.getAllBanner();
        //paginate
        int totalData = bannerModels.getAllBanner().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalBannerPage, page);
        List<Banner> listBannerPagi = bannerModels.getBannerPaginate(paginateInfo.getStart(), totalBannerPage);
        mav.addObject("paginateInfo",paginateInfo);
        
        mav.addObject("listBanner",listBannerPagi);
        Banner banner = new Banner();
        mav.addObject("bannerNew",banner);
        List<BannerType> listBNType = bnTypeModels.getAllBannerType();
        mav.addObject("bannerType",listBNType);
        return mav;
    }
    
    @RequestMapping(value = "/insertBanner", method = RequestMethod.POST)
    public String storeBanner(Banner bannerNew, HttpServletRequest request,@RequestParam(value="imageBanner") MultipartFile imageBanner)
            throws IOException
    {
     String file = "banners/";   
     bannerNew.setImageLink(new MyUploadFile().saveImageToFolder(request, imageBanner, file));
     boolean check = bannerModels.insertBanner(bannerNew);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "error";
        }
    }
    
   @RequestMapping(value = "/editBanner")
   public ModelAndView editBanner(int id)
   {
       ModelAndView mav = new ModelAndView("admin/banner/editBanner");
       Banner banner = bannerModels.getBannerById(id);
       mav.addObject("bannerEdit",banner);
       List<BannerType> listBNType = bnTypeModels.getAllBannerType();
        mav.addObject("bannerType",listBNType);
       return mav;
   }
   
   @RequestMapping(value = "/updateBanner",method = RequestMethod.POST)
   public String updateBanner(Banner bannerUp,HttpServletRequest request,@RequestParam(value = "imageBanner")MultipartFile imageBanner)throws IOException
   {
       String file = "banners/";  
       Banner b1 = bannerModels.getBannerById(bannerUp.getBannerId());
       if (imageBanner.getSize()>0) {
            
           bannerUp.setImageLink(new MyUploadFile().saveImageToFolder(request, imageBanner, file));
       }else
       {
           bannerUp.setImageLink(b1.getImageLink());
       }
       boolean check = bannerModels.updateBanner(bannerUp);
         if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "error";
        }
        
   }
   
   @RequestMapping(value = "/deleteBanner")
   public String deleteBanner(int id)
   {
       boolean check = bannerModels.deleteBanner(id);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "error";
        }
   }
}
