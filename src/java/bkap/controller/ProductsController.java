/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.controller;

import bkap.entity.Brands;
import bkap.entity.Categories;
import bkap.entity.Comments;
import bkap.entity.Gift;
import bkap.entity.GiftProduct;
import bkap.entity.Images;
import bkap.entity.PaginateDto;
import bkap.entity.Parameter;
import bkap.entity.Policy;
import bkap.entity.ProductParameter;
import bkap.entity.ProductParameterId;
import bkap.entity.ProductPolicy;
import bkap.entity.Products;
import bkap.models.BrandsModel;
import bkap.models.CategoriesModel;
import bkap.models.CommentsModel;
import bkap.models.GiftModel;
import bkap.models.GiftProductModel;
import bkap.models.ImagesModel;
import bkap.models.PaginateModel;
import bkap.models.ParameterModels;
import bkap.models.PolicysModel;
import bkap.models.ProductParameterModel;
import bkap.models.ProductPolicyModels;
import bkap.models.ProductsModels;
import bkap.util.MyUploadFile;
import java.io.IOException;
import java.util.List;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author asuspc
 */
@Controller
@RequestMapping(value = "/proController")
public class ProductsController {

    private ProductsModels proModel;
    private CategoriesModel cateModel;
    private GiftModel giftModel;
    private BrandsModel brandModel;
    private PolicysModel policyModel;
    private ParameterModels pramModel;
    private ImagesModel imgModel;
    private ProductParameterModel proPramModel;
    private GiftProductModel giftProModel;
    private ProductPolicyModels proPoliModel;
    private CommentsModel commentModel;
    
    private PaginateModel paginateModel;
    private int totalPage = 10;

    public ProductsController() {
        proModel = new ProductsModels();
        cateModel = new CategoriesModel();
        brandModel = new BrandsModel();
        giftModel = new GiftModel();
        policyModel = new PolicysModel();
        pramModel = new ParameterModels();
        imgModel = new ImagesModel();
        proPramModel = new ProductParameterModel();
        giftProModel = new GiftProductModel();
        proPoliModel = new ProductPolicyModels();
        commentModel = new CommentsModel();
        paginateModel = new PaginateModel();
    }

    @RequestMapping(value = "/getAll")
    public ModelAndView getAllProduct(int page) {
        ModelAndView mav = new ModelAndView("admin/products/listPro");
//        List<Products> listPro = proModel.getAllPro();
        List<Categories> listCate = cateModel.getAllCate();
        
        int totalData = proModel.getAllPro().size();
        PaginateDto paginateInfo = paginateModel.GetInfoPaginates(totalData, totalPage, page);
        mav.addObject("paginateInfo",paginateInfo);
        mav.addObject("listCate",listCate);
        mav.addObject("listPro", proModel.getProductPaginate(paginateInfo.getStart(),totalPage));
        List<Categories> lisCateParen = cateModel.getAllCate();
        mav.addObject("lisCateParen",lisCateParen);
        return mav;
    }

    @RequestMapping(value = "/insertPro")
    public ModelAndView insertPro() {
        ModelAndView mav = new ModelAndView("admin/products/addPro");
        Products pro = new Products();
        mav.addObject("proNew", pro);
        //lay danh muc
        List<Categories> listCate = cateModel.getAllCate();
        mav.addObject("listCate", listCate);
        List<Categories> listParent = cateModel.getAllCate();
        mav.addObject("listParent",listParent);
        //lay thuong hieu
        List<Brands> listBrand = brandModel.getAllBrands();
        mav.addObject("listBrand", listBrand);
        //lay qua tang
        List<Gift> listGift = giftModel.getAllGift();
        mav.addObject("listGift", listGift);
        //lay chinh sach
        List<Policy> listPolicy = policyModel.getAllPolicys();
        mav.addObject("listPoli", listPolicy);
        //lay thong so
        List<Parameter> listPara = pramModel.getAllParam();
        mav.addObject("listPara", listPara);
        return mav;
    }

