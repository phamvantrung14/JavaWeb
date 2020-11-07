<%-- 
    Document   : proDetail
    Created on : Sep 21, 2020, 4:20:59 PM
    Author     : asuspc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../fontend/layoutFontend/header.jsp"/>  
<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/antomi/home.htm">Trang Chủ</a></li>
                        <li>Chi Tiết Sản Phẩm</li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="product_page_bg">
    <div class="container">
        <div class="product_details_wrapper mb-55">
            <!--product details start-->
            <div class="product_details">
                <div class="row">
                    <div class="col-lg-5 col-md-6">
                        <div class="product-details-tab">
                            <div id="img-1" class="zoomWrapper single-zoom">
                                <a href="#">
                                    <img id="zoom1" src="${proDetail.productImage}" data-zoom-image="${proDetail.productImage}" alt="big-1">
                                </a>
                            </div>
                            <c:choose>
                                <c:when test="${!empty listImage}">


                                    <div class="single-zoom-thumb">
                                        <ul class="s-tab-zoom owl-carousel single-product-active" id="gallery_01">
                                            <c:forEach items="${listImage}" var="lsImage">
                                                <li>
                                                    <a href="#" class="elevatezoom-gallery active" data-update="" 
                                                       data-image="${lsImage.imageLink}"
                                                       data-zoom-image="${lsImage.imageLink}">
                                                        <img src="${lsImage.imageLink}" alt="zo-th-1"/>
                                                    </a>
                                                </li>
                                            </c:forEach>


                                        </ul>
                                    </div>
                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-6">
                        <div class="product_d_right">
                            <form action="#">
                                <h3><a href="#">${proDetail.productName}-${proDetail.productCode}</a></h3>                                                         
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="masp">
                                            <p style="padding-right: 20px;border-right: 1px solid black;">Mã SP:  <span style="color: red">${proDetail.productCode}</span></p>
                                        </div>
                                        <div class="product_rating">                                     
                                            <ul style="padding-right: 20px;padding-left: 20px;border-right: 1px solid black;">
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                            </ul>
                                        </div>
                                        <div>
                                            <p style="padding-right: 20px;padding-left: 20px;border-right: 1px solid black;">Lượt Xem: <span>${proDetail.productView}</span></p>
                                        </div>
                                    </div>
                                </div>
                                <div  class="price_box" style="padding: 15px; background: #f5f5f5;border-radius: 5px;">
                                    <div class="">
                                        <table style="width:100%; border-radius: 5px; padding: 10px 20px;">
                                            <tbody>
                                                <tr>
                                                    <td>Giá thị trường:</td>
                                                    <td style="position:relative;"><b class="" style="text-decoration: line-through;font-size: 24px;color: #666;"><fmt:formatNumber>${proDetail.price}</fmt:formatNumber>đ </b></td>
                                                    </tr>
                                                    <tr>                            
                                                        <td style="min-width: 150px;">Giá khuyến mại:</td>
                                                        <td style="position:relative;font-size: 24px;"><b id="p-info-price" class="text-24" > <fmt:formatNumber>${proDetail.price*((100-proDetail.discount)/100)}</fmt:formatNumber> đ </b>       
                                                        <span class="percent red" style="color: red">(Tiết kiệm <fmt:formatNumber>${proDetail.price-(proDetail.price*((100-proDetail.discount)/100))}</fmt:formatNumber>đ)</span>
                                                            <span>[Giá đã có VAT]</span>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>      
                                    <div class="product_variant color">
                                    <c:forEach items="${listProPoli}" var="proPoli">
                                        <p><span class="km-hot" style="background: #243a76;color: #fff;margin-right: 5px; padding: 2px 12px 4px;border-radius: 3px;">Hot</span>${proPoli.policy.policyName}</p>

                                    </c:forEach>
                                </div>
                                <div class="" style="position: relative;border: 1px solid #ececec;border-radius: 16px 8px 8px;padding: 15px 10px;">
                                    <div class="square-trade-content" style="color: #222; font-size: 13px; margin-top: 40px">
                                        <div class="ribbon ribbon-top-left" style="    position: absolute;background-image: linear-gradient(to right,#243a76,#ed1b24);color: #fff;font-size: 15px;font-weight: 500;padding: 10px 20px;top: -2px;left: -2px;border-radius: 8px 2px 19px;box-shadow: 1px 2px 2px 0 rgba(0,0,0,.25);">
                                            <span><i class="far fa-gift"></i> Quà tặng  kèm theo</span>
                                        </div>
                                        <c:forEach items="${listGiftPro}" var="giftPro">
                                            <p><i class="fas fa-gifts" style="color: red;margin: 0 20px 0 0;font-size: 20px"></i>${giftPro.gift.giftName} <span style="color: red;font-weight: bold"><fmt:formatNumber>${giftPro.gift.giftValue}</fmt:formatNumber>đ </span> (${giftPro.gift.giftCode})</p>
                                        </c:forEach>

                                    </div>
                                </div>
                               
                                <c:if test="${proDetail.productStatus==true}">
                                     <div class="button" style="margin-top: 20px;margin-bottom: 10px;width: 100%;text-align: center;height: 66px;line-height: 66px">
                                      <a style="color: #fff;text-align: center;padding: 15px 20px;border-radius: 5px;" href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proDetail.productId}" class="mua-ngay th1">
                                        <span style=";font-size: 18px;font-weight: 700;">Đặt mua ngay</span>
                                    </a>
                                     </div>
                                </c:if>
                                <c:if test="${proDetail.productStatus==false}">
                                    <div class="p-action" style="margin-top: 20px;margin-bottom: 10px;width: 100%;">
                                        <span class="p-qty" style="color: #0074da;"><i class="fas fa-phone fa-flip-horizontal"></i> Liên hệ</span>
                                    </div>
                                   
                                </c:if>
                                  
                                
                                <div class="product_meta">
                                    <span>Loại SP: <a href="#">${proDetail.categories.catName}</a></span>
                                </div>

                            </form>
                            <div class="priduct_social">
                                <ul>
                                    <li><a class="facebook" href="#" title="facebook"><i class="fa fa-facebook"></i> Like</a></li>
                                    <li><a class="twitter" href="#" title="twitter"><i class="fa fa-twitter"></i> tweet</a></li>
                                    <li><a class="pinterest" href="#" title="pinterest"><i class="fa fa-pinterest"></i> save</a></li>
                                    <li><a class="google-plus" href="#" title="google +"><i class="fa fa-google-plus"></i> share</a></li>
                                    <li><a class="linkedin" href="#" title="linkedin"><i class="fa fa-linkedin"></i> linked</a></li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!--product details end-->

            <!--product info start-->
            <div class="product_d_info">
                <div class="row">
                    <div class="col-12">
                        <div class="product_d_inner">
                            <div class="product_info_button">
                                <ul class="nav" role="tablist">
                                    <li>
                                        <a class="active" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="false">Mô Tả</a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#sheet" role="tab" aria-controls="sheet" aria-selected="false">Thông Số Kỹ Thuật</a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Đánh Giá</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="info" role="tabpanel">
                                    <div class="product_info_content">
                                        ${proDetail.productDescription}
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="sheet" role="tabpanel">
                                    <div class="product_d_table">
                                        <form action="#">
                                            <table>
                                                <tbody>
                                                    <c:forEach items="${listProParam}" var="proParam">
                                                        <c:if test="${!empty proParam.proDetailValue}">
                                                            <tr>                                                       
                                                                <td class="first_child">${proParam.parameter.paramName}</td>
                                                                <td>${proParam.proDetailValue}</td>
                                                            </tr> 
                                                        </c:if>

                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>

                                </div>

                                <div class="tab-pane fade" id="reviews" role="tabpanel">

                                    <h4>Bình Luận Và Đánh Giá:</h4>
                                    <c:forEach items="${listComment}" var="comment1">
                                        <c:choose>
                                            <c:when test="${comment1.parenId==0}">

                                                <c:if test="${(mapCM.get(comment1.commentId)).size()==0}">
                                                    <div class="reviews_wrapper">
                                                        <div class="reviews_comment_box">
                                                            <div class="comment_thmb">
                                                                <img src="assets/img/blog/comment2.jpg" alt="">
                                                            </div>
                                                            <div class="comment_text ">
                                                                <div class="reviews_meta">
                                                                    <div class="product_rating">
                                                                        <ul>
                                                                            <c:if test="${comment1.starts ==1}">
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                    </c:if>
                                                                                    <c:if test="${comment1.starts ==2}">
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                    </c:if>
                                                                                    <c:if test="${comment1.starts ==3}">
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                    </c:if>
                                                                                    <c:if test="${comment1.starts ==4}">
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                    </c:if>
                                                                                    <c:if test="${comment1.starts ==5}">
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                    </c:if>         
                                                                        </ul>
                                                                    </div>
                                                                    <p><strong>${comment1.userName} </strong>- ${comment1.created}</p>
                                                                    <span>${comment1.commentContent}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${(mapCM.get(comment1.commentId)).size()>0}">
                                                    <div class="reviews_comment_box">
                                                        <div class="comment_thmb">
                                                            <img src="assets/img/blog/comment2.jpg" alt="">
                                                        </div>
                                                        <div class="comment_text ">
                                                            <div class="reviews_meta">
                                                                <div class="product_rating">
                                                                    <ul>
                                                                        <c:if test="${comment1.starts ==1}">
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                </c:if>
                                                                                <c:if test="${comment1.starts ==2}">
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                </c:if>
                                                                                <c:if test="${comment1.starts ==3}">
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                </c:if>
                                                                                <c:if test="${comment1.starts ==4}">
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                </c:if>
                                                                                <c:if test="${comment1.starts ==5}">
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                                                </c:if>                                                                      
                                                                    </ul>
                                                                </div>
                                                                <p><strong>${comment1.userName} </strong>- ${comment1.created}</p>
                                                                <span>${comment1.commentContent}</span>
                                                                <c:forEach items="${(mapCM.get(comment1.commentId))}" var="cm112">
                                                                    <div class="reviews_comment_box">
                                                                        <div class="comment_text ">
                                                                            <p><strong>${cm112.userName} </strong>- ${cm112.created}</p>
                                                                            <span>${cm112.commentContent}</span>
                                                                        </div>

                                                                    </div>

                                                                </c:forEach>    
                                                            </div>

                                                        </div>
                                                    </div>

                                                </c:if>
                                            </c:when>
                                        </c:choose>

                                    </c:forEach>
                                    <c:if test="${listComment.size()==0}">
                                        <p>Chưa có đánh giá</p>
                                    </c:if>
                                    <div class="comment_title">
                                        <h4>Đánh Giá Của Bạn: </h4>
                                    </div>

                                    <div class="product_review_form">                                         
                                        <f:form action="insertComment.htm" method="POST" commandName="commentNew">
                                            <div class="row">
                                                <f:input type="hidden" path="products.productId" value="${proDetail.productId}"/>
                                                <div class="col-12">
                                                    <label for="review_comment">Nội Dung:</label>
                                                    <f:textarea path="commentContent" id="review_comment"></f:textarea>
                                                    </div>
                                                    <div class="col-md-12 ">
                                                        <label for="review_comment">Đánh Giá Của Bạn:</label>
                                                    <f:select path="starts" >
                                                        <f:option value="1">1 Sao</f:option>
                                                        <f:option value="2">2 sao</f:option>
                                                        <f:option value="3">3 sao</f:option>
                                                        <f:option value="4">4 sao</f:option>
                                                        <f:option value="5">5 sao</f:option>
                                                    </f:select>
                                                </div>
                                                <div class="col-lg-6 col-md-6">
                                                    <label for="author">Tên của bạn:</label>
                                                    <f:input path="userName" type="text"/>
                                                </div>
                                                <div class="col-lg-6 col-md-6">
                                                    <label for="email">Email: </label>
                                                    <f:input path="Email" type="text"/>
                                                </div>
                                                <div class="col-lg-6 col-md-6">
                                                    <label for="email">Số điện thoại: </label>
                                                    <f:input path="phoneNumber" type="number"/>
                                                </div>


                                            </div>
                                            <button type="submit">Đăng</button>
                                        </f:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--product info end-->
    </div>

    <!--product area start-->
    <section class="product_area related_products">
        <div class="row">
            <div class="col-12">
                <div class="section_title">
                    <h2>Các Sản Phẩm Khác</h2>
                </div>
            </div>
        </div>
        <div class="product_carousel product_style product_column5 owl-carousel">
            <c:forEach items="${listProTuongtu}" var="proTuongTu">
                <c:if test="${proTuongTu.productId!=proDetail.productId}">
                    <article class="single_product" style="height: 550px">
                        <figure>
                            <div class="product_thumb">
                                <a class="primary_img" href="<%=request.getContextPath()%>/antomi/productDetails.htm?productId=${proTuongTu.productId}"><img src="${proTuongTu.productImage}" alt=""></a>                       
                                    <c:if test="${proTuongTu.discount >0}">
                                    <div class="label_product">
                                        <span class="label_sale">Sale</span>
                                    </div>
                                </c:if>

                            </div>
                            <div class="product_content">
                                <div class="product_content_inner">
                                    <h4 class="product_name"><a href="<%=request.getContextPath()%>/antomi/productDetails.htm?productId=${proTuongTu.productId}">${proTuongTu.productName}-${proTuongTu.productCode}</a></h4>
                                    <c:if test="${proTuongTu.discount >0}">
                                        <div class="price_box">
                                            <span class="old_price"><fmt:formatNumber>${proTuongTu.price}</fmt:formatNumber> VND</span><br>
                                            <span class="current_price"><fmt:formatNumber>${proTuongTu.price*((100-proTuongTu.discount)/100)}</fmt:formatNumber> VND</span>
                                            </div>
                                    </c:if>
                                    <c:if test="${proTuongTu.discount ==0}">
                                        <div class="price_box" style="padding-top: 20px">
                                            <span class="old_price"></span>
                                            <span class="current_price" ><fmt:formatNumber>${proTuongTu.price}</fmt:formatNumber> VND</span>
                                        </div>
                                    </c:if>
                                </div>
                                    <c:if test="${proTuongTu.productStatus==true}">
                                         <div class="add_to_cart">
                                    <a href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${proTuongTu.productId}" title="Add to cart">Thêm Vào Giỏ Hàng</a>
                                </div>
                                    </c:if>
                               
                            </div>
                        </figure>
                    </article>
                
                </c:if>

            </c:forEach>


        </div>

    </section>
    <!--product area end-->


</div>
</div>

<jsp:include page="../fontend/layoutFontend/footer.jsp"/>
