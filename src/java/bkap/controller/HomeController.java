/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Banner;
import bkap.entity.Brands;
import bkap.entity.Cart;
import bkap.entity.Categories;
import bkap.entity.Comments;
import bkap.entity.Feedback;
import bkap.entity.GiftProduct;
import bkap.entity.Images;
import bkap.entity.PaginateDto;
import bkap.entity.PolicyStore;
import bkap.entity.ProductParameter;
import bkap.entity.ProductPolicy;
import bkap.entity.Products;
import bkap.entity.Stores;
import bkap.entity.TypePolicyStore;
import bkap.models.BannerModels;
import bkap.models.BrandsModel;
import bkap.models.CategoriesModel;
import bkap.models.CommentsModel;
import bkap.models.FeedbackModels;
import bkap.models.GiftProductModel;
import bkap.models.ImagesModel;
import bkap.models.PaginateModel;
import bkap.models.PolicyStoreModels;
import bkap.models.ProductParameterModel;
import bkap.models.ProductPolicyModels;
import bkap.models.ProductsModels;
import bkap.models.StoresModels;
import bkap.models.TypePolicyStoreModels;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
@RequestMapping(value = "/antomi")
public class HomeController {
       private CategoriesModel cateModel;
       private BrandsModel brandModel;
       private ProductsModels productModel;
       private BannerModels bannerModels;
       private ImagesModel imgProModels;
       private ProductPolicyModels proPoliModels;
       private GiftProductModel giftProModels;
       private ProductParameterModel proParamModels;
       private FeedbackModels feedbackModels;
       private PolicyStoreModels poliStoreModels; 
       private TypePolicyStoreModels typePoliStoreModels;
       private CommentsModel commentsModel;
       private PaginateModel paginateModel;
       private StoresModels storeModel;
       public HomeController()
       {
           cateModel = new CategoriesModel();
           brandModel = new BrandsModel();
           productModel = new ProductsModels();
           bannerModels = new BannerModels();
           imgProModels = new ImagesModel();
           proPoliModels = new ProductPolicyModels();
           giftProModels = new GiftProductModel();
           proParamModels = new ProductParameterModel();
           feedbackModels = new FeedbackModels();
           poliStoreModels = new PolicyStoreModels();
           typePoliStoreModels = new TypePolicyStoreModels();
           commentsModel = new CommentsModel();
           paginateModel = new PaginateModel();
           storeModel = new StoresModels();
       }
    @RequestMapping(value = "/home")
    public ModelAndView getHome(HttpSession session)
    {
        ModelAndView mav = new ModelAndView("fontend/home");
        //lay ra chinh sách cua website
        menu1(mav);
        //lay 12 thuong hieu 
        List<Brands> listBrand = brandModel.getBrandByLimit(10);
        mav.addObject("listBrand",listBrand);
        
        //lay banner Trang chu top
        List<Banner> listBannerTop =  bannerModels.getBannerByType(1);
        mav.addObject("listBannerTop",listBannerTop);
        //lay banner 2-1
        Banner banner2Type1 = bannerModels.getBannerByType1(4);
        mav.addObject("banner2Type1",banner2Type1);
        //lay banner 2-2
        Banner banner2Type2 = bannerModels.getBannerByType1(5);
        mav.addObject("banner2Type2",banner2Type2);
        //lay banner 2-3
        Banner banner2Type3 = bannerModels.getBannerByType1(6);
        mav.addObject("banner2Type3",banner2Type3);
        //lay banner 3-1
        Banner banner3Type1 = bannerModels.getBannerByType1(7);
        mav.addObject("banner3Type1",banner3Type1);
          //lay banner 3-2
        Banner banner3Type2 = bannerModels.getBannerByType1(8);
        mav.addObject("banner3Type2",banner3Type2);
        //lay cac san pham laptop
      List<Products> listProComputer = productModel.getListProductById(4,10);
      mav.addObject("listProComputer",listProComputer);
      
      
      List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        getAllProductPageHome(mav);
        
        return mav;
    }
    
