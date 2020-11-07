<%-- 
    Document   : proCategories
    Created on : Sep 23, 2020, 2:25:19 PM
    Author     : asuspc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../fontend/layoutFontend/header.jsp"/>  

<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <ul>
                        <li><a href="index.html">Trang Chủ</a></li>
                        <li>Sản Phẩm</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="shop_area shop_reverse">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-12">
                <!--sidebar widget start-->
                <aside class="sidebar_widget">
                    <div class="widget_list widget_categories">
                        <h3>Danh Mục Sản Phẩm</h3>
                        <ul>
                            <c:forEach items="${listCateDM}" var="cateDM">
                                <li><a href="productCategories.htm?cateId=${cateDM.catId}">${cateDM.catName}</a></li>
                                </c:forEach>         
                        </ul>
                    </div>

                    <div class="widget_list">
                        <h3>Sản Phẩm Xem Nhiều Nhất</h3>
                        <div class="recent_product_container">
                            <c:forEach items="${listProView}" var="pro">
                                
                           
                            <article class="recent_product_list">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="productDetails.htm?productId=${pro.productId}"><img src="${pro.productImage}" alt=""></a>
                                        
                                    </div>
                                    <div class="product_content">
                                        <h4><a href="productDetails.htm?productId=${pro.productId}">${pro.productName}-${pro.categories.parentId}</a></h4>
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                            </ul>
                                        </div>
                                         <c:if test="${pro.discount >0}">
                                                <div class="price_box">
                                                    <span class="old_price"><fmt:formatNumber>${pro.price}</fmt:formatNumber> VND</span><br>
                                                    <span class="current_price"><fmt:formatNumber>${pro.price*((100-pro.discount)/100)}</fmt:formatNumber> VND</span>
                                                    </div>
                                            </c:if>
                                            <c:if test="${pro.discount ==0}">
                                                <div class="price_box" style="padding-top: 20px">
                                                    <span class="old_price"></span>
                                                    <span class="current_price" ><fmt:formatNumber>${pro.price}</fmt:formatNumber> VND</span>
                                                    </div>
                                            </c:if>
                                    </div>
                                </figure>
                            </article>
                            </c:forEach>
                        </div>
                    </div>
                  
                </aside>
                <!--sidebar widget end-->
            </div>
            <div class="col-lg-9 col-md-12">

                <!--shop banner area start-->
                <div class="shop_banner_area mb-30">
                    <div class="row">
                        <div class="col-12">
                            <div class="shop_banner_thumb">
                                <img src="/Poject_Shop_Computer_004/frontend/assets/img/bg/banner16.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <!--shop banner area end-->
                <!--shop toolbar start-->
                <div class="shop_toolbar_wrapper">
                    <div class="shop_toolbar_btn">
                        <button data-role="grid_4" type="button" class="btn-grid-4 active" data-toggle="tooltip" title="4"></button>
                        <button data-role="grid_list" type="button" class="btn-list" data-toggle="tooltip" title="List"></button>
                    </div>
                    <div class=" niceselect_option" style="width: 250px;">
                        <form class="select_option" style="width: 250px;" action="#" >
                            <select name="orderby" id="short">
                                <option selected="" value="1">-- Chọn --</option>
                                <option value="2">Giá Tăng Dần</option>
                                <option value="3">Giá Giảm Dần</option>
                                <option value="4">Số Lượt Xem Nhiều Nhất</option>                               
                            </select>
                        </form>

                    </div>

                    <div class="page_amount">
                        <p>Tổng: ${listPro.size()} sản phẩm</p>
                    </div>
                </div>
                <!--shop toolbar end-->

                <!--shop wrapper start-->
                <div class="row no-gutters shop_wrapper grid_4">
                    <c:forEach items="${listPro}" var="product">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <article class="single_product" style="height: 420px">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="productDetails.htm?productId=${product.productId}"><img src="${product.productImage}" alt=""></a>
                                        <c:if test="${product.discount >0}">
                                            <div class="label_product">
                                                <span class="label_sale">Sale</span>
                                            </div>
                                        </c:if>


                                    </div>

                                    <div class="product_content grid_content">
                                        <div class="product_content_inner">
                                            <h4 class="product_name"><a href="productDetails.htm?productId=${product.productId}">${product.productName}-${product.categories.parentId}</a></h4>
                                            <div class="product_rating">
                                                <ul>
                                                    <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                    <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                    <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                    <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                    <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                </ul>
                                            </div>

                                            <c:if test="${product.discount >0}">
                                                <div class="price_box">
                                                    <span class="old_price"><fmt:formatNumber>${product.price}</fmt:formatNumber> VND</span><br>
                                                    <span class="current_price"><fmt:formatNumber>${product.price*((100-product.discount)/100)}</fmt:formatNumber> VND</span>
                                                    </div>
                                            </c:if>
                                            <c:if test="${product.discount ==0}">
                                                <div class="price_box" style="padding-top: 20px">
                                                    <span class="old_price"></span>
                                                    <span class="current_price" ><fmt:formatNumber>${product.price}</fmt:formatNumber> VND</span>
                                                    </div>
                                            </c:if>

                                        </div>
                                            <c:if test="${product.productStatus==true}">
                                                 <div class="add_to_cart">
                                                    <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${product.productId}" title="" data-original-title="Add to cart">Thêm Vào Giỏ Hàng</a>
                                                </div>
                                            </c:if>
                                       
                                    </div>
                                    <div class="product_content list_content">
                                        <h4 class="product_name"><a href="productDetails.htm?productId=${product.productId}">${product.productName}-${product.productCode}</a></h4>
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="price_box">
                                            <span class="old_price"><fmt:formatNumber>${product.price}</fmt:formatNumber> VND</span>
                                            <span class="current_price"><fmt:formatNumber>${product.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                            </div>
                                             <c:if test="${product.productStatus==true}">
                                                <div class="add_to_cart">
                                                    <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${product.productId}" title="" data-original-title="Add to cart">Thêm Vào Giỏ Hàng</a>
                                                 </div>
                                            </c:if>

                                            

                                    </div>
                                </figure>
                            </article>
                        </div> 
                    </c:forEach>


                </div>

                <div class="shop_toolbar t_bottom">
                    <div class="pagination">
                        <ul>
                            <li class="current">1</li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li class="next"><a href="#">next</a></li>
                            <li><a href="#">&gt;&gt;</a></li>
                        </ul>
                    </div>
                </div>
                <!--shop toolbar end-->
                <!--shop wrapper end-->
            </div>
        </div>
    </div>
</div>


<jsp:include page="../fontend/layoutFontend/footer.jsp"/>