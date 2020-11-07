<%-- 
    Document   : listPro
    Created on : Sep 12, 2020, 3:24:07 PM
    Author     : asuspc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib prefix="mytag" uri="/WEB-INF/tlds/MyCustomTag" %>
<jsp:include page="../layout/header.jsp"/>
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Chi Tiết Đơn Hàng</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a>Trang Chủ</a></li>
                        <li class="breadcrumb-item">Quản Lý Đơn Hàng</li>
                        <li class="breadcrumb-item active">Chi Tiết Đơn Hàng</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <div class="container-fluid">
        <div class="row">

            <div class="col-12">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card card-info">
                            <div class="card-header">
                                <div class="card-title">
                                    Thông Tin Đơn Hàng:
                                </div>
                               
                            </div>
                            <div class="card-body">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <td>Mã Đơn Hàng:</td>
                                            <td>${order.orderId}</td>
                                        </tr>
                                        <tr>
                                            <td>Tên Người Nhận:</td>
                                            <td>${order.orderCode}</td>
                                        </tr>
                                        <tr>
                                            <td>Ngày Tạo Đơn:</td>
                                            <td>${order.created}</td>
                                        </tr>
                                        <tr>
                                            <td>Tổng Tiền:</td>
                                            <td><fmt:formatNumber>${order.totalArmount}</fmt:formatNumber> đ</td>
                                            </tr>
                                            <tr>
                                                <td>Hình Thức Thanh Toán:</td>
                                                <td>${order.payment}</td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td>${order.email}</td>
                                        </tr>
                                        <tr>
                                            <td>Địa Chỉ Nhận Hàng:</td>
                                            <td>${order.orderAddress}-${order.citys.cityName}</td>
                                        </tr>
                                        <tr>
                                            <td>Số Điện Thoại:</td>
                                            <td>${order.phoneNumber}</td>
                                        </tr>
                                        <tr>
                                            <td>Trạng Thái Hiện Tại:</td>
                                            <td><a  class="btn ${btnbtn} btn-sm" style="color: white">${trangThai}</a></td>
                                        </tr>
                                        <tr>
                                            <td>Note:</td>
                                            <td>${order.orderNote}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="Row">
                            <div class="col-12">
                                <div class="card card-info ">
                                    <div class="card-header">
                                        <div class="card-title">
                                            Chi tiết Đơn Hàng
                                        </div>
                                      
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th style="width: 10px">#</th>
                                                    <th>Ảnh Sản Phẩm</th>
                                                    <th>Tên Sản Phẩm</th>
                                                    <th>Số Lượng</th>
                                                    <th>Loại Sản Phẩm</th>
                                                    <th>Giá Bán</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listOrderDetail}" var="lsOdDetail" varStatus="itr">
                                                    <tr>
                                                        <td>${offset+itr.index+1}.</td>
                                                        <td><img src="${lsOdDetail.products.productImage}" width="100"></td>
                                                        <td>${lsOdDetail.products.productName}<br>
                                                            Hãng: ${lsOdDetail.products.brands.brandName}</td>
                                                        <td>${lsOdDetail.quantity}</td>
                                                        <td>
                                                        <c:forEach items="${listCate}" var="cate">
                                                            <c:if test="${lsOdDetail.products.categories.parentId == cate.catId}">
                                                                ${cate.catName}<br>
                                                            </c:if>
                                                        </c:forEach>
                                                        ${lsOdDetail.products.categories.catName}</td>
                                                        <td><fmt:formatNumber>${lsOdDetail.amount}</fmt:formatNumber>đ</td>
                                                        </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>                          
                        </div>

                    </div>
                </div>
                <div class="Row">
               
                    
                    <div class="col-md-4" style="padding-left:0px;">
                         
                        <c:if test="${!empty messege}">
                             <div class="header">
                             <div class="alert alert-success">
                                 <h6>${messege}</h6>
                             </div>
                         </div>
                        </c:if>
                        
                        
                        <div class="card card-info">
                            <div class="card-header">
                                <div class="card-title">
                                    Trang Thái Đơn Hàng:
                                </div>
                                <div class="card-tools">
                                   
                                </div>
                            </div>
                            <f:form role="form" method="POST" action="updateStatus.htm" commandName="order"> 
                            <div class="card-body">                         
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <f:input type="hidden" path="orderId"/>
                                            <!-- select -->
                                            <div class="form-group">
                                                <label>Cập Nhật Trạng Thái Đơn Hàng:</label>
                                                <f:select class="form-control" name="status" path="orderStatus">
                                                    <c:if test="${order.orderStatus ==1}">
                                                        <f:option value="1">Đang Chờ</f:option>
                                                        <f:option value="2">Đã Xác Nhận</f:option>
                                                        <f:option value="3">Đang Vận Chuyển</f:option>
                                                        <f:option value="4">Đã Hoàn Thành</f:option>
                                                        <f:option value="5">Bị Hủy</f:option>
                                                    </c:if>
                                                    <c:if test="${order.orderStatus ==2}">                                                       
                                                        <f:option value="2">Đã Xác Nhận</f:option>
                                                        <f:option value="3">Đang Vận Chuyển</f:option>
                                                        <f:option value="4">Đã Hoàn Thành</f:option>
                                                        <f:option value="5">Bị Hủy</f:option>
                                                    </c:if>
                                                    <c:if test="${order.orderStatus ==3}">                                                       
                                                        <f:option value="3">Đang Vận Chuyển</f:option>
                                                        <f:option value="4">Đã Hoàn Thành</f:option>
                                                        <f:option value="5">Bị Hủy</f:option>
                                                    </c:if>
                                                    <c:if test="${order.orderStatus ==4}">
                                                       
                                                        <f:option value="4">Đã Hoàn Thành</f:option>
                                                        
                                                    </c:if>
                                                        <c:if test="${order.orderStatus ==5}">
                                                        
                                                        <f:option value="5">Bị Hủy</f:option>
                                                    </c:if>
                                                   
                                                </f:select>
                                            </div>
                                        </div>

                                    </div>


                                
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                            </f:form>
                        </div>
                            
                    </div>
                </div>
            

            </div>

        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