    @RequestMapping(value = "insertProduct", method = RequestMethod.POST)
    public String storeProducts(Products proNew, HttpServletRequest request,
            @RequestParam(value = "imageAvatar") MultipartFile imageAvatar,
            @RequestParam(value = "listImages") MultipartFile[] listImages, String[] paramId, String[] proDetailValue, String[] giftIds, String[] poliIds) throws IOException {
        String filepro = "product/";
        String fileImages = "productImages/";
        proNew.setProductImage(new MyUploadFile().saveImageToFolder(request, imageAvatar, filepro));
        List<Images> listImg = new ArrayList<>();
        
        if (listImages.length<=1) {
            
        }else{
            for (MultipartFile other : listImages) {
            Images imgs = new Images();
            imgs.setProducts(new Products(proNew.getProductId(), proNew.getProductName()));
            imgs.setImageLink(new MyUploadFile().saveImageToFolder(request, other, fileImages));
            imgs.setImageStatus(true);
            listImg.add(imgs);
                }
        }
       

        List<ProductPolicy> listPP = new ArrayList<>();
        if (poliIds!=null) {
             for (int i = 0; i < poliIds.length; i++) {
            ProductPolicy proPoli = new ProductPolicy();
            proPoli.setPolicy(new Policy(Integer.parseInt(poliIds[i])));
            proPoli.setProducts(new Products(proNew.getProductId(), proNew.getProductName()));
            listPP.add(proPoli);
        }
        }
       
        Set<ProductPolicy> setProPoli = new HashSet<>(listPP);
        proNew.setProductPolicies(setProPoli);

        List<GiftProduct> listGiftPro = new ArrayList<>();
        if (giftIds!=null) {
            for (int i = 0; i < giftIds.length; i++) {
            GiftProduct gP = new GiftProduct();
            gP.setGift(new Gift(Integer.parseInt(giftIds[i])));
            gP.setProducts(new Products(proNew.getProductId(), proNew.getProductName()));
            listGiftPro.add(gP);
        }
        }
        
        Set<GiftProduct> setGP = new HashSet<>(listGiftPro);
        proNew.setGiftProducts(setGP);

        List<ProductParameter> listProPm = new ArrayList<>();
        for (int i = 0; i < paramId.length; i++) {
            ProductParameter pP = new ProductParameter();
            pP.setId(new ProductParameterId(proNew.getProductId(), Integer.parseInt(paramId[i])));
            pP.setProducts(new Products(proNew.getProductId(), proNew.getProductName()));
            pP.setParameter(new Parameter(Integer.parseInt(paramId[i])));
            pP.setProDetailValue(proDetailValue[i]);
            pP.setProDetailStatus(true);
            listProPm.add(pP);
        }

        Set<ProductParameter> setPP = new HashSet(listProPm);
        proNew.setProductParameters(setPP);

        Set<Images> setImage = new HashSet(listImg);
        proNew.setImageses(setImage);

        boolean check = proModel.insertPro(proNew);
        if (check) {
            return "redirect: getAll.htm?page=1";
        } else {
            return "error";
        }
    }
    
    //lấy form cập nhật sản phẩm
    @RequestMapping(value = "/editProduct")
    public ModelAndView editProduct(int productId)
    {
        ModelAndView mav = new ModelAndView("admin/products/editProduct");
        Products proEdit = proModel.getProById(productId);
        mav.addObject("proEdit",proEdit);
        List<Brands> listBrand = brandModel.getAllBrands();
        mav.addObject("listBrand", listBrand);
        List<Categories> listCate = cateModel.getAllCate();
        mav.addObject("listCate", listCate);
        return mav;
    }
    //cập nhật sản phẩm
    @RequestMapping(value = "/updateProduct",method = RequestMethod.POST)
    public String updateProduct(Products proUpdate, HttpServletRequest request,
            @RequestParam(value = "imageAvatar") MultipartFile imageAvatar)throws IOException
    {
        String filepro = "product/";
        Products pro = proModel.getProById(proUpdate.getProductId());
        if (imageAvatar.getSize()>0) {
             proUpdate.setProductImage(new MyUploadFile().saveImageToFolder(request, imageAvatar, filepro));
        }else
        {
            proUpdate.setProductImage(pro.getProductImage());
        }
        boolean check = proModel.updatePro(proUpdate);
        if (check) {
            return "redirect:detailPro.htm?id=" + pro.getProductId();
        }
        else {
            return "error";
        }
    }
    
