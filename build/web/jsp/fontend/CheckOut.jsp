<%-- 
    Document   : CheckOut
    Created on : Oct 3, 2020, 10:17:46 PM
    Author     : asuspc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../fontend/layoutFontend/header.jsp"/> 

<div class="checkout_page_bg">
    <div class="container">
        <div class="Checkout_section">

            <div class="checkout_form">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="checkout_form_left">
                            <f:form action="insertOrder.htm" method="POST" commandName="orderNew">
                                <h3>Nhập Thông Tin</h3>
                                <div class="row">

                                    <div class="col-lg-12 mb-20">
                                        <label>Người nhận hàng<span>*</span></label>
                                        <f:input type="text"  path="orderCode" placeholder="Nhập tên người nhận hàng."/>
                                    </div>

                                    <div class="col-12 mb-20">
                                        <label>Email</label>
                                        <f:input type="email" path="email" placeholder="Nhập email đơn hàng..."/>
                                    </div>
                                    <div class="col-12 mb-20">
                                        <label for="country">Thành Phố <span>*</span></label>
                                        <f:select class="niceselect_option" path="citys.cityId" id="country" style="display: none;">
                                            <c:forEach items="${listCity}" var="city">
                                                <option value="${city.cityId}">${city.cityName}</option>
                                            </c:forEach> 
                                        </f:select>

                                    </div>

                                    <div class="col-12 mb-20">
                                        <label>Địa chỉ nhận hàng <span>*</span></label>
                                        <f:input placeholder="Nhập địa chỉ nhận hàng" path="orderAddress" type="text"/>
                                    </div>

                                    <div class="col-12 mb-20">
                                        <label>Số điện thoại <span>*</span></label>
                                        <f:input type="number" path="phoneNumber" placeholder="Nhập số điện thoại.."/>
                                    </div>
                                    <div class="col-12">
                                        <div class="order-notes">
                                            <label for="order_note">Ghi Chú</label>
                                            <f:textarea id="order_note" path="orderNote" placeholder="Nhập ghi chú ..."/>
                                        </div>
                                    </div>
                                        <div class="col-12 mb-20">
                                        <label for="country">Thanh Toán <span>*</span></label>
                                        <f:select class="niceselect_option" path="payment" id="country" style="display: none;">                                           
                                                <option value="1">Thanh Toán Khi Nhận Hàng</option>                                           
                                                <option value="2">COD</option>                                           
                                        </f:select>

                                    </div>
                                    <div class="payment_method col-12">
                                        <c:if test="${listCart.size()>0}">
                                             <div class="order_button">
                                            <button type="submit">Gửi</button>
                                        </div>
                                        </c:if>
                                       
                                    </div>
                                </div>
                            </f:form>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="checkout_form_right">
                            <form action="#">
                                <h3>Đơn Hàng:</h3>
                                <div class="order_table table-responsive">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Sản Phẩm</th>
                                                <th>Thành Tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listCart}" var="cart">
                                                <tr>
                                                    <td> ${cart.product.productName} <strong> × ${cart.quantity}</strong></td>
                                                    <td><fmt:formatNumber>${(cart.product.price*((100-cart.product.discount)/100))*cart.quantity}</fmt:formatNumber> đ</td>
                                                    </tr>
                                            </c:forEach>

                                        </tbody>
                                        <tfoot>
                                            <tr class="order_total">
                                                <th>Tổng Tiền:</th>
                                                <td><strong><fmt:formatNumber>${tongTien}</fmt:formatNumber> Đ</strong></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="../fontend/layoutFontend/footer.jsp"/>
