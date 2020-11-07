






<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="en">
    <!-- Mirrored from demo.hasthemes.com/antomi-preview/antomi/index-7.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 18 Aug 2020 12:10:51 GMT -->
    <head>
        <jsp:include page="../fontend/layoutFontend/head.jsp"/> 

    </head>

    <body>
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>
        <div class="Offcanvas_menu">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="canvas_open">
                            <a href="javascript:void(0)"><i class="ion-navicon"></i></a>
                        </div>
                        <div class="Offcanvas_menu_wrapper">

                            <div class="search_container">
                                <form action="#">
                                    <div class="hover_category">
                                        <select class="select_option" name="select" id="categori1">
                                            <option selected value="1">Tất Cả Hãng</option>
                                            <c:forEach items="${listMenuBrands}" var="menuBrand">
                                                <option value="${menuBrand.brandId}">${menuBrand.brandName}</option>
                                            </c:forEach>


                                        </select>
                                    </div>
                                    <div class="search_box">
                                        <input placeholder="Search product..." type="text">
                                        <button type="submit">Tìm kiếm</button>
                                    </div>
                                </form>
                            </div>
                            <div id="menu" class="text-left ">
                                <ul class="offcanvas_main_menu">
                                    <li class="menu-item-has-children active">
                                        <a href="#">Trang Chủ</a>

                                    </li>
                                    <li class="menu-item-has-children">
                                        <a href="#">Tìm Theo Hãng</a>
                                        <ul class="sub-menu">
                                            <c:forEach items="${listMenuBrands}" var="menuBrand">
                                                <li class="menu-item-has-children">
                                                    <a href="productBrand.htm?brandId=${menuBrand.brandId}" >${menuBrand.brandName}</a>
                                                </li>
                                            </c:forEach>

                                        </ul>
                                    </li>     
                                     <li class="menu-item-has-children">
                                        <a href="cua-hang.htm">Cửa Hàng</a>
                                    </li>
                                    <li class="menu-item-has-children">
                                        <a href="lien-he.htm">Hỗ Trợ</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="Offcanvas_footer">
                                <span><a href="#"><i class="fa fa-envelope-o"></i> info@yourdomain.com</a></span>
                                <ul>
                                    <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li class="pinterest"><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                    <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                    <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Offcanvas menu area end-->

        <!--header area start-->
        <header>
            <div class="main_header header_seven">
                <div class="container">
                    <!--header top start-->
                    <div class="header_top">
                        <div class="row align-items-center">
                        </div>
                    </div>
                    <!--header top start-->

                    <!--header middel start-->
                    <div class="header_middle sticky-header">
                        <div class="row align-items-center">
                            <div class="col-lg-2 col-md-3 col-4">
                                <div class="logo">
                                    <a href="<%=request.getContextPath()%>/antomi/home.htm"><img src="/Project_Shop_Computer_005/frontend/assets/img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-12">
                                <div class="main_menu menu_position text-center">
                                    <nav>
                                        <ul>
                                            <li><a  href="<%=request.getContextPath()%>/antomi/home.htm">Trang Chủ</a>
                                            </li>
                                            <li class="mega_items"><a href="javascript:void(0)">Tìm Theo Hãng<i class="fa fa-angle-down"></i></a>
                                                <div class="mega_menu">
                                                    <div style="padding: 20px 0;display: flex;flex-wrap: wrap;align-items: center;">
                                                        <c:forEach items="${listMenuBrands}" var="menuBrand">
                                                            <a href="productBrand.htm?brandId=${menuBrand.brandId}&&page=1" style="float: left;padding: 10px 15px;text-align: center;max-width: 25%;"><img src="${menuBrand.brandImage}" width="80px" alt=""></a>
                                                            </c:forEach>
                                                    </div>
                                                </div>
                                            </li>
                                            <li><a href="javascript:void(0)">Chính Sách<i class="fa fa-angle-down"></i></a>
                                                <ul class="sub_menu pages" style="width: 850px;display: inline-block">
                                                    <c:forEach items="${listTypePS}" var="typePS">
                                                        <li style="float: left"><a href="javascript:void(0)" style="font-weight: bold;font-size: 16px;width: 270px">${typePS.typePsname}</a>
                                                            <div style="width: 25%;height: 2px;background: #ed1b24;margin: 5px 0;"></div>
                                                            <ul class="">
                                                                <c:forEach items="${listPoliStore}" var="poliStore">
                                                                    <c:if test="${poliStore.typePolicyStore.typePsid==typePS.typePsid}">
                                                                        <li><a href="chinh-sach.htm?policyStoreId=${poliStore.policyStoreId}">${poliStore.psname}</a></li>
                                                                        </c:if>
                                                                    </c:forEach>
                                                            </ul>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </li>
                                            <li >
                                        <a href="cua-hang.htm">Cửa Hàng</a>
                                    </li>
                                            <li><a href="lien-he.htm">Hỗ Trợ</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-7 col-6">
                                <div class="header_configure_area">

                                    <div class="mini_cart_wrapper">
                                        <a href="javascript:void(0)">
                                            <i class="fa fa-shopping-bag"></i>
                                            <c:if test="${listCart.size()>0}">
                                        <span class="cart_price"><fmt:formatNumber>${tongTien}</fmt:formatNumber> Đ<i class="ion-ios-arrow-down"></i></span>

                                    </c:if>
                                           
                                            <span class="cart_count">${listCart.size()}</span>

                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--header middel end-->
                    <!--mini cart-->
                    <div class="mini_cart">
                        <div class="cart_close">
                            <div class="cart_text">
                                <h3>cart</h3>
                            </div>
                            <div class="mini_cart_close">
                                <a href="javascript:void(0)"><i class="ion-android-close"></i></a>
                            </div>
                        </div>
                        <c:forEach items="${listCart}" var="cart">
                            <div class="cart_item">
                                <div class="cart_img">
                                    <a href="#"><img src="${cart.product.productImage}" alt=""></a>
                                </div>
                                <div class="cart_info">
                                    <a href="#">${cart.product.productName}</a>
                                    <p>Qty: ${cart.quantity} X <span> <fmt:formatNumber>${cart.product.price*((100-cart.product.discount)/100)}</fmt:formatNumber> đ </span></p>
                                    </div>
                                    <div class="cart_remove">
                                        <a href="<%=request.getContextPath()%>/cartController/deleteCart.htm?productId=${cart.product.productId}"><i class="ion-android-close"></i></a>
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${listCart.size()>0}">
                            <div class="mini_cart_footer">
                                <div class="cart_button">
                                    <a href="<%=request.getContextPath()%>/cartController/listCart.htm">Giỏ Hàng</a>
                                </div>                            
                            </div>
                        </c:if>

                    </div>
                    <!--mini cart end-->

                    <!--header bottom satrt-->
                    <div class="header_bottom header_bottom7">
                        <div class="row align-items-center">
                            <div class="col-lg-3 col-md-6">
                                <div class="categories_menu categories_seven">
                                    <div class="categories_title">
                                        <h2 class="categori_toggle">DANH MỤC</h2>
                                    </div>
                                    <div class="categories_menu_toggle">
                                        <ul>
                                            <c:forEach items="${listCate}" var="catalog">
                                                <c:choose>
                                                    <c:when test="${catalog.parentId ==0}">
                                                        <c:if test="${(map.get(catalog.catId)).size()==0}">
                                                            <li class="menu_item_children"><a href="productCategories.htm?cateId=${catalog.catId}&&page=1">${catalog.catName}</a></li>
                                                            </c:if>
                                                            <c:if test="${(map.get(catalog.catId)).size()>0}">
                                                            <li class="menu_item_children" ><a href="javascript:void(0)">${catalog.catName}<i class="fa fa-angle-right"></i></a>
                                                                <ul class="categories_mega_menu" >
                                                                    <c:forEach items="${map.get(catalog.catId)}" var="menu1">
                                                                        <c:if test="${menu1.parentId == catalog.catId}">
                                                                            <c:if test="${(map.get(menu1.catId)).size()==0}">
                                                                                <li class="menu_item_children"><a href="productCategories.htm?cateId=${menu1.catId}&&page=1">${menu1.catName}</a></li>
                                                                                </c:if>
                                                                                <c:if test="${(map.get(menu1.catId)).size()>0}">
                                                                                <li class="menu_item_children" style="width: 200px !important;"><a href="productCateParent11.htm?cateId=${menu1.catId}">${menu1.catName}</a>
                                                                                    <ul class="categorie_sub_menu">
                                                                                        <c:forEach items="${map.get(menu1.catId)}" var="menu2">
                                                                                            <li class="menu_item_children"><a href="productCategories.htm?cateId=${menu2.catId}&&page=1">${menu2.catName}</a></li>
                                                                                            </c:forEach>
                                                                                    </ul>
                                                                                </li>
                                                                            </c:if>
                                                                        </c:if>

                                                                    </c:forEach>
                                                                </ul>
                                                            </li>
                                                        </c:if>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>         
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class=" col-lg-6 colm_none">
                                <div class="search_container search_seven_c">
                                    <form action="searchProductHome.htm" method="post">
                                        <div class="search_box" style="border-left: 2px solid #ebebeb;">
                                            <input placeholder="Nhập tên sản phẩm cần tìm kiếm.." name="nameSearch" type="text">
                                            <button type="submit">Search</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                            <div class=" col-lg-3 col-md-6">
                                <div class="header_bigsale">
                                    <a href="#">BIG SALE BLACK FRIDAY</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--header bottom end-->
                </div>
            </div>
        </header>
        <!--header area end-->

        <!--slider area start-->
        <section class="slider_section slider_s_seven mb-60 mt-20">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 offset-lg-3">
                        <div class="slider_area slider3_carousel owl-carousel">
                            <c:forEach items="${listBannerTop}" var="bannerTop">
                                <div class="single_slider d-flex align-items-center" style="background-size: cover;" data-bgimg="${bannerTop.imageLink}">
                                    <div class="slider_content slider_c_four container pl-3">

                                        <a class="button" href="shop.html">DISCOVER NOW</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--slider area end-->

        <!--banner area start-->
        <div class="banner_area banner_style2 mb-60">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3" >
                        <figure class="single_banner" style="height:200px">
                            <div class="banner_thumb"  style="height: 100%;">
                                <a href="shop.html"><img src="${banner2Type1.imageLink}" style="height: 200px" alt=""></a>
                            </div>
                        </figure>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <figure class="single_banner" style="height:200px">
                            <div class="banner_thumb" style="height: 100%;">
                                <a href="shop.html"><img src="${banner2Type2.imageLink}" style="height: 200px;width: 100%" alt=""></a>
                            </div>
                        </figure>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <figure class="single_banner" style="height:200px">
                            <div class="banner_thumb" style="height: 100%;">
                                <a href="shop.html"><img src="${banner2Type3.imageLink}" style="height: 200px;width: 100%" alt=""></a>
                            </div>
                        </figure>
                    </div>
                </div>
            </div>
        </div>
        <!--banner area end-->


        <!--home section bg area start-->
        <div class="home_section_bg">
            <!--product area start-->
            <div class="product_area">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="product_header">
                                <div class="section_title s_title_style3">
                                    <h2>LAPTOP, MÁY TÍNH BẢNG</h2>

                                </div>
                                <div class="product_tab_btn">
                                    <ul class="nav" role="tablist">
                                        <li>
                                            <a class="active" data-toggle="tab" href="#Computer" role="tab" aria-controls="Computer" aria-selected="true">
                                                Học Tập Văn Phòng
                                            </a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#Networking" role="tab" aria-controls="Networking" aria-selected="false">
                                                Đồ Họa Kỹ Thuật
                                            </a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#Computer2" role="tab" aria-controls="Computer2" aria-selected="false">
                                                Mỏng Nhẹ
                                            </a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#Audio" role="tab" aria-controls="Audio" aria-selected="false">
                                                Cao Cấp Sang Trọng
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="Computer" role="tabpanel">
                            <div class="product_carousel product_style product_column5 owl-carousel">
                                <c:forEach items="${proHTVanPhong}" var="proCom">
                                    <c:if test="${proCom.discount>=0}">
                                        <article class="single_product" style="height: 420px">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="product-details.html"><img src="${proCom.productImage}" alt=""></a>
                                                    <!--<a class="secondary_img" href="product-details.html"><img src="/Poject_Shop_Computer_004/frontend/assets/img/product/product6.jpg" alt=""></a>-->
                                                    <c:if test="${proCom.discount >0}">
                                                        <div class="label_product">
                                                            <span class="label_sale">Sale</span>
                                                        </div>
                                                    </c:if>

                                                </div>
                                                <div class="product_content">
                                                    <div class="product_content_inner">
                                                        <h4 class="product_name"><a href="productDetails.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                        <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                    </div>
                                                    <div class="add_to_cart">
                                                        <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Add to cart">Thêm Vào Giỏ Hàng</a>
                                                    </div>

                                                </div>
                                            </figure>
                                        </article>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="Networking" role="tabpanel">
                            <div class="product_carousel product_style product_column5 owl-carousel">

                                <c:forEach items="${proDHKyThuat}" var="proCom">
                                    <c:if test="${proCom.discount>=0}">
                                        <article class="single_product" style="height: 420px">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="product-details.html"><img src="${proCom.productImage}" alt=""></a>
                                                    <!--<a class="secondary_img" href="product-details.html"><img src="/Poject_Shop_Computer_004/frontend/assets/img/product/product6.jpg" alt=""></a>-->
                                                    <c:if test="${proCom.discount >0}">
                                                        <div class="label_product">
                                                            <span class="label_sale">Sale</span>
                                                        </div>
                                                    </c:if>
                                                    <!--                                                    <div class="action_links">
                                                                                                            <ul>
                                                                                                                <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a></li>
                                                                                                                <li class="compare"><a href="#" title="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                                                                                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box" title="quick view"><i class="ion-ios-search-strong"></i></a></li>
                                                                                                            </ul>
                                                                                                        </div>-->
                                                </div>
                                                <div class="product_content">
                                                    <div class="product_content_inner">
                                                        <h4 class="product_name"><a href="productDetails.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                       <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        </div>
                                                        <div class="add_to_cart">
                                                            <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Add to cart">Thêm Vào Giỏ Hàng</a>
                                                    </div>

                                                </div>
                                            </figure>
                                        </article>
                                    </c:if>
                                </c:forEach>



                            </div>
                        </div>
                        <div class="tab-pane fade" id="Computer2" role="tabpanel">
                            <div class="product_carousel product_style product_column5 owl-carousel">
                                <c:forEach items="${proLTMongNhe}" var="proCom">
                                    <c:if test="${proCom.discount>0}">
                                        <article class="single_product" style="height: 420px">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="product-details.html"><img src="${proCom.productImage}" alt=""></a>
                                                    <!--<a class="secondary_img" href="product-details.html"><img src="/Poject_Shop_Computer_004/frontend/assets/img/product/product6.jpg" alt=""></a>-->
                                                    <c:if test="${proCom.discount >0}">
                                                        <div class="label_product">
                                                            <span class="label_sale">Sale</span>
                                                        </div>
                                                    </c:if>
                                                    <!--                                                    <div class="action_links">
                                                                                                            <ul>
                                                                                                                <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a></li>
                                                                                                                <li class="compare"><a href="#" title="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                                                                                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box" title="quick view"><i class="ion-ios-search-strong"></i></a></li>
                                                                                                            </ul>
                                                                                                        </div>-->
                                                </div>
                                                <div class="product_content">
                                                    <div class="product_content_inner">
                                                        <h4 class="product_name"><a href="productDetails.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                       <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        </div>
                                                        <div class="add_to_cart">
                                                            <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Add to cart">Thêm Vào Giỏ Hàng</a>
                                                    </div>

                                                </div>
                                            </figure>
                                        </article>
                                    </c:if>
                                </c:forEach>

                            </div>
                        </div>
                        <div class="tab-pane fade" id="Audio" role="tabpanel">
                            <div class="product_carousel product_style product_column5 owl-carousel">                               
                                <c:forEach items="${proLTCCSangTrong}" var="proCom">
                                    <c:if test="${proCom.discount>0}">
                                        <article class="single_product" style="height: 420px">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="product-details.html"><img src="${proCom.productImage}" alt=""></a>
                                                    <!--<a class="secondary_img" href="product-details.html"><img src="/Poject_Shop_Computer_004/frontend/assets/img/product/product6.jpg" alt=""></a>-->
                                                    <c:if test="${product.discount >0}">
                                                        <div class="label_product">
                                                            <span class="label_sale">Sale</span>
                                                        </div>
                                                    </c:if>
                                                    <!--                                                    <div class="action_links">
                                                                                                            <ul>
                                                                                                                <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a></li>
                                                                                                                <li class="compare"><a href="#" title="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                                                                                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box" title="quick view"><i class="ion-ios-search-strong"></i></a></li>
                                                                                                            </ul>
                                                                                                        </div>-->
                                                </div>
                                                <div class="product_content">
                                                    <div class="product_content_inner">
                                                        <h4 class="product_name"><a href="productDetails.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                       <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        </div>
                                                        <div class="add_to_cart">
                                                            <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Add to cart">Thêm Vào Giỏ Hàng</a>
                                                    </div>

                                                </div>
                                            </figure>
                                        </article>
                                    </c:if>
                                </c:forEach>                            
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!--product area end-->

            <!--banner area start-->
            <div class="banner_area banner_three_bottom mb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <figure class="single_banner">
                                <div class="banner_thumb">
                                    <a href="shop.html"><img src="${banner3Type1.imageLink}" style="height: 200px;width: 100%" alt=""></a>
                                </div>
                            </figure>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <figure class="single_banner">
                                <div class="banner_thumb">
                                    <a href="shop.html"><img src="${banner3Type2.imageLink}" style="height: 200px;width: 100%" alt=""></a>
                                </div>
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
            <!--banner area end-->

            <!--product area start-->
            <div class="product_area">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="product_header">
                                <div class="section_title s_title_style3">
                                    <h2>PC Gaming</h2>

                                </div>
                                <div class="product_tab_btn">
                                    <ul class="nav" role="tablist">
                                        <li>
                                            <a class="active" data-toggle="tab" href="#Computer3" role="tab" aria-controls="Computer3" aria-selected="true">
                                                PC Gaming Trung Cấp
                                            </a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#Networking2" role="tab" aria-controls="Networking2" aria-selected="false">
                                                PC Gaming Cao Cấp
                                            </a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#Networking3" role="tab" aria-controls="Networking3" aria-selected="false">
                                                PC Gaming Siêu Cao Cấp
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="Computer3" role="tabpanel">
                            <div class="product_carousel product_style product_column5 owl-carousel">
                                <c:forEach items="${listPCGMTrungCap}" var="proCom">
                                    <article class="single_product" style="height: 420px">
                                        <figure>

                                            <div class="product_thumb">
                                                <a class="primary_img" href="product-details.html"><img src="${proCom.productImage}" alt=""></a>
                                                    <c:if test="${proCom.discount >0}">
                                                    <div class="label_product">
                                                        <span class="label_sale">Sale</span>
                                                    </div>
                                                </c:if>
                                                <!--                                                <div class="action_links">
                                                                                                    <ul>
                                                                                                        <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a></li>
                                                                                                        <li class="compare"><a href="#" title="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                                                                                                        <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box" title="quick view"><i class="ion-ios-search-strong"></i></a></li>
                                                                                                    </ul>
                                                                                                </div>-->
                                            </div>
                                            <div class="product_content">
                                                <div class="product_content_inner">
                                                    <h4 class="product_name"><a href="productDetails.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                  <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                    </div>
                                                    <div class="add_to_cart">
                                                        <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Add to cart">Thêm Vào Giỏ Hàng</a>
                                                </div>

                                            </div>
                                        </figure>
                                    </article>
                                </c:forEach>


                            </div>
                        </div>
                        <div class="tab-pane fade" id="Networking2" role="tabpanel">
                            <div class="product_carousel product_style product_column5 owl-carousel">
                                <c:forEach items="${listPCGMCaoCap}" var="proCom">
                                    <article class="single_product" style="height: 420px">
                                        <figure>

                                            <div class="product_thumb">
                                                <a class="primary_img" href="product-details.html"><img src="${proCom.productImage}" alt=""></a>
                                                    <c:if test="${proCom.discount >0}">
                                                    <div class="label_product">
                                                        <span class="label_sale">Sale</span>
                                                    </div>
                                                </c:if>
                                                <!--                                                <div class="action_links">
                                                                                                    <ul>
                                                                                                        <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a></li>
                                                                                                        <li class="compare"><a href="#" title="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                                                                                                        <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box" title="quick view"><i class="ion-ios-search-strong"></i></a></li>
                                                                                                    </ul>
                                                                                                </div>-->
                                            </div>
                                            <div class="product_content">
                                                <div class="product_content_inner">
                                                    <h4 class="product_name"><a href="productDetails.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                   <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                    </div>
                                                    <div class="add_to_cart">
                                                        <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Add to cart">Thêm Vào Giỏ Hàng</a>
                                                </div>

                                            </div>
                                        </figure>
                                    </article>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="Networking3" role="tabpanel">
                            <div class="product_carousel product_style product_column5 owl-carousel">
                                <c:forEach items="${listPCGMSieuCaoCap}" var="proCom">
                                    <article class="single_product" style="height: 420px">
                                        <figure>

                                            <div class="product_thumb">
                                                <a class="primary_img" href="productDetails.htm?productId=${proCom.productId}"><img src="${proCom.productImage}" alt=""></a>
                                                    <c:if test="${proCom.discount >0}">
                                                    <div class="label_product">
                                                        <span class="label_sale">Sale</span>
                                                    </div>
                                                </c:if>
                                                <!--                                                <div class="action_links">
                                                                                                    <ul>
                                                                                                        <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a></li>
                                                                                                        <li class="compare"><a href="#" title="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                                                                                                        <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box" title="quick view"><i class="ion-ios-search-strong"></i></a></li>
                                                                                                    </ul>
                                                                                                </div>-->
                                            </div>
                                            <div class="product_content">
                                                <div class="product_content_inner">
                                                    <h4 class="product_name"><a href="productDetails.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                   <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                    </div>
                                                    <div class="add_to_cart">
                                                        <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Add to cart">Thêm Vào Giỏ Hàng</a>
                                                </div>

                                            </div>
                                        </figure>
                                    </article>
                                </c:forEach>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <!--product area end-->


            <!--product area start-->
            <div class="product_area">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="product_header">
                                <div class="section_title s_title_style3">
                                    <h2>PC Đồ Họa, Render, Máy Chủ</h2>

                                </div>
                                <div class="product_tab_btn">
                                    <ul class="nav" role="tablist">
                                        <li>
                                            <a class="active" data-toggle="tab" href="#Computer4" role="tab" aria-controls="Computer4" aria-selected="true">
                                                PC Thiết Kế Đồ Họa
                                            </a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#Networking5" role="tab" aria-controls="Networking5" aria-selected="false">
                                                PC Render 3D,Video
                                            </a>
                                        </li>


                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="Computer4" role="tabpanel">
                            <div class="product_carousel product_style product_column5 owl-carousel">
                                <c:forEach items="${listTKDoHoa}" var="proCom">
                                    <article class="single_product" style="height: 420px">
                                        <figure>

                                            <div class="product_thumb">
                                                <a class="primary_img" href="productDetails.htm?productId=${proCom.productId}"><img src="${proCom.productImage}" alt=""></a>
                                                    <c:if test="${proCom.discount >0}">
                                                    <div class="label_product">
                                                        <span class="label_sale">Sale</span>
                                                    </div>
                                                </c:if>                                     
                                            </div>
                                            <div class="product_content">
                                                <div class="product_content_inner">
                                                    <h4 class="product_name"><a href="productDetails.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                   <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                    <div class="add_to_cart">
                                                        <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Add to cart">Thêm Vào Giỏ Hàng</a>
                                                </div>

                                            </div>
                                        </figure>
                                    </article>
                                </c:forEach>


                            </div>
                        </div>
                        <div class="tab-pane fade" id="Networking5" role="tabpanel">
                            <div class="product_carousel product_style product_column5 owl-carousel">
                                <c:forEach items="${listPCRenderVideo}" var="proCom">
                                    <article class="single_product" style="height: 420px">
                                        <figure>

                                            <div class="product_thumb">
                                                <a class="primary_img" href="productDetails.htm?productId=${proCom.productId}"><img src="${proCom.productImage}" alt=""></a>
                                                    <c:if test="${proCom.discount >0}">
                                                    <div class="label_product">
                                                        <span class="label_sale">Sale</span>
                                                    </div>
                                                </c:if>
                                              
                                            </div>
                                            <div class="product_content">
                                                <div class="product_content_inner">
                                                    <h4 class="product_name"><a href="productDetails.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                   <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                    </div>
                                                    <div class="add_to_cart">
                                                        <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Add to cart">Thêm Vào Giỏ Hàng</a>
                                                </div>

                                            </div>
                                        </figure>
                                    </article>
                                </c:forEach>
                            </div>
                        </div>


                    </div>

                </div>
            </div>

            <!--product area end-->
            <!--Categories product area start-->
            <div class="categories_product_area mb-55">
                <div class="container">
                    <div class="categories_product_inner">
                        <c:forEach items="${listBrand}" var="brand">
                            <div class="single_categories_product">
                                <div class="categories_product_content">
                                    <h4><a href="productBrand.htm?brandId=${brand.brandId}&&page=1">${brand.brandName}</a></h4>
                                    <!--                                    <p>12 Products</p>-->
                                </div>
                                <div class="categories_product_thumb" style="height: 70px">
                                    <a href="productBrand.htm?brandId=${brand.brandId}&&page=1"><img src="${brand.brandImage}" width="70px" alt=""></a>
                                </div>
                            </div>
                        </c:forEach>                
                    </div>
                </div>
            </div>
            <!--Categories product area end-->



            <!--product area start-->
            <div class="small_product_area small_product_style2 small_product7 mb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="small_product_list">
                                <div class="section_title s_title_style3">
                                    <h2>Màn Hình Máy Tính</h2>
                                </div>
                                <div class="product_carousel small_p_container  product_column1 owl-carousel">
                                    <div class="product_items">
                                        <c:forEach items="${listMHGarming}" var="proCom">
                                            <figure class="single_product">
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="productDetails.htm?productId=${proCom.productId}"><img src="${proCom.productImage}" alt=""></a>

                                                </div>
                                                <div class="product_content">
                                                    <h4 class="product_name"><a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                    <span>(${proCom.categories.catName})</span>
                                                    <div class="product_rating">
                                                        <ul>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                        </ul>
                                                    </div>
                                                   <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <div class="product_cart_button">
                                                            <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Thêm Vào Giỏ Hàng"><i class="fa fa-shopping-bag"></i></a>
                                                    </div>

                                                </div>
                                            </figure>
                                        </c:forEach>


                                    </div>
                                    <div class="product_items">
                                        <c:forEach items="${listMHTKDH}" var="proCom">
                                            <figure class="single_product">
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="productDetails.htm?productId=${proCom.productId}"><img src="${proCom.productImage}" alt=""></a>

                                                </div>
                                                <div class="product_content">
                                                    <h4 class="product_name"><a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                    <span>(${proCom.categories.catName})</span>
                                                    <div class="product_rating">
                                                        <ul>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                        </ul>
                                                    </div>
                                                   <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <div class="product_cart_button">
                                                            <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Thêm Vào Giỏ Hàng"><i class="fa fa-shopping-bag"></i></a>
                                                    </div>

                                                </div>
                                            </figure>
                                        </c:forEach>
                                    </div>
                                    <div class="product_items">

                                        <c:forEach items="${listMHTKDH}" var="proCom">
                                            <figure class="single_product">
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="productDetails.htm?productId=${proCom.productId}"><img src="${proCom.productImage}" alt=""></a>

                                                </div>
                                                <div class="product_content">
                                                    <h4 class="product_name"><a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                    <span>(${proCom.categories.catName})</span>
                                                    <div class="product_rating">
                                                        <ul>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                        </ul>
                                                    </div>
                                                   <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <div class="product_cart_button">
                                                            <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Thêm Vào Giỏ Hàng"><i class="fa fa-shopping-bag"></i></a>
                                                    </div>

                                                </div>
                                            </figure>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="small_product_list">
                                <div class="section_title s_title_style3">
                                    <h2>Phụ Kiện Máy Tính</h2>
                                </div>
                                <div class="product_carousel small_p_container  product_column1 owl-carousel">
                                    <div class="product_items">
                                        <c:forEach items="${listPKBanPhim}" var="proCom">
                                            <figure class="single_product">
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="productDetails.htm?productId=${proCom.productId}"><img src="${proCom.productImage}" alt=""></a>

                                                </div>
                                                <div class="product_content">
                                                    <h4 class="product_name"><a href="productDetails.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                    <span>(${proCom.categories.catName})</span>
                                                    <div class="product_rating">
                                                        <ul>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                        </ul>
                                                    </div>
                                                   <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <div class="product_cart_button">
                                                            <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Thêm Vào Giỏ Hàng"><i class="fa fa-shopping-bag"></i></a>
                                                    </div>

                                                </div>
                                            </figure>
                                        </c:forEach>

                                    </div>
                                    <div class="product_items">
                                        <c:forEach items="${listPKChuot}" var="proCom">
                                            <figure class="single_product">
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="productDetails.htm?productId=${proCom.productId}"><img src="${proCom.productImage}" alt=""></a>

                                                </div>
                                                <div class="product_content">
                                                    <h4 class="product_name"><a href="productDetails.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                    <span>(${proCom.categories.catName})</span>
                                                    <div class="product_rating">
                                                        <ul>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <div class="product_cart_button">
                                                            <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Thêm Vào Giỏ Hàng"><i class="fa fa-shopping-bag"></i></a>
                                                    </div>

                                                </div>
                                            </figure>
                                        </c:forEach>

                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="small_product_list">
                                <div class="section_title s_title_style3">
                                    <h2>Thiết Bị Văn Phòng</h2>
                                </div>
                                <div class="product_carousel small_p_container  product_column1 owl-carousel">
                                    <div class="product_items">
                                        <c:forEach items="${listTBVPMayChieu}" var="proCom">
                                            <figure class="single_product">
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="productDetails.htm?productId=${proCom.productId}"><img src="${proCom.productImage}" alt=""></a>

                                                </div>
                                                <div class="product_content">
                                                    <h4 class="product_name"><a href="productDetails.htm?productId=${proCom.productId}">${proCom.productName}-${proCom.productCode}</a></h4>
                                                    <span>(${proCom.categories.catName})</span>
                                                    <div class="product_rating">
                                                        <ul>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <c:if test="${proCom.discount >0}">
                                                            <div class="price_box">
                                                                <span class="old_price"><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span><br>
                                                                <span class="current_price"><fmt:formatNumber>${proCom.price*((100-proCom.discount)/100)}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${proCom.discount ==0}">
                                                            <div class="price_box" style="padding-top: 20px">
                                                                <span class="old_price"></span>
                                                                <span class="current_price" ><fmt:formatNumber>${proCom.price}</fmt:formatNumber> VND</span>
                                                                </div>
                                                        </c:if>
                                                        <div class="product_cart_button">
                                                            <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proCom.productId}" title="Thêm Vào Giỏ Hàng"><i class="fa fa-shopping-bag"></i></a>
                                                    </div>

                                                </div>
                                            </figure>
                                        </c:forEach>

                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--product area end-->



            <!--blog area start-->

            <!--blog area end-->

        </div>
        <!--home section bg area end-->

        <!--footer area start-->
        <jsp:include page="../fontend/layoutFontend/footer.jsp"/>