    //thêm ảnh cho sản phẩm
    @RequestMapping(value = "insertImages", method = RequestMethod.POST)
    public String storeImages(Images imgNew, HttpServletRequest request,
            @RequestParam(value = "listImages") MultipartFile listImages,
            int productId, String productName) throws IOException {
        String fileImages = "productImages/";
        imgNew.setImageLink(new MyUploadFile().saveImageToFolder(request, listImages, fileImages));
        imgNew.setImageStatus(true);
        imgNew.setProducts(new Products(productId, productName));

        boolean check = imgModel.insertImage(imgNew);
        if (check) {
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;

        } else {
            return "error";
        }

    }
    
//chi tiết Sản phẩm
    @RequestMapping(value = "/detailPro")
    public ModelAndView getProductDetail(int id) {
        ModelAndView mav = new ModelAndView("admin/products/detailPro");
        Products pro = proModel.getProById(id);
        List<Images> listImgs = imgModel.getImageByProductId(id);
        Images img = new Images();
        List<ProductParameter> listProPram = proPramModel.getParamProByProductId(id);
        List<GiftProduct> listGiftPro = giftProModel.getGiftProductByProId(id);
        List<ProductPolicy> listProPolicy = proPoliModel.getProductPolicyByProId(id);
        List<Comments> listComment = commentModel.getListCommentByProId(id);
        Map<Integer,List<Comments>> map = new HashMap<>();
        for (Comments listCM : listComment) {
            List<Comments> list = new ArrayList<>();
            list = commentModel.getListCommentByParentId(listCM.getCommentId());
            map.put(listCM.getCommentId(), list);
        }
        mav.getModel().put("listComment",listComment);
        mav.getModel().put("map",map);
        
        Comments commentUp = new Comments();
        mav.addObject("listProPram", listProPram);
        mav.addObject("imgNew", img);
        mav.addObject("listImgs", listImgs);
        mav.addObject("proDetail", pro);
        mav.addObject("listGiftPro", listGiftPro);
        mav.addObject("listProPolicy", listProPolicy);
        
        mav.addObject("commentUp",commentUp);

        return mav;
    }
    //trả lời comment sản phẩm
    @RequestMapping(value = "/upComment",method = RequestMethod.POST)
    public String upCommentByPro(Comments comment) throws ParseException
    {
        int proId = comment.getProducts().getProductId();
        comment.setCommentStatus(true);
        comment.setUserName("Admin");
        boolean check = commentModel.insertComment(comment);
        if (check) {
            return "redirect:detailPro.htm?id="+proId;
        }
        else
        {
            return "error";
        }
    }
    
