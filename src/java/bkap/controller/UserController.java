/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Citys;
import bkap.entity.Users;
import bkap.models.CityModels;
import bkap.models.UsersModel;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author asuspc
 */
@Controller
@RequestMapping(value = "/userController")
public class UserController {
    private UsersModel userModel;
    private CityModels cityModel;
    public UserController()
    {
        userModel = new UsersModel();
        cityModel = new CityModels();
    }
    
    @RequestMapping(value = "/login")
    public ModelAndView getFormLogin()
    {
        ModelAndView mav  = new ModelAndView("admin/user/login");
        return mav;
    }
    
    @RequestMapping(value = "/register")
    public ModelAndView getFormRegister()
    {
        ModelAndView mav = new ModelAndView("admin/user/register");
        Users user= new Users();
        mav.addObject("userNew",user);
        List<Citys> listCity = cityModel.getAllCity();
        mav.addObject("listCity",listCity);
        return mav;
    }
    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public String storeUser(Users userNew)
    {
        
        boolean check = userModel.registerUser(userNew);
        if (check) {
            return "redirect:login.htm";
        }
        return "error";
    }
    
    @RequestMapping(value = "/loginUser",method = RequestMethod.POST)
    public String loginUser(HttpServletRequest request)
    {
       
        HttpSession session = request.getSession();
        List<Users> listUser = userModel.getAllUser();
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        
        for (Users user : listUser) {
            if (user.getUserEmail().equals(email)) {
                if (user.getPassword().equals(pass)) {
                    session.setAttribute("userLogin", email);
                    return "admin/user/loginConplete";
                }
            }
        }
        return "error";
    }
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpSession session)
    {
      
        ModelAndView mav = new ModelAndView("admin/user/logout");
        session.removeAttribute("userLogin");
        return mav;
    }
    @RequestMapping(value = "/forgostPassword")
    public ModelAndView getFormForgost()
    {
        ModelAndView mav = new ModelAndView("admin/user/forgost-password");
        return mav;
    }
}
