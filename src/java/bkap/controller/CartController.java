/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Brands;
import bkap.entity.Cart;
import bkap.entity.Categories;
import bkap.entity.Citys;
import bkap.entity.OrderDetail;

import bkap.entity.Orders;
import bkap.entity.PolicyStore;
import bkap.entity.Products;
import bkap.entity.TypePolicyStore;
import bkap.models.BrandsModel;
import bkap.models.CategoriesModel;
import bkap.models.CityModels;
import bkap.models.OrdersModel;
import bkap.models.PolicyStoreModels;
import bkap.models.ProductsModels;
import bkap.models.TypePolicyStoreModels;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author asuspc
 */
@Controller
@RequestMapping(value = "/cartController")
public class CartController {
    private ProductsModels proModel;
    private CityModels cityModel;
    private OrdersModel orderModel;
    
    private CategoriesModel cateModel;
    private TypePolicyStoreModels typePoliStoreModels;
    private PolicyStoreModels poliStoreModels; 
    private BrandsModel brandModel;
    public CartController()
    {
        proModel = new ProductsModels();
        cityModel = new CityModels();
        orderModel = new OrdersModel();
        cateModel = new CategoriesModel();
        typePoliStoreModels = new TypePolicyStoreModels();
        poliStoreModels = new PolicyStoreModels();
        brandModel = new BrandsModel();  
    }
    
    @RequestMapping(value = "/addCart")
    public ModelAndView addCart(HttpSession session,HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView("fontend/ShoppingCart");
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        
        int productId = Integer.parseInt(request.getParameter("productId"));
        Products pro = proModel.getProById(productId);
        
        if (listCart==null) {
            //khi nguoi dung chua mua hang
            listCart = new ArrayList<>();
            Cart cart = new Cart(pro,1);
            listCart.add(cart);
        }else
        {
            //neu nguoi dung da mua hang thi kiem tra xem da cos sp chua
            boolean checkExit = false;
            for (Cart cart : listCart) {
                if (cart.getProduct().getProductId()==productId) {
                    checkExit = true;
                    break;
                } else {
                }
            }
            if (checkExit) {
                for (int i = 0; i < listCart.size(); i++) {
                    if (listCart.get(i).getProduct().getProductId()==productId) {
                        listCart.get(i).setQuantity(listCart.get(i).getQuantity()+1);
                        break;
                    } 
                }
            }else
            {
                Cart cart = new Cart(pro, 1);
                listCart.add(cart);
            }
        }
        session.setAttribute("listCart", listCart);
        session.setAttribute("tongTien", sumAmount(listCart));
        menu1(mav);
        return mav;
    }
     
    public float sumAmount(List<Cart> listCart)
    {
       float price = 0;
        float sum = 0;
        float phantram=0;
        for(Cart cart:listCart)
        {
            phantram = (cart.getProduct().getPrice()*cart.getProduct().getDiscount())/100;
            price = cart.getProduct().getPrice()-phantram;
            sum +=cart.getQuantity()*price;
        }
        return sum;
    }
    
    @RequestMapping(value = "/listCart")
    public ModelAndView listCart(HttpSession session)
    {
        ModelAndView mav = new ModelAndView("fontend/ShoppingCart");
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        menu1(mav);
        return mav;
    }
    
    @RequestMapping(value = "/deleteCart")
    public ModelAndView DeleteCart(HttpSession session,HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView("fontend/ShoppingCart");
         //lay ma sp can xoa khoi hoa don
        String productId = request.getParameter("productId");
        //lay listcart tu session
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        //xoa productId ra khoi listcart
        for (int i = 0; i < listCart.size(); i++) {
            if (listCart.get(i).getProduct().getProductId()== Integer.parseInt(productId)) {
                listCart.remove(i).getProduct().getProductId();
                break;
            }
        }
         session.setAttribute("listCart", listCart);
        //tinh tong tien cua hoa don va add vao session
        session.setAttribute("tongTien", sumAmount(listCart));
        return mav;
    }
    @RequestMapping(value = "/updateQuantity",method = RequestMethod.POST)
    public String updateQuantity(HttpSession session,HttpServletRequest request)
    {
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        String[] arrQuantity = request.getParameterValues("quantity");
        for (int i = 0; i < listCart.size(); i++) {
            listCart.get(i).setQuantity(Integer.parseInt(arrQuantity[i]));
            
        }
        session.setAttribute("listCart", listCart);
        session.setAttribute("tongTien", sumAmount(listCart));
        return "fontend/ShoppingCart";
    }
    
