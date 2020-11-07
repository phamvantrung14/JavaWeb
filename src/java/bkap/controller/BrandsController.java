/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Brands;
import bkap.entity.PaginateDto;
import bkap.models.BrandsModel;
import bkap.models.PaginateModel;
import bkap.util.MyUploadFile;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author asuspc
 */
@Controller
@RequestMapping(value = "/brandsController")
public class BrandsController {
    private BrandsModel brandsModel;
    private PaginateModel pagiModel;
    private int totalBrandPage = 8;
    public BrandsController()
    {
        brandsModel = new BrandsModel();
        pagiModel = new PaginateModel();
    }
    
    @RequestMapping(value = "/getAll")
    public ModelAndView getAllBrands(int page)
    {
        ModelAndView mav = new ModelAndView("admin/brands/listBrand");
        List<Brands> listBrand = brandsModel.getAllBrands();
        int totalData = brandsModel.getAllBrands().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalBrandPage, page);
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listBrands",brandsModel.getBrandPaginate(paginateInfo.getStart(), totalBrandPage));
        Brands brand = new Brands();
        mav.addObject("brandNew",brand);
        return mav;
    }
    
    @RequestMapping(value = "/insertBrand",method = RequestMethod.POST)
    public String storeBrand(Brands brandNew, HttpServletRequest request, @RequestParam(value = "imageBrand") MultipartFile imageBrand)throws  IOException
    {
        String file = "brands/";
        //luu anh chinh vao thu muc va add duong dan vao brandNew
       brandNew.setBrandImage(new MyUploadFile().saveImageToFolder(request, imageBrand,file));
      boolean check = brandsModel.insertBrand(brandNew);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }else
        {
            return "redirect:getAll.htm?page=1";
        }
        
    }
    
    @RequestMapping(value = "/editBrand")
    public ModelAndView editBrand(int id)
    {
        ModelAndView mav = new ModelAndView("admin/brands/editBrands");
        Brands brand = brandsModel.getBrandById(id);
        mav.addObject("brandEdit",brand);
        return mav;
    }
    
    @RequestMapping(value = "/updateBrands",method = RequestMethod.POST)
    public String updateBrand(Brands brandNew, HttpServletRequest request, @RequestParam(value = "imageBrand")MultipartFile imageBrand)throws  IOException
    {
        String file = "brands/";
        Brands brand = brandsModel.getBrandById(brandNew.getBrandId());
        
        if (imageBrand.getSize() > 0) {
            brandNew.setBrandImage(new MyUploadFile().saveImageToFolder(request, imageBrand,file));
        }else
        {
            brandNew.setBrandImage(brand.getBrandImage());
        }
        boolean check = brandsModel.updateBrand(brandNew);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }else
        {
            return "redirect:getAll.htm?page=1";
        }
    }
    
    @RequestMapping(value = "/deleteBrand")
    public String deleteBrand(int id)
    {
        boolean check = brandsModel.deleteBrand(id);
       if (check) {
            return "redirect:getAll.htm?page=1";
        }else
        {
            return "redirect:getAll.htm?page=1";
        }
    }
}
