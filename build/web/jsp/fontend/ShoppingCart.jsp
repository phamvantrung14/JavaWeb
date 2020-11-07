<%-- 
    Document   : ShoppingCart
    Created on : Jul 10, 2020, 9:58:54 AM
    Author     : asuspc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../fontend/layoutFontend/header.jsp"/> 
<div class="wishlist_page_bg">
    <div class="container">
        <div class="wishlist_area">
            <div class="wishlist_inner">
                <form action="<%=request.getContextPath()%>/cartController/updateQuantity.htm" method="POST">
                    <div class="row">
                        <div class="col-12">
                            <div class="table_desc wishlist">
                                <div class="cart_page table-responsive">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="product_remove">Ảnh Sản Phẩm</th>
                                                <th class="product_thumb">Tên Sản Phẩm</th>
                                                <th class="product_name">Số lượng</th>
                                                <th class="product-price">Giá Bán</th>

                                                <th class="product_total">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        

                                            <c:forEach items="${listCart}" var="cart">
                                                <tr>
                                                    <td class="product_name"><img src="${cart.product.productImage}" width="150px" alt=""></td>
                                                    <td class="product_name">${cart.product.productName}</td>
                                                    <td class="product_quantity"><input type="number" value="${cart.quantity}" name="quantity"/></td>
                                                    <td class="product-price"><fmt:formatNumber>${(cart.product.price*((100-cart.product.discount)/100))*cart.quantity}</fmt:formatNumber> đ</td>                                                  
                                                        <td class="product_remove">
                                                            <!--<input type="submit" value="Update"/>-->
                                                            <a href="deleteCart.htm?productId=${cart.product.productId}"><i class="fa fa-trash-o"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        
                                        </tbody>
                                    </table>
                                </div>
                                    
                            </div>
                            <div class="cart_submit">
                                    <button type="submit">Cập Nhật</button>
                                </div>
                        </div>
                    </div>
                    <div class="coupon_area mt-20">
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                               
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="coupon_code right">
                                    <h3>Tổng Đơn Hàng</h3>
                                    <div class="coupon_inner">
                                        <div class="cart_subtotal">
                                            <p>Tổng Tiền:</p>
                                            <p class="cart_amount"><fmt:formatNumber>${tongTien}</fmt:formatNumber> Đ</p>
                                        </div>                                    
                                        <div class="cart_subtotal">
                                            <p>Thành Tiền:</p>
                                            <p class="cart_amount"><fmt:formatNumber>${tongTien}</fmt:formatNumber> Đ</p>
                                        </div>
                                            <c:if test="${listCart.size()>0}">
                                                <div class="checkout_btn">
                                            <a href="thanhToan.htm">Thanh Toán</a>
                                        </div>
                                            </c:if>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </div>

    </div>

</div>


<jsp:include page="../fontend/layoutFontend/footer.jsp"/>