    //chi tiet san pham
    @RequestMapping(value = "/productDetails")
    public ModelAndView getProductById(int productId)
    {
         ModelAndView mav = new ModelAndView("fontend/proDetail");
        //lay doi tuong
         Products product = productModel.getProById(productId);
         
         //lay cac san pham tuong tu
         List<Products> listProTuongtu = productModel.getListProductById(product.getCategories().getCatId(), 10);
         mav.addObject("listProTuongtu",listProTuongtu);
        //chi tiet San Pham
        Products proDetail = productModel.getProById(productId);
        mav.addObject("proDetail",proDetail);
        //cap nhat luot xem cho san pham
        int view = proDetail.getProductView();
        proDetail.setProductView(view+1);
        productModel.updatePro(proDetail);
        //lay tat ca anh san pham theo productId
        List<Images> listImage = imgProModels.getImageByProductId(productId);
        mav.addObject("listImage",listImage);
        //Lay Chính sách Sản Phẩm
        List<ProductPolicy> listProPoli = proPoliModels.getProductPolicyByProId(productId);
        mav.addObject("listProPoli",listProPoli);
        //lay danh sach qua tang kem theo khi mua san pham
        List<GiftProduct> listGiftPro = giftProModels.getGiftProductByProId(productId);
        mav.addObject("listGiftPro",listGiftPro);
        //lay thông số kỹ thuật của sản phẩm
        List<ProductParameter> listProParam = proParamModels.getParamProByProductId(productId);
        mav.addObject("listProParam",listProParam);
        //tao doi tg de them comment
        Comments cm = new Comments();
        mav.addObject("commentNew",cm);
        //lay danh sach comment theo product
        List<Comments> listComment = commentsModel.getListCommentByProId(productId);
        Map<Integer,List<Comments>> mapCM = new HashMap<>();
        for (Comments listCM : listComment) {
            List<Comments> listcm = new ArrayList<>();
            listcm = commentsModel.getListCommentByParentId(listCM.getCommentId());
            mapCM.put(listCM.getCommentId(), listcm);
        }
        mav.getModel().put("listComment",listComment);
        mav.getModel().put("mapCM", mapCM);
        //lay tat ca thuong hieu va chinh sach menu danh muc
        menu1(mav);       
        return mav;
         
    }
    //lay san pham them parentId
    @RequestMapping(value = "/productCateParent11")
    public ModelAndView getAllProCatePrentId11(int cateId)
    {
        ModelAndView mav = new ModelAndView("fontend/proCateParentId");
        menu1(mav);
        getProByCatePrenId(mav,cateId);
        return mav;
    }
    
    //lay san pham theo hang
    @RequestMapping(value = "/productBrand")
    public ModelAndView getAllProductByBrand(int brandId,int page)
    {
        int totalPage = 16;
        ModelAndView mav = new ModelAndView("fontend/proBrands");
        //lay tat ca san pham the hang
        List<Products> listProByBrand = productModel.getListProByBrand(brandId);
        int totalData =  productModel.getListProByBrand(brandId).size();
        if (totalData<1) {
            ModelAndView mav1 = new ModelAndView("error");
            return mav1;
        }
        PaginateDto paginateInfo = paginateModel.GetInfoPaginates(totalData, totalPage, page);
        List<Products> listProPagi = productModel.getListProByBrandPaginate(brandId, paginateInfo.getStart(), totalPage);
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listProByBrand",listProPagi);
        mav.addObject("brandId",brandId);
        List<Products> listProView = productModel.getListProByViewDESC(6);
        mav.addObject("listProView",listProView);
        menu1(mav);
         
        return  mav;
    }
    
    //lay form lien he
    @RequestMapping(value = "/lien-he")
    public ModelAndView getFormLienHe()
    {
        ModelAndView mav = new ModelAndView("fontend/lienHe");
        Feedback fBNew = new Feedback();
        mav.addObject("fBNew",fBNew);
        
        menu1(mav);
        return mav;
    }
    //luu lien he
    @RequestMapping(value = "/lienHeSave",method = RequestMethod.POST)
    public String storeFeeddback(Feedback feedbackNew) throws ParseException
    {
        
        boolean check = feedbackModels.insertFeedback(feedbackNew);
        if (check) {
            return "redirect:home.htm";
        }
        else{
            return "redirect:home.htm";
        }
    }
    //view chinh sách san phẩm
    @RequestMapping(value = "/chinh-sach")
    public ModelAndView getChinhSachWeb(int policyStoreId)
    {
        ModelAndView mav = new ModelAndView("fontend/chinhSach");
        PolicyStore poliStore = poliStoreModels.getPolicyStoreById(policyStoreId);
        mav.addObject("poliStore",poliStore);
         menu1(mav);
        return mav;
    }
    @RequestMapping(value = "/productCategories")
    public ModelAndView getListProByBrand(int cateId,int page)
    {
        int totalPage = 10;
        
        ModelAndView mav = new ModelAndView("fontend/proCategories");
        //lay doi yuong
        Categories category = cateModel.getCateById(cateId);
        //lay cac san pham theo the loai
        int totalData = productModel.getListProByCate(cateId).size();
        if (totalData<1) {
            ModelAndView mav1 = new ModelAndView("error");
            return mav1;
        }
        PaginateDto paginateInfo = paginateModel.GetInfoPaginates(totalData, totalPage, page);
//        List<Products> lisPro = productModel.getListProByCate(cateId);
        List<Products> lisPro = productModel.getListProByCatePaginate(cateId, paginateInfo.getStart(), totalPage);
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("lisPro",lisPro);
        //lay danh muc lien quan
        List<Categories> listCateDM = cateModel.getCateByParentId(category.getParentId());
        mav.addObject("cateDM",listCateDM);
        menu1(mav);
         List<Products> listProView = productModel.getListProByViewDESC(6);
        mav.addObject("listProView",listProView);
        mav.addObject("cateId",cateId);
        return mav;
    }
    //cua hang
    
    @RequestMapping(value = "/cua-hang")
    public ModelAndView getStoreList()
    {
        ModelAndView mav = new ModelAndView("fontend/storeList");
        List<Stores> listStore = storeModel.getAllStoreTrue();
        mav.addObject("listStore",listStore);
        menu1(mav);
        return mav;
    }
    
