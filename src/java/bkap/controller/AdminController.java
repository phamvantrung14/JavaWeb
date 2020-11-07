/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Users;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author asuspc
 */
@Controller
@RequestMapping(value = "/adminController")
public class AdminController {
    @RequestMapping(value = "/admin")
    public ModelAndView getAdmin(HttpServletRequest request)
    {
       HttpSession session = request.getSession();
       String email = (String) session.getAttribute("userLogin");
        if (email!=null) {
            ModelAndView mav = new ModelAndView("/admin/index");
             return mav;
        }else
        {
            ModelAndView mav = new ModelAndView("admin/user/login");
             return mav;
        }
       
      
    }
    
}
