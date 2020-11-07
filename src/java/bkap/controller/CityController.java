/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Citys;
import bkap.entity.PaginateDto;
import bkap.models.CityModels;
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
@RequestMapping(value = "/cityController")
public class CityController {
    private CityModels cityModels;
    private PaginateModel pagiModel;
    private int totalCityPage =10;
    public CityController()
    {
        cityModels = new CityModels();
        pagiModel = new PaginateModel();
    }
    
    @RequestMapping(value = "/getAll")
    public ModelAndView getAllCity(int page)
    {
        ModelAndView mav = new ModelAndView("admin/citys/listCitys");
        List<Citys> listCitys = cityModels.getAllCity();
        //paginte phan trang
        int totalData = cityModels.getAllCity().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalCityPage, page);
        List<Citys> listCityPagi = cityModels.getCityPaginate(paginateInfo.getStart(), totalCityPage);
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listCitys",listCityPagi);
        Citys city = new Citys();
        mav.addObject("cityNews",city);
        return mav;
    }
    
    @RequestMapping(value = "/insertCity",method = RequestMethod.POST)
    public String storeCity(Citys citys)
    {
        boolean check = cityModels.insertCity(citys);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "redirect:getAll.htm?page=1";
        }
    }
    
    @RequestMapping(value = "/editCitys")
    public ModelAndView editCitys(int id)
    {
        ModelAndView mav = new ModelAndView("admin/citys/editCity");
        Citys city = cityModels.getCityById(id);
        mav.addObject("cityEdit",city);
        return mav;
    }
    
    @RequestMapping(value = "/updateCitys",method = RequestMethod.POST)
    public String updateCity(Citys city)
    {
        boolean check = cityModels.updateCity(city);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else{
            return "redirect:getAll.htm?page=1";
        }
    }
    
    @RequestMapping(value = "deleteCitys")
    public String deleteCity(int id)
    {
        boolean check = cityModels.deleteCity(id);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "redirect:getAll.htm?page=1";
        }
    }
}
