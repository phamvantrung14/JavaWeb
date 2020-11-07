/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Feedback;
import bkap.models.FeedbackModels;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author asuspc
 */
@Controller
@RequestMapping(value = "/feedback")
public class FeedBackController {
    private FeedbackModels fbModels;
    public FeedBackController()
    {
        fbModels = new FeedbackModels();
    }
    @RequestMapping(value = "/getAll")
    public ModelAndView getAllFB()
    {
        ModelAndView mav = new ModelAndView("admin/feedback/listFB");
        List<Feedback> listFB = fbModels.getAllFeedback();
        mav.addObject("listFB",listFB);
        return mav;
    }
    
    @RequestMapping(value = "/detailFB")
    public ModelAndView detailFb(int id)
    {
        ModelAndView mav = new ModelAndView("admin/feedback/feedbackDetail");
        Feedback feedBack = fbModels.getFBById(id);
        mav.addObject("feedBack",feedBack);
        return mav;
    }
}
