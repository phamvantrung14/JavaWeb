/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.dao.TypePolicyStoreDao;
import bkap.entity.PaginateDto;
import bkap.entity.TypePolicyStore;
import bkap.models.PaginateModel;
import bkap.models.TypePolicyStoreModels;
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
@RequestMapping(value = "/typePsController")
public class TypePolicyStoreController {
    private TypePolicyStoreModels typePsModel;
    private PaginateModel pagiModel;
    private int totalTPoliPage = 10;
    public TypePolicyStoreController()
    {
        typePsModel = new TypePolicyStoreModels();
        pagiModel = new PaginateModel();
    }
    
    @RequestMapping(value = "/getAll")
    public ModelAndView getAllTypePs(int page)
    {
        ModelAndView mav = new ModelAndView("admin/typePolicyStore/listTypePs");
        List<TypePolicyStore> listTypePs = typePsModel.getAllTypePolicyStore();
        //paginate
        int totalData = typePsModel.getAllTypePolicyStore().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalTPoliPage, page);
        List<TypePolicyStore> listTPoliPagi = typePsModel.getTypePoliPaginate(paginateInfo.getStart(), totalTPoliPage);
        
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listTypePs",listTPoliPagi);
        
        TypePolicyStore typePs = new TypePolicyStore();
        mav.addObject("typePsNew",typePs);
        return mav;
    }
    
    @RequestMapping(value = "/insertPolicySt",method = RequestMethod.POST)
    public String storePolicySt(TypePolicyStore typePs)
    {
        boolean check = typePsModel.insertTypePolicyStore(typePs);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "error";
        }
    }
    
    @RequestMapping(value = "/editTypePs")
    public ModelAndView editTypePs(int id)
    {
        ModelAndView mav = new ModelAndView("admin/typePolicyStore/editTypePs");
        TypePolicyStore typePs = typePsModel.getTypePolicyStoreById(id);
        mav.addObject("typePsEdit",typePs);
        return mav;
    }
    
    @RequestMapping(value = "/updateTypePs",method = RequestMethod.POST)
    public String updateTypePs(TypePolicyStore typePs)
    {
        boolean check = typePsModel.updateTypePolicyStore(typePs);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "error";
        }
    }
    
    @RequestMapping(value = "/deleteTypePs")
    public String deletePolicyPs(int id)
    {
        boolean check = typePsModel.deleteTypePolicyStore(id);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "error";
        }
    }
}
