/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.PaginateDto;
import bkap.models.PolicyStoreModels;
import bkap.entity.PolicyStore;
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
@RequestMapping(value = "/policyStoreController")
public class PolicyStoresController {
    private PolicyStoreModels pSModels;
    private TypePolicyStoreModels tPSModels;
    private PaginateModel pagiModel;
    private int totalPoliSTPage = 10;
    public PolicyStoresController()
    {
        pSModels = new PolicyStoreModels();
        tPSModels = new TypePolicyStoreModels();
        pagiModel = new PaginateModel();
    }
    
    @RequestMapping(value = "/getAll")
    public ModelAndView getAllPolicyStore(int page)
    {
        ModelAndView mav = new ModelAndView("admin/policyStore/listPolicyStore");
        List<PolicyStore> listPs = pSModels.getAllPlicyStore();
        //paginate
        int totalData = pSModels.getAllPlicyStore().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalPoliSTPage, page);
        List<PolicyStore> listPoliPagi = pSModels.getPoliSTPaginate(paginateInfo.getStart(), totalPoliSTPage);
        
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listPs",listPoliPagi);
        PolicyStore policyStore = new PolicyStore();
        mav.addObject("pSNew",policyStore);
        List<TypePolicyStore> listTypePS = tPSModels.getAllTypePolicyStore();
        mav.addObject("listTypePs",listTypePS);
        return mav;
    }
    
    @RequestMapping(value = "/insertPolicyStore",method = RequestMethod.POST)
    public String storePolicyStore(PolicyStore policyStore)
    {
        boolean check = pSModels.insertPolicyStore(policyStore);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "error";
        }
    }
    
    @RequestMapping(value = "/editPolicyStore")
    public ModelAndView editPolicyStore(int id)
    {
        ModelAndView mav = new ModelAndView("admin/policyStore/editPolicyStore");
        PolicyStore poliStore = pSModels.getPolicyStoreById(id);
        mav.addObject("editPs",poliStore);
        List<TypePolicyStore> listTypePS = tPSModels.getAllTypePolicyStore();
        mav.addObject("listTypePs",listTypePS);
        return mav;
    }
    
    @RequestMapping(value = "/updatePolicyStore",method = RequestMethod.POST)
    public String updatePolicyStore(PolicyStore poli)
    {
        boolean check = pSModels.updatePolicyStore(poli);
         if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "error";
        }
    }
    
    @RequestMapping(value = "/deletePolicyStore")
    public String deletePolicyStore(int id)
    {
        boolean check = pSModels.deletePolicyStore(id);
          if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "error";
        }
    }
}
