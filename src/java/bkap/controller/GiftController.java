/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Gift;
import bkap.entity.PaginateDto;
import bkap.models.GiftModel;
import bkap.models.PaginateModel;
import java.text.ParseException;
import java.util.List;
import static java.util.Optional.empty;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author asuspc
 */
@Controller
@RequestMapping(value = "/giftController")
public class GiftController {
    private GiftModel giftModel;
    private PaginateModel pagiModel;
    private int totalGiftPage = 8;
    
    public GiftController()
    {
        giftModel = new GiftModel();
        pagiModel = new PaginateModel();
    }
    
    
    @RequestMapping(value = "/getAll")
    public ModelAndView getAllGift(int page)
    {
        ModelAndView mav = new ModelAndView("admin/gift/listGift");
        List<Gift> listGift = giftModel.getAllGift();
        int totalData = giftModel.getAllGift().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalGiftPage, page);
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listGift",giftModel.getGiftPaginate(paginateInfo.getStart(), totalGiftPage));
//        mav.addObject("listGift",giftModel.getGiftPaginate(paginateInfo.getStart(), paginateInfo.getEnd()));
        //mav.addObject("listGift",listGift);
        Gift gift = new Gift();
        mav.addObject("giftNew",gift);
        return mav;
    }
    
    @RequestMapping(value = "/getAll1",method = RequestMethod.GET)
    public ModelAndView getAllGift1(int page)
    {
       
        ModelAndView mav = new ModelAndView("admin/gift/listGift");
        List<Gift> listGift = giftModel.getAllGift();
        int totalData = giftModel.getAllGift().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalGiftPage, page);
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listGift",giftModel.getGiftPaginate(paginateInfo.getStart(), totalGiftPage));
        //mav.addObject("listGift",listGift);
        Gift gift = new Gift();
        mav.addObject("giftNew",gift);
        return mav;
    }
    @RequestMapping(value = "/searchGift",method = RequestMethod.POST)
    public ModelAndView getGiftSearch(HttpServletRequest request,String message ,int page)
    {      
         ModelAndView mav = new ModelAndView("admin/gift/listGift");
        List<Gift> listGift = giftModel.getGiftByNameNoPaginate(message);
      int totalData = listGift.size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalGiftPage, page);
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listGift",giftModel.getGiftByName(message,paginateInfo.getStart(), totalGiftPage));
        //mav.addObject("listGift",listGift);
        Gift gift = new Gift();
        mav.addObject("giftNew",gift);
        return mav;
    }
    
    
    @RequestMapping(value = "/insertGift",method = RequestMethod.POST)
    public String storeGift(@Valid Gift giftNew) throws ParseException
    {
        boolean check = giftModel.insertGift(giftNew);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }else{
            return "redirect:getAll.htm?page=1";
        }
    }
    
    @RequestMapping(value = "/editGift")
    public ModelAndView editGift(int id)
    {
        ModelAndView mav = new ModelAndView("admin/gift/editGift");
        Gift gift = giftModel.getGiftById(id);
        mav.addObject("giftEdit",gift);
        return mav;
    }
    
    @RequestMapping(value = "/updateGift",method = RequestMethod.POST)
    public String updateGift(Gift gift)
    {
        boolean check= giftModel.updateGift(gift);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }else
        {
            return "redirect:index.htm";
        }
    }
    
    @RequestMapping(value = "/deleteGift")
    public String deleteGift(int id)
    {
        boolean check = giftModel.deleteGift(id);
          if (check) {
            return "redirect:getAll.htm?page=1";
        }else
        {
            return "redirect:getAll.htm?page=1";
        }
    }
}