    //form Chỉnh sửa chính sách sản phẩm
    @RequestMapping(value = "/editProPoli")
    public ModelAndView editProPoli(int productId)
    {
        ModelAndView mav = new ModelAndView("admin/products/editProPoli");
        List<Policy> listPoli = policyModel.getAllPolicys();
        Products pro = proModel.getProById(productId);
        mav.addObject("listPoli",listPoli);
        mav.addObject("pro",pro);
        return mav;
    }
    //Cập nhật Chính Sách Sản Phẩm
    @RequestMapping(value = "/updateProPoli",method = RequestMethod.POST)
    public String updateProPoli(HttpServletRequest request,int productId,String[] policyIds)throws IOException
    {
        proPoliModel.deleteProductPolicy(productId);
        List<ProductPolicy> listProPoli = new ArrayList<>();
        for (int i = 0; i < policyIds.length; i++) {
            ProductPolicy pP = new ProductPolicy();
            pP.setPolicy(new Policy(Integer.parseInt(policyIds[i])));
            pP.setProducts(new Products(productId));
            listProPoli.add(pP);
        }
        boolean update = proPoliModel.insertProductPolicy(listProPoli);
        if (update) {
            return "redirect:detailPro.htm?id=" + productId;
        }else {
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
    }
    //form Chinhr sửa quà tặng sản phẩm
    @RequestMapping(value = "/editGiftPro")
    public ModelAndView editGiftPro(int productId)
    {
        ModelAndView mav = new ModelAndView("admin/products/editGiftPro");
        List<Gift> listGift = giftModel.getAllGift();
        Products pro = proModel.getProById(productId);
        mav.addObject("pro",pro);
        mav.addObject("listGift",listGift);
        
        return mav;
    }
    //update Quà tặng sản phẩm
    @RequestMapping(value = "/updateGiftPro",method = RequestMethod.POST)
    public String updateGiftPro(HttpServletRequest request,int productId,String[] giftIds)throws IOException
    {
        boolean delete = giftProModel.deleteGiftPro(productId);
        List<GiftProduct> listGiftProduct = new ArrayList<>();

        if (giftIds!=null) {
           for (int i = 0; i < giftIds.length; i++) {
               GiftProduct gP = new GiftProduct();
               gP.setGift(new Gift(Integer.parseInt(giftIds[i])));
               gP.setProducts(new Products(productId));
               listGiftProduct.add(gP);
           }
        }
       
        boolean update = giftProModel.insertGiftPro(listGiftProduct);
        if (update) {
            return "redirect:detailPro.htm?id=" + productId;
        }else {
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }
    }
    
    //chỉnh sửa thông số kỹ thuật
    @RequestMapping(value = "/editProPram")
    public ModelAndView editProParam(int productId) {
        ModelAndView mav = new ModelAndView("admin/products/editProParam");
        List<ProductParameter> listProParam = proPramModel.getParamProByProductId(productId);
        mav.addObject("editProParam", listProParam);
        return mav;
    }
    
    //Cập nhật thông số kỹ thuật
    @RequestMapping(value = "/updateProParam", method = RequestMethod.POST)
    public String updateProParam(HttpServletRequest request, int productId, String productName, String[] paramId, String[] proPramValue) throws IOException {
        boolean delete1 = proPramModel.deleteProParam(productId);
        List<ProductParameter> listProPm = new ArrayList<>();
        for (int i = 0; i < paramId.length; i++) {
            ProductParameter pP = new ProductParameter();
            pP.setId(new ProductParameterId(productId, Integer.parseInt(paramId[i])));
            pP.setProducts(new Products(productId, productName));
            pP.setParameter(new Parameter(Integer.parseInt(paramId[i])));
            pP.setProDetailValue(proPramValue[i]);
            pP.setProDetailStatus(true);
            listProPm.add(pP);
        }
         boolean update = proPramModel.insertProParam(listProPm);
        if (update) {
            return "redirect:detailPro.htm?id=" + productId;
        } else {
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }

    }

    //Xóa Ảnh Sản Phẩm
    @RequestMapping(value = "/deleteImg")
    public String deleteImages(int idImg, HttpServletRequest request) {
        boolean check = imgModel.deleteImages(idImg);
        if (check) {
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        } else {
            return "error";
        }
    }
    
    @RequestMapping(value = "/deleteProducts")
    public String deleteProduct(int id)
    {
        imgModel.deleteImagePro(id);
        giftProModel.deleteGiftPro(id);
        proPramModel.deleteProParam(id);
        proPoliModel.deleteProductPolicy(id);
        boolean check = proModel.deletePro(id);
        if (check) {
            return "redirect:getAll.htm?page=1";
        }
       else
        {
            return "error";
        }
    }
    
    //tim kiem san pham theo ten va the loai
    @RequestMapping(value = "/searchPro",method = RequestMethod.POST)
    public ModelAndView getSearchProductByName(HttpServletRequest request,String message,int cateId)throws IOException
    {
       ModelAndView mav = new ModelAndView("admin/products/listPro");
       List<Products> listpro = proModel.getProductByName(message,cateId);
       mav.addObject("listPro",listpro);
       List<Categories> listCate = cateModel.getAllCate();
        mav.addObject("listCate",listCate);
        List<Categories> lisCateParen = cateModel.getAllCate();
        mav.addObject("lisCateParen",lisCateParen);
       return mav;
    }
    
    @RequestMapping(value = "/searchStatusTrue")
    public ModelAndView getSearchProductByStatusTrue()
    {
       
         ModelAndView mav = new ModelAndView("admin/products/listPro");
       List<Products> listpro = proModel.getListProByStatusTrue();
       mav.addObject("listPro",listpro);
       List<Categories> listCate = cateModel.getAllCate();
        mav.addObject("listCate",listCate);
       return mav;
    }
    @RequestMapping(value = "/searchStatusFalse")
     public ModelAndView getSearchProductByStatusFalse()
    {
       
         ModelAndView mav = new ModelAndView("admin/products/listPro");
       List<Products> listpro = proModel.getListProByStatusFalse();
       mav.addObject("listPro",listpro);
       List<Categories> listCate = cateModel.getAllCate();
        mav.addObject("listCate",listCate);
       return mav;
    }
}
