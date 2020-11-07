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
                    <h1>Đóng Góp Ý Kiến</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a >Trang Chủ</a></li>
                        <li class="breadcrumb-item">Đóng Góp Ý Kiến</li>
                        <li class="breadcrumb-item active">Chi Tiết</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Thư Gửi</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fas fa-times"></i></button>
          </div>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-12 col-md-12 col-lg-8 order-2 order-md-1">
            
              <div class="row">
                <div class="col-12">
                  <h4>Nội Dung</h4>
                  <P>
                      ${feedBack.fbcontents}
                  </P>
                </div>
              </div>
            </div>
            <div class="col-12 col-md-12 col-lg-4 order-1 order-md-2">
              <h3 class="text-primary"><i class="fas fa-paint-brush"></i> Thông Tin</h3>             
              <div class="text-muted">
                <p class="text-sm">Người Gửi:
                  <b class="d-block">${feedBack.fullName}</b>
                </p>
                <p class="text-sm">Email:
                  <b class="d-block">${feedBack.email}</b>
                </p>
                <p class="text-sm">Số Điện Thoại:
                  <b class="d-block">${feedBack.phoneNumber}</b>
                </p>
                <p class="text-sm">Ngày Gửi:
                  <b class="d-block">${feedBack.created}</b>
                </p>
              </div>

             
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

