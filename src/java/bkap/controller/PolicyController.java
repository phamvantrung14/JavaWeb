/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.PaginateDto;
import bkap.entity.Policy;
import bkap.models.PaginateModel;
import bkap.models.PolicysModel;
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
@RequestMapping(value = "/policyController")
public class PolicyController {
   private PolicysModel poliModel;
   private PaginateModel pagiModel;
   private int totalPoliPage = 8;
   public PolicyController()
   {
       poliModel = new PolicysModel();
       pagiModel = new PaginateModel();
   }
   
   @RequestMapping(value = "/getAll")
   public ModelAndView getAllPoli(int page)
   {
       ModelAndView mav = new ModelAndView("admin/policy/listPoli");
       List<Policy> listPoli = poliModel.getAllPolicys();
       int totalData = poliModel.getAllPolicys().size();
       PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalPoliPage, page);
       List<Policy> listPoliPagi = poliModel.getPolicysPaginate(paginateInfo.getStart(), totalPoliPage);
       mav.addObject("paginateInfo",paginateInfo);
       mav.addObject("listPoli",listPoliPagi);
       Policy poli = new Policy();
       mav.addObject("poliNew",poli);
       return mav;
   }
   
   @RequestMapping(value = "/insertPolicy",method = RequestMethod.POST)
   public String storePoli(Policy poli)
   {
       boolean check = poliModel.insertPolicy(poli);
       if(check)
       {
           return "redirect:getAll.htm?page=1";
       }
       else
       {
           return "redirect:getAll.htm?page=1";
       }
       
   }
   
   @RequestMapping(value = "/editPolicy")
   public ModelAndView editPolicy(int id)
   {
       ModelAndView mav = new ModelAndView("admin/policy/editPolicy");
       Policy poli = poliModel.getPolicyById(id);
       mav.addObject("poliEdit",poli);
       return mav;
   }
   
   @RequestMapping(value = "/updatePoli",method = RequestMethod.POST)
   public String update(Policy poli)
   {
       boolean check = poliModel.updatePolicy(poli);
       if(check)
       {
           return "redirect:getAll.htm?page=1";
       }
       else
       {
           return "redirect:getAll.htm?page=1";
       }
   }
   
   @RequestMapping(value = "/deletePolicy")
   public String deletePlicy(int id)
   {
       boolean check = poliModel.deletePolicy(id);
       if (check) {
           return "redirect:getAll.htm?page=1";
           
       }
       else
       {
            return "redirect:getAll.htm?page=1";
       }
   }
    
}