    @RequestMapping(value = "/productCateParent")
    public ModelAndView getListProByParen(int parentId)
    {
        ModelAndView mav = new ModelAndView("fontend/proCategories");
          List<Products> lisPro = productModel.getListProductByParenId(parentId);
        mav.addObject("lisPro",lisPro);
       
        menu1(mav);
        return mav;
    }
    
    @RequestMapping(value = "/insertComment",method = RequestMethod.POST)
    public String storeComment(Comments commentNew) throws ParseException
    {
        int proId = commentNew.getProducts().getProductId();
        commentNew.setParenId(0);
        commentNew.setCommentStatus(true);
        boolean check = commentsModel.insertComment(commentNew);
        if (check) {
            return "redirect:productDetails.htm?productId="+proId;
        }
        else
        {
            return "error";
        }
    }
    
    @RequestMapping(value = "/searchProductHome",method = RequestMethod.POST)
    public ModelAndView searchPro(String nameSearch)
    {
        ModelAndView mav = new ModelAndView("fontend/productSearch");
        List<Products> listPro = productModel.getProBySearchName(nameSearch);
        mav.addObject("listPro",listPro);
        List<Products> listProView = productModel.getListProByViewDESC(6);
        mav.addObject("listProView",listProView);
        menu1(mav);
        return mav;
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
    
    public void getAllProductPageHome(ModelAndView mav)
    {
        //laptop học tập văn phòng
        List<Products> listProHTVanPhong = productModel.getListProductById(28,10);
        mav.addObject("proHTVanPhong",listProHTVanPhong);
        //laptop Đồ họa Kỹ Thuật
        List<Products> listProDHKyThuat = productModel.getListProductById(29,10);
        mav.addObject("proDHKyThuat",listProDHKyThuat);
        //laptop Mỏng Nhẹ
         List<Products> listProMongNhe = productModel.getListProductById(30,10);
        mav.addObject("proLTMongNhe",listProMongNhe);
        //laptop Cao cấp Sang Trọng
        List<Products> listCCSangTrong = productModel.getListProductById(31,10);
        mav.addObject("proLTCCSangTrong",listCCSangTrong);
        
        //PC Gaming Trung cấp
        List<Products> listPCGMTrungCap = productModel.getListProductById(33,10);
        mav.addObject("listPCGMTrungCap",listPCGMTrungCap);
        //PC Gaming Cao Cấp
        List<Products> listPCGMCaoCap = productModel.getListProductById(34,10);
        mav.addObject("listPCGMCaoCap",listPCGMCaoCap);
         //PC Gaming Siêu Cao Cấp
        List<Products> listPCGMSieuCaoCap = productModel.getListProductById(35,10);
        mav.addObject("listPCGMSieuCaoCap",listPCGMSieuCaoCap);
        
        //PC Đồ Họa, Render, Máy Chủ
        //PC thiết kế đồ họa
         List<Products> listTKDoHoa = productModel.getListProductById(40,10);
        mav.addObject("listTKDoHoa",listTKDoHoa);
         //PC Render Video
         List<Products> listPCRenderVideo = productModel.getListProductById(41,10);
        mav.addObject("listPCRenderVideo",listPCRenderVideo);
        
        //màn hình máy tính
        //mh garming
        List<Products> listMHGarming = productModel.getListProductById(45,4);
        mav.addObject("listMHGarming",listMHGarming);
        //mh thiết kế đồ họa
         List<Products> listMHTKDH = productModel.getListProductById(46,4);
        mav.addObject("listMHTKDH",listMHTKDH);
        //mh phổ thông văn phòng
         List<Products> listMHPTVanPhong = productModel.getListProductById(47,4);
        mav.addObject("listMHPTVanPhong",listMHPTVanPhong);
        
        //phu kiện máy tính
        //bàn phím
         List<Products> listPKBanPhim = productModel.getListProductById(50,4);
        mav.addObject("listPKBanPhim",listPKBanPhim);
        //chuot
        List<Products> listPKChuot = productModel.getListProductById(51,4);
        mav.addObject("listPKChuot",listPKChuot);
        
        //Thiết bbij Văn Phòng
        //máy Chiếu
        List<Products> listTBVPMayChieu = productModel.getListProductById(43,4);
        mav.addObject("listTBVPMayChieu",listTBVPMayChieu);
        
        
    }
    
    //lay tat ca cac san pham theo prandid
    public void getProByCatePrenId(ModelAndView mav,int cateId)
    {
        List<Categories> listCate = cateModel.getCateByParentId(cateId);
        
     
        List<Products> listPro = new ArrayList<>();
        for (Categories cate: listCate) {            
            List<Products> list = productModel.getListProductById(cate.getCatId(),100);
            listPro.addAll(list);
        }
        List<Products> listProView = productModel.getListProByViewDESC(6);
        mav.addObject("listProView",listProView);
        
        mav.addObject("listPro", listPro);
        mav.addObject("listCateDM",listCate);
    }
  
    
}
