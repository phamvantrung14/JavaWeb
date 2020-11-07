<%-- 
    Document   : listOrder
    Created on : Oct 5, 2020, 10:46:39 PM
    Author     : asuspc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib prefix="mytag" uri="/WEB-INF/tlds/MyCustomTag" %>
<jsp:include page="../layout/header.jsp"/>

<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Quản Lý Đơn Hàng</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                        <li class="breadcrumb-item active">Quản Lý Đơn Hàng</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <div class="col-md-12">
        <div class="card card-warning collapsed-card">
            <div class="card-header">
                <h3 class="card-title">Tra Cứu Đơn Hàng</h3>

                <div class="card-tools">
                    
                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                    </button>
                  
                    <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body" style="display: none; color: #FFF">
                <div class="col-md-12" style="margin-top: 10px;margin-bottom: 10px;">
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-primary"><i class="far fa-envelope"></i></span>

                    <div class="info-box-content">
                        <a href="getStatus.htm?page=1&&status=1">
                            <span class="info-box-text">Đang Chờ Xác Nhận</span>
                            <span class="info-box-number">${listOrderDC.size()}</span>
                        </a>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-md-3 col-sm-6 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-info"><i class="far fa-flag"></i></span>

                    <div class="info-box-content">
                        <a href="getStatus.htm?page=1&&status=2">
                            <span class="info-box-text">Đã Xác Nhận</span>
                            <span class="info-box-number">${listOrderDXN.size()}</span>
                        </a>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-md-3 col-sm-6 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-success"><i class="fas fa-shipping-fast"></i></span>

                    <div class="info-box-content">
                        <a href="getStatus.htm?page=1&&status=3">
                            <span class="info-box-text">Đang Vận Chuyển</span>
                            <span class="info-box-number">${listOrderDVC.size()}</span>
                        </a>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
             <div class="col-md-3 col-sm-6 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="fas fa-thumbs-up"></i></span>

                    <div class="info-box-content">
                        <a href="getStatus.htm?page=1&&status=4">
                            <span class="info-box-text">Hoàn Thành</span>
                            <span class="info-box-number">${listOrderDHT.size()}</span>
                        </a>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <div class="col-md-3 col-sm-6 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-danger"><i class="far fa-window-close"></i></span>

                    <div class="info-box-content">
                        <a href="getStatus.htm?page=1&&status=5">
                            <span class="info-box-text">Đã Hủy</span>
                            <span class="info-box-number">${listOrderBH.size()}</span>
                        </a>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <div class="col-md-3 col-sm-6 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-fuchsia"><i class="fas fa-clipboard-list"></i></span>

                    <div class="info-box-content">
                        <a href="getAll.htm?page=1">
                            <span class="info-box-text">Tất Cả Đơn Hàng</span>
                            <span class="info-box-number">${tatca.size()}</span>
                        </a>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->
            
            <!-- /.card-footer-->
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Danh Sách Đơn Hàng</h3>
                    </div>
                    <!-- /.card-header -->

                    <div class="card-body p-0">
                        <table class="table table-striped projects">
                            <thead>                  
                                <tr>
                                    <th style="width: 10px">#</th>
                                    <th>Đơn Hàng</th>                      
                                    <th>Tên Người Nhận</th>
                                    <th>Địa Chỉ</th>
                                    <th>Hình Thức Thanh Toán</th>
                                    <th>Trạng Thái</th>
                                    <th>Actions</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listOrders}" var="order" varStatus="itr">
                                    <tr>
                                        <td>${offset+itr.index+1}</td>
                                        <td>ID: ${order.orderId}<br>
                                            Email: ${order.email}<br>
                                            Ngày Tạo: ${order.created}<br>
                                            Tổng Tiền:  <fmt:formatNumber>${order.totalArmount}</fmt:formatNumber>
                                        </td>
                                        <td>${order.orderCode}</td>
                                        <td>${order.orderAddress}-${order.citys.cityName}</td>
                                        <td><c:if test="${order.payment==1}">
                                                <p  class="badge badge-success">Giao Hàng Thanh Toán</p> 
                                            </c:if>
                                                <c:if test="${order.payment==2}">
                                                <p  class="badge badge-info">Online</p> 
                                            </c:if>
                                          </td>
                                        <td><c:if test="${order.orderStatus ==1}">
                                                <p  class="btn btn-primary btn-sm">Đang Chờ</p> 
                                            </c:if>
                                                <c:if test="${order.orderStatus ==2}">
                                                <p  class="btn btn-info btn-sm">Đã Xác Nhận</p> 
                                            </c:if>
                                                <c:if test="${order.orderStatus ==3}">
                                                <p  class="btn btn-success btn-sm">Đang Vận Chuyển</p> 
                                            </c:if>
                                                <c:if test="${order.orderStatus ==4}">
                                                <p  class="btn btn-warning btn-sm">Đã Hoàn Thành</p> 
                                            </c:if>
                                                <c:if test="${order.orderStatus ==5}">
                                                <p  class="btn btn-danger btn-sm">Đã Hủy</p> 
                                            </c:if>
                                               </td>
                                        <td class="project-actions ">
                                            <a href="detailOrder.htm?id=${order.orderId}" class="btn btn-primary btn-sm"><i class="fas fa-folder"> </i> Detail</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <!-- /.card-body -->


                  <div class="card-footer clearfix">
                        <ul class="pagination pagination-sm m-0 float-right">
                            <c:if test="${paginateInfo.totalPage>1}">
                                 <li class="page-item"><a class="page-link" href="#">«</a></li>
                            </c:if>
                            <c:forEach var="gift" begin="1" end="${paginateInfo.totalPage}" varStatus="loop">
                                <c:if test="${(loop.index)==paginateInfo.currentPage}">
                                    <li class="page-item active"><a class="page-link" href="<c:url value="getAll.htm?page=${loop.index}"/>">${loop.index}</a></li>
                                    </c:if>
                                    <c:if test="${(loop.index)!=paginateInfo.currentPage}">
                                    <li class="page-item"><a class="page-link" href="<c:url value="getAll.htm?page=${loop.index}"/>">${loop.index}</a></li>
                                    </c:if>
                                </c:forEach>
                                    <c:if test="${paginateInfo.totalPage>1}">
                                      <li class="page-item"><a class="page-link" href="#">»</a></li>
                                    </c:if>

                        </ul>
                    </div>
                </div>
                <!-- /.card -->


            </div>

        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>
