/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.PaginateDto;
import bkap.entity.Parameter;
import bkap.models.PaginateModel;
import bkap.models.ParameterModels;
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
@RequestMapping(value = "/parameterController")
public class ParameterController {
    private ParameterModels paramModel;
    private PaginateModel pagiModel;
    private int totalParamPage= 10;
    public ParameterController()
    {
        paramModel = new ParameterModels();
        pagiModel = new PaginateModel();
    }
    
    @RequestMapping(value = "/getAll")
    public ModelAndView getAllParam(int page)
    {
        ModelAndView mav = new ModelAndView("admin/parameter/listParameter");
        List<Parameter> listParam = paramModel.getAllParam();
        int totalData = paramModel.getAllParam().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalParamPage, page);
        List<Parameter> listParmPagi = paramModel.getParamPaginate(paginateInfo.getStart(), totalParamPage);
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listParam",listParmPagi);
        Parameter param = new Parameter();
        mav.addObject("paramNew",param);
        return mav;
    }
    
    @RequestMapping(value = "/insertParam",method = RequestMethod.POST)
    public String storeParam(Parameter param)
    {
        boolean check = paramModel.insertParam(param);
        if(check)
        {
            return "redirect:getAll.htm?page=1";
        }
        else{
            return "redirect:getAll.htm?page=1";
        }
    }
    
    @RequestMapping(value = "/editParameter")
    public ModelAndView editParmaeter(int id)
    {
        ModelAndView mav = new ModelAndView("admin/parameter/editParameter");
        Parameter pram = paramModel.getParamById(id);
        mav.addObject("paramEdit",pram);
        return mav;
    }
    
    @RequestMapping(value = "/updateParameter",method = RequestMethod.POST)
    public String updateParam(Parameter param)
    {
        boolean check = paramModel.updateParam(param);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }else
        {
            return "redirect:getAll.htm?page=1";
        }
    }
    
    @RequestMapping(value = "/deleteParameter")
    public String deleteParam(int id)
    {
        boolean check = paramModel.deletePram(id);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        else
        {
            return "redirect:getAll.htm?page=1";
        }
    }
}
