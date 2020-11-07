/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Citys;
import bkap.entity.PaginateDto;
import bkap.entity.Stores;
import bkap.models.CityModels;
import bkap.models.PaginateModel;
import bkap.models.StoresModels;
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
@RequestMapping(value = "/storeController")
public class StoreController {
    private StoresModels storeModel;
    private CityModels cityModel;
    private PaginateModel pagiModel;
    private int totalStorePage = 10;
    public StoreController()
    {
        storeModel = new StoresModels();
        cityModel = new CityModels();
        pagiModel = new PaginateModel();
    }
    
    @RequestMapping(value = "/getAll")
    public ModelAndView getAllStore(int page)
    {
        ModelAndView mav = new ModelAndView("admin/store/listStore");
        List<Stores> listStore = storeModel.getAllStore();
        //paginate
        int totalData = storeModel.getAllStore().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalStorePage, page);
        List<Stores> listStorePagi = storeModel.getStorePaginate(paginateInfo.getStart(), totalStorePage);
        mav.addObject("paginateInfo",paginateInfo);
        
        mav.addObject("listStore",listStorePagi);
        return mav;
    }
    
    @RequestMapping(value = "/addStore")
    public ModelAndView addStore()
    {
        ModelAndView mav = new ModelAndView("admin/store/addStore");
        Stores store = new Stores();
        mav.addObject("storeNew",store);
        List<Citys> listCity = cityModel.getAllCity();
        mav.addObject("listCity",listCity);
        return mav;
    }
    
    @RequestMapping(value = "/insertStore",method = RequestMethod.POST)
    public String storeStore(Stores store)
    {
        boolean check = storeModel.insertStore(store);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
             return "error";
        }
    }
    
    @RequestMapping(value = "/editStore")
    public ModelAndView editStore(int id)
    {
        ModelAndView mav = new ModelAndView("admin/store/editStore");
        Stores store = storeModel.getStoresById(id);
        mav.addObject("editStore",store);
        List<Citys> listCity = cityModel.getAllCity();
        mav.addObject("listCity",listCity);
        return mav;
    }
    
    @RequestMapping(value = "/updateStore",method = RequestMethod.POST)
    public String updateStore(Stores store)
    {
        boolean check = storeModel.updateStore(store);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "error";
        }
    }
    
    @RequestMapping(value = "/deleteStore")
    public String deleteStore(int id)
    {
        boolean check = storeModel.deleteStore(id);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
             return "error";
        }
    }
}
