<%-- 
    Document   : listPro
    Created on : Sep 12, 2020, 3:24:07 PM
    Author     : asuspc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib prefix="mytag" uri="/WEB-INF/tlds/MyCustomTag" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../layout/header.jsp"/>
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Quản Lý Sản Phẩm</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a >Trang Chủ</a></li>
                        <li class="breadcrumb-item active">Quản Lý Góp Ý Khách Hàng</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
  
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Danh Sách </h3>
                    </div>
                    <!-- /.card-header -->

                    <div class="card-body p-0">
                        <table class="table table-striped projects">
                            <thead>                  
                                <tr>
                                    <th style="width: 10px">STT</th>
                                    <th>Tên Người Gủi</th>                      
                                    <th>Số Điện Thoại</th>
                                    <th>Ngày Tạo</th>
                                    <th>Email</th>
                                    
                                    <th>Actions</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listFB}" var="fb" varStatus="itr">
                                    <tr>
                                        <td>${offset+itr.index+1}</td>
                                        <td>${fb.fullName}</td>
                                        <td>${fb.phoneNumber}</td>
                                        <td>${fb.created}</td>
                                        <td>${fb.email}</td>
                                        <td> <a href="detailFB.htm?id=${fb.feedbackId}" class="btn btn-primary btn-sm"><i class="fas fa-folder"> </i> Chi Tiết</a></td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <!-- /.card-body -->


                   
                </div>
                <!-- /.card -->


            </div>

        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

