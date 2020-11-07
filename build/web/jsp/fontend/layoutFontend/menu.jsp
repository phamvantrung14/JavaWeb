<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<div class="Offcanvas_menu">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="canvas_open canvas4_open">
                    <a href="javascript:void(0)"><i class="ion-navicon"></i></a>
                </div>
                <div class="Offcanvas_menu_wrapper">
                    <!--                    <div class="canvas_close">
                                            <a href="javascript:void(0)"><i class="ion-android-close"></i></a>
                                        </div>
                                        <div class="antomi_message">
                                            <p>Get free shipping – Free 30 day money back guarantee</p>
                                        </div>
                                        <div class="header_top_settings text-right">
                                            <ul>
                                                <li><a href="#">Store Locations</a></li>
                                                <li><a href="#">Track Your Order</a></li>
                                                <li>Hotline: <a href="tel:+(012)800456789">(012) 800 456 789 </a></li>
                                                <li>Quality Guarantee Of Products</li>
                                            </ul>
                                        </div>-->
                    <div class="search_container">
                        <form action="#">
                            <div class="hover_category">
                                <select class="select_option" name="select" id="categori1">
                                    <option selected value="1">All Categories</option>
                                    <option value="2">Accessories</option>
                                    <option value="3">Accessories & More</option>
                                    <option value="4">Butters & Eggs</option>
                                    <option value="5">Camera & Video </option>
                                    <option value="6">Mornitors</option>
                                    <option value="7">Tablets</option>
                                    <option value="8">Laptops</option>
                                    <option value="9">Handbags</option>
                                    <option value="10">Headphone & Speaker</option>
                                    <option value="11">Herbs & botanicals</option>
                                    <option value="12">Vegetables</option>
                                    <option value="13">Shop</option>
                                    <option value="14">Laptops & Desktops</option>
                                    <option value="15">Watchs</option>
                                    <option value="16">Electronic</option>
                                </select>
                            </div>
                            <div class="search_box">
                                <input placeholder="Search product..." type="text">
                                <button type="submit">Search</button>
                            </div>
                        </form>
                    </div>
                    <div id="menu" class="text-left ">
                        <ul class="offcanvas_main_menu">
                            <li class="menu-item-has-children active">
                                <a href="<%=request.getContextPath()%>/antomi/home.htm">Trang Chủ</a>
                            </li>
                            <li class="menu-item-has-children">
                                <a href="javascript:void(0)">Tìm Theo Hãng</a>
                                <ul class="sub-menu">
                                    <c:forEach items="${listMenuBrands}" var="menuBrand">
                                        <li class="menu-item-has-children">
                                            <a href="<%=request.getContextPath()%>/antomi/productBrand.htm?brandId=${menuBrand.brandId}" >${menuBrand.brandName}</a>
                                        </li>
                                    </c:forEach>

                                </ul>
                            </li>
                            <li class="menu-item-has-children">
                                <a href="<%=request.getContextPath()%>/antomi/cua-hang.htm">Cửa Hàng</a>
                            </li>
                            <li class="menu-item-has-children">
                                <a href="<%=request.getContextPath()%>/antomi/lien-he.htm">Hỗ Trợ</a>
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
    <div class="main_header header_four m-0">
        <div class="container">
            <!--header top start-->
            <div class="header_top">
                <div class="row align-items-center">
                    <!--                    <div class="col-lg-4 col-md-5">
                                            <div class="antomi_message">
                                                <p>Get free shipping – Free 30 day money back guarantee</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-8 col-md-7">
                                            <div class="header_top_settings text-right">
                                                <ul>
                                                    <li><a href="#">Store Locations</a></li>
                                                    <li><a href="#">Track Your Order</a></li>
                                                    <li>Hotline: <a href="tel:+(012)800456789">(012) 800 456 789 </a></li>
                                                    <li>Quality Guarantee Of Products</li>
                                                </ul>
                                            </div>
                                        </div>-->
                </div>
            </div>
            <!--header top start-->

            <!--header middel start-->
            <div class="header_middle header_middle_style4">
                <div class="row align-items-center">
                    <div class="column1 col-lg-3 col-md-3 col-4">
                        <div class="logo">
                            <a href="<%=request.getContextPath()%>/antomi/home.htm"><img src="/Project_Shop_Computer_005/frontend/assets/img/logo/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="column2 col-lg-6 col-md-12">
                        <div class="search_container">
                             <form action="searchProductHome.htm" method="post">
                                <div class="search_box" style="border-left: 2px solid #ebebeb;">
                                    <input placeholder="Nhập tên sản phẩm cần tìm kiếm.." name="nameSearch" type="text">
                                    <button type="submit">Search</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="column3 col-lg-3 col-md-7 col-6">
                        <div class="header_configure_area header_configure_four">
                           
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


            <!--header middel start-->
            <div class="header_middle sticky_header_four sticky-header">
                <div class="row align-items-center">
                    <div class="col-lg-2 col-md-6">
                        <div class="logo">
                            <a href="<%=request.getContextPath()%>/antomi/home.htm"><img src="/Project_Shop_Computer_005/frontend/assets/img/logo/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-12">
                        <div class="main_menu menu_position text-center">
                            <nav>
                                <ul>
                                    <li><a class="" href="<%=request.getContextPath()%>/antomi/home.htm">Trang Chủ</a>                                      
                                    </li>
                                    <li class="mega_items"><a href="javascript:void(0)">Tìm Theo Hãng<i class="fa fa-angle-down"></i></a>
                                        <div class="mega_menu">
                                            <div style="padding: 20px 0;display: flex;flex-wrap: wrap;align-items: center;">
                                                <c:forEach items="${listMenuBrands}" var="menuBrand">
                                                    <a href="<%=request.getContextPath()%>/antomi/productBrand.htm?brandId=${menuBrand.brandId}&&page=1" style="float: left;padding: 10px 15px;text-align: center;max-width: 25%;"><img src="${menuBrand.brandImage}" width="80px" alt=""></a>
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
                                                                <li><a href="<%=request.getContextPath()%>/antomi/chinh-sach.htm?policyStoreId=${poliStore.policyStoreId}">${poliStore.psname}</a></li>
                                                                </c:if>
                                                            </c:forEach>
                                                    </ul>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                    <li><a href="<%=request.getContextPath()%>/antomi/cua-hang.htm">Cửa Hàng</a></li>
                                    <li><a href="<%=request.getContextPath()%>/antomi/lien-he.htm">Hỗ Trợ</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="col-lg-3">
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
                        <h3>Giỏ Hàng</h3>
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
                            <p>SL: ${cart.quantity} X <span> <fmt:formatNumber>${cart.product.price*((100-cart.product.discount)/100)}</fmt:formatNumber> đ </span></p>
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
            <div class="header_bottom">
                <div class="row align-items-center">
                    <div class="column1 col-lg-3 col-md-6">
                        <div class="categories_menu categories_four">
                            <div class="categories_title">
                                <h2 class="categori_toggle">DANH MỤC</h2>
                            </div>
                            <div class="categories_menu_toggle">
                                <ul>
                                    <c:forEach items="${listCate}" var="catalog">
                                        <c:choose>
                                            <c:when test="${catalog.parentId ==0}">
                                                <c:if test="${(map.get(catalog.catId)).size()==0}">
                                                    <li class="menu_item_children"><a href="<%=request.getContextPath()%>/antomi/productCategories.htm?cateId=${catalog.catId}&&page=1">${catalog.catName}</a></li>
                                                    </c:if>
                                                    <c:if test="${(map.get(catalog.catId)).size()>0}">
                                                    <li class="menu_item_children"><a href="javascript:void(0)">${catalog.catName}<i class="fa fa-angle-right"></i></a>
                                                        <ul class="categories_mega_menu">
                                                            <c:forEach items="${map.get(catalog.catId)}" var="menu1">
                                                                <c:if test="${menu1.parentId == catalog.catId}">
                                                                    <c:if test="${(map.get(menu1.catId)).size()==0}">
                                                                        <li class="menu_item_children"><a href="<%=request.getContextPath()%>/antomi/productCategories.htm?cateId=${menu1.catId}&&page=1">${menu1.catName}</a></li>
                                                                        </c:if>
                                                                        <c:if test="${(map.get(menu1.catId)).size()>0}">
                                                                        <li class="menu_item_children" style="width: 200px !important;"><a href="<%=request.getContextPath()%>/antomi/productCateParent11.htm?cateId=${menu1.catId}">${menu1.catName}</a>
                                                                            <ul class="categorie_sub_menu">
                                                                                <c:forEach items="${map.get(menu1.catId)}" var="menu2">
                                                                                    <li class="menu_item_children"><a href="<%=request.getContextPath()%>/antomi/productCategories.htm?cateId=${menu2.catId}&&page=1">${menu2.catName}</a></li>
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
                    <div class="column2 col-lg-6 ">
                        <div class="main_menu menu_four menu_position text-center">
                            <nav>
                                <ul>
                                    <li><a class="" href="<%=request.getContextPath()%>/antomi/home.htm">Trang Chủ</a>

                                    </li>
                                    <li class="mega_items"><a href="javascript:void(0)">Tìm Theo Hãng<i class="fa fa-angle-down"></i></a>
                                        <div class="mega_menu">
                                            <div style="padding: 20px 0;display: flex;flex-wrap: wrap;align-items: center;">
                                                <c:forEach items="${listMenuBrands}" var="menuBrand">
                                                    <a href="<%=request.getContextPath()%>/antomi/productBrand.htm?brandId=${menuBrand.brandId}&&page=1" style="float: left;padding: 10px 15px;text-align: center;max-width: 25%;"><img src="${menuBrand.brandImage}" width="80px" alt=""></a>
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
                                                                <li><a href="<%=request.getContextPath()%>/antomi/chinh-sach.htm?policyStoreId=${poliStore.policyStoreId}">${poliStore.psname}</a></li>
                                                            </c:if>
                                                        </c:forEach>
                                                    </ul>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </li>     
                                     <li><a href="<%=request.getContextPath()%>/antomi/cua-hang.htm">Cửa Hàng</a></li>
                                    <li><a href="<%=request.getContextPath()%>/antomi/lien-he.htm">Hỗ Trợ</a></li>

                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="column3 col-lg-3 col-md-6">
                        <div class="header_bigsale h_bigsale_four">
                            <a href="javascript:void(0)">BIG SALE BLACK FRIDAY</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--header bottom end-->
        </div>
    </div>
</header>
<!--header area end-->