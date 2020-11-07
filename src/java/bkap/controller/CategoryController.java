/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Categories;
import bkap.entity.PaginateDto;
import bkap.models.CategoriesModel;
import bkap.models.PaginateModel;
import java.util.List;
import static java.util.Optional.empty;
import javax.validation.Valid;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 *
 * @author asuspc
 */
@Controller
@RequestMapping(value = "/cateController")
public class CategoryController {
    private CategoriesModel cateModel;
    private PaginateModel pagiModel;
    private int totalCatePage = 10;
    public CategoryController()
    {
        cateModel = new CategoriesModel();
        pagiModel = new PaginateModel();
    }
    
    @RequestMapping(value = "/getAll")
    public ModelAndView getallCate(int page)
    {
        ModelAndView mav = new ModelAndView("admin/cate/listCate");
        List<Categories> listCate = cateModel.getAllCate();
        mav.addObject("listParenName",listCate);
         //paginate
        int totalData = cateModel.getAllCate().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalCatePage, page);
        List<Categories> listCate1 = cateModel.getCatePaginate(paginateInfo.getStart(), totalCatePage);
       
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listCate",listCate1);
        Categories cate = new Categories();
        mav.addObject("cateNew",cate);
        List<Categories> listAn = cateModel.getCateByStatusFalse();
        List<Categories> listHien = cateModel.getCateByStatusTrue();
        mav.addObject("listAn",listAn);
        mav.addObject("listHien",listHien);
        List<Categories> tong = cateModel.getAllCate();
        mav.addObject("tong",tong);          
        return mav;
    }
    @RequestMapping(value = "/getAll1")
    public String listCate(Model model,Integer offset,Integer maxResult )
    {
        List<Categories> list = cateModel.getCategories(offset, maxResult);
        model.addAttribute("listCate",list);
        model.addAttribute("offset",offset);
        model.addAttribute("count",cateModel.getTotalCategories());
        return "jsp/admin/cate/listCate";
    }
    //Lấy danh muc o trạng thái ẩn
    @RequestMapping(value = "/statusAn")
    public ModelAndView getAllStatusFsCate()
    {
        ModelAndView mav = new ModelAndView("admin/cate/listCate");
        List<Categories> listCate = cateModel.getCateByStatusFalse();
        mav.addObject("listCate",listCate);
        Categories cate = new Categories();
        mav.addObject("cateNew",cate);
        List<Categories> listAn = cateModel.getCateByStatusFalse();
        List<Categories> listHien = cateModel.getCateByStatusTrue();
        mav.addObject("listAn",listAn);
        mav.addObject("listHien",listHien);
        List<Categories> tong = cateModel.getAllCate();
        mav.addObject("tong",tong);
        return mav;
    }
    
    //lấy danh mục ở trạng thái hiện
    @RequestMapping(value = "/statusHien")
    public ModelAndView getAllStatusTsCate()
    {
        ModelAndView mav = new ModelAndView("admin/cate/listCate");
        List<Categories> listCate = cateModel.getCateByStatusTrue();
        mav.addObject("listCate",listCate);
        Categories cate = new Categories();
        mav.addObject("cateNew",cate);
        List<Categories> listAn = cateModel.getCateByStatusFalse();
        List<Categories> listHien = cateModel.getCateByStatusTrue();
        mav.addObject("listAn",listAn);
        mav.addObject("listHien",listHien);
        List<Categories> tong = cateModel.getAllCate();
        mav.addObject("tong",tong);
        return mav;
    }
    
    @RequestMapping(value = "/getAll",method = RequestMethod.POST)
    public String storeCate(@Valid @ModelAttribute("cateNew")Categories cateNew,BindingResult result)
    {
        if (result.hasErrors()) {
            return "admin/cate/listCate";
        }
        boolean check = cateModel.insertCate(cateNew);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
        return "redirect:getAll.htm?page=1";
    }
    
    @RequestMapping(value = "/editCate")
    public ModelAndView editCate(int id)
    {
        ModelAndView mav = new ModelAndView("admin/cate/editCate");
        Categories cate = cateModel.getCateById(id);
        mav.addObject("cateUpdate",cate);
        return mav;
    }
     @RequestMapping(value = "/updateCate",method = RequestMethod.POST)
    public String updateCate(Categories cate)
    {
        boolean check = cateModel.updateCate(cate);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
         return "redirect:getAll.htm?page=1";
    }
    
    @RequestMapping(value = "/deleteCate")
    public String delete(int id)
    {
        boolean check = cateModel.deleteCate(id);
        if (check) {
             return "redirect:getAll.htm?page=1";
        }
         return "redirect:getAll.htm?page=1";
    }
    
    public String statusCate(int status)
    {
        switch(status)
        {
            case 1:
                return "Hiện";
                default:
                    return "Ẩn";
        }
    }
   
    
}
