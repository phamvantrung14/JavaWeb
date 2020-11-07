/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Categories;
import bkap.entity.OrderDetail;
import bkap.entity.Orders;
import bkap.entity.PaginateDto;
import bkap.models.CategoriesModel;
import bkap.models.OrderDetailModel;
import bkap.models.OrdersModel;
import bkap.models.PaginateModel;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author asuspc
 */
@Controller
@RequestMapping(value = "/orderController")
public class OrderController {
    private OrdersModel odModel;
    private OrderDetailModel oddetailModel;
    private PaginateModel pagiModel;
    private CategoriesModel cateModel;
    private int totalOrderPage = 8;
    public OrderController()
    {
        odModel = new OrdersModel();
        oddetailModel = new OrderDetailModel();
        pagiModel = new PaginateModel();
        cateModel = new CategoriesModel();
    }
    
    @RequestMapping(value = "/getAll")
    public ModelAndView getAllOrderByStatus(int page)
    {
        ModelAndView mav = new ModelAndView("admin/orders/listOrder");
        List<Orders> listOrders = odModel.getOrderByStatus();
        //paginate
        int totalData = odModel.getAllOrder().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalOrderPage, page);
        List<Orders> listOrderPage = odModel.getOrderPaginate(paginateInfo.getStart(), totalOrderPage);
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listOrders",listOrderPage);
        mav.addObject("tatca",listOrders);
        searchStatus(mav);
        return mav;
    }
    @RequestMapping(value = "/getStatus")
    public ModelAndView getOrderByStatus1(int page,int status)
    {
         ModelAndView mav = new ModelAndView("admin/orders/listOrder");
        List<Orders> listOrders = odModel.getOrderByStatus();
        //paginate
        int totalData = odModel.getAllOrder().size();
        PaginateDto paginateInfo = pagiModel.GetInfoPaginates(totalData, totalOrderPage, page);
        List<Orders> listOrderPage = odModel.getOrderByStatus(paginateInfo.getStart(), totalOrderPage,status);
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listOrders",listOrderPage);
        mav.addObject("tatca",listOrders);
        searchStatus(mav);
        return mav;
    }
    
    @RequestMapping(value = "/detailOrder")
    public ModelAndView getOrderDetailById(int id)
    {
        ModelAndView mav = new ModelAndView("admin/orders/orderdetail");
        Orders order = odModel.getOrderById(id);
        mav.addObject("order",order);
        List<OrderDetail> listOrderDetail = oddetailModel.ListOrderDetailByOrderId(id);
        List<Categories> listCate = cateModel.getAllCate();
        mav.addObject("listCate",listCate);
        mav.addObject("listOrderDetail",listOrderDetail);
        mav.addObject("trangThai",statusH(order.getOrderStatus()));
        mav.addObject("btnbtn",btnStatus(order.getOrderStatus()));

        return mav;
    }
    @RequestMapping(value = "/updateStatus",method = RequestMethod.POST)
    public ModelAndView updateStatus(HttpServletRequest request,Orders orders)
    {
//        int id = Integer.parseInt(request.getParameter("id"));
        int id = orders.getOrderId();
//        int status = Integer.parseInt(request.getParameter("status"));
        int status = orders.getOrderStatus();
        Orders orderUp = odModel.getOrderById(id);
        orderUp.setOrderStatus(status);
        boolean check = odModel.update(orderUp);
        if (check) {
            ModelAndView mav =getOrderDetailById(id);
            mav.addObject("messege","Cập Nhật Trạng Thái Thành Công");
            return mav;
        }else
        {
            return getOrderDetailById(id);
        }
    }
    
    //trang thai don hang
    public String statusH(int status)
    {
        switch(status)
        {
            case 1:
                return "Đang Chờ";
            case 2:
                return "Đã Xác Nhận";
            case 3:
                return "Đang Vận Chuyển";
            case 4:
                return "Đã Hoàn Thành";
            case 5:
                return "Đã Hủy";
                default:
                    return "Không Hợp Lệ";
        }
    }
    //mau sac cho trang thai
    public String btnStatus(int status)
    {
        
        switch(status)
        {
            case 1:
                return "btn-primary";
            case 2:
                return "btn-info";
            case 3:
                return "btn-success";
            case 4:
                return "btn-warning";
            case 5:
                return "btn-danger";
                default:
                    return "btn-primary";
        }
    }
    
    public void searchStatus(ModelAndView mav)
    {
        List<Orders> listOrderDC = odModel.getOrderByStatusCount(1);
        List<Orders> listOrderDXN = odModel.getOrderByStatusCount(2);
        List<Orders> listOrderDVC = odModel.getOrderByStatusCount(3);
        List<Orders> listOrderDHT = odModel.getOrderByStatusCount(4);
        List<Orders> listOrderBH = odModel.getOrderByStatusCount(5);
        mav.addObject("listOrderDC",listOrderDC);
        mav.addObject("listOrderDXN",listOrderDXN);
        mav.addObject("listOrderDVC",listOrderDVC);
        mav.addObject("listOrderDHT",listOrderDHT);
        mav.addObject("listOrderBH",listOrderBH);
        
    }
}