    //get form checkout
    @RequestMapping(value="/thanhToan")
    public ModelAndView getCheckOut(HttpSession session)
    {
        ModelAndView mav = new ModelAndView("fontend/CheckOut");
        Orders order = new Orders();
        mav.addObject("orderNew",order);
        List<Citys> listCity = cityModel.getAllCity();
        mav.addObject("listCity",listCity);
          List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
          menu1(mav);
        return mav;
    }
    
    @RequestMapping(value = "/insertOrder",method = RequestMethod.POST)
    public ModelAndView storeOrder(HttpSession session,Orders oderNew) throws ParseException
    {
        oderNew.setOrderStatus(1);
        
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        oderNew.setTotalArmount(sumAmount(listCart));
        List<OrderDetail> listOrderDetail = new ArrayList<>();
        if (listCart!=null) {
            for (int i = 0; i < listCart.size(); i++) {
                OrderDetail odDetail = new OrderDetail();
                
                odDetail.setOrders(new Orders(oderNew.getOrderId()));
                odDetail.setProducts(new Products(listCart.get(i).getProduct().getProductId()));
                odDetail.setQuantity(listCart.get(i).getQuantity());
                odDetail.setAmount(listCart.get(i).getProduct().getPrice()-(listCart.get(i).getProduct().getPrice()*listCart.get(i).getProduct().getDiscount())/100);
                listOrderDetail.add(odDetail);
            }
        }
        Set<OrderDetail> setOD= new HashSet(listOrderDetail);
        oderNew.setOrderDetails(setOD);
        boolean check = orderModel.insertOrder(oderNew);
        if (check) {
            session.removeAttribute("listCart");
            ModelAndView mav = new ModelAndView("fontend/CompleteOrder");
            menu1(mav);
            mav.addObject("message","Mua Hàng Thành Công!");
            mav.addObject("tongTien", 0);
            return mav;
        }else
        {
             ModelAndView mav = new ModelAndView("fontend/CompleteOrder");
            menu1(mav);
             mav.addObject("message","Mua Hàng Thất Bài!");
            return mav;
        }
    }
    
     public void menu1(ModelAndView mav)
    {
         //lay menu danh muc
        List<Categories> listCate = cateModel.getCateByStatusTrue();
        Map<Integer,List<Categories>> map = new HashMap<>();
        
        for (Categories listCate1 : listCate) {
            List<Categories> list = new ArrayList<>();
            list = cateModel.getCateByParentId(listCate1.getCatId());
            map.put(listCate1.getCatId(), list);
        }
        mav.getModel().put("listCate",listCate);
        mav.getModel().put("map",map);
        //lay ra chinh sách cua website
        List<TypePolicyStore> listTypePS = typePoliStoreModels.getAllTypePolicyStore();
        mav.addObject("listTypePS",listTypePS);
        List<PolicyStore> listPoliStore = poliStoreModels.getAllPlicyStore(); 
        mav.addObject("listPoliStore",listPoliStore);
         //lay tat ca thương hiệu
        List<Brands> listMenuBrands = brandModel.getAllBrands();
        mav.addObject("listMenuBrands",listMenuBrands);
        List<Categories> listCateASC = cateModel.getAllCate();
        mav.addObject("listCateASC",listCateASC);
        
        //chính sách chung, mua hang footer
        List<PolicyStore> listCSChung = poliStoreModels.getPoliStoreByType(1);
        List<PolicyStore> listCSMuaHang = poliStoreModels.getPoliStoreByType(3);
        mav.addObject("listCSChung",listCSChung);
        mav.addObject("listCSMuaHang",listCSMuaHang);
    }
}
