<%-- 
    Document   : listCate
    Created on : Aug 22, 2020, 4:52:21 PM
    Author     : asuspc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<jsp:include page="../layout/header.jsp"/>
<div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Cập Nhật Địa Điểm(Thành Phố)</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a>Trang Chủ</a></li>
              <li class="breadcrumb-item">Quản Lý Địa Điểm</li>
              <li class="breadcrumb-item active">Cập Nhật Địa Điểm</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Cập Nhật Địa Điểm Thành Phố!</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <f:form action="updateCitys.htm" method="POST" commandName="cityEdit">
<!--              <form role="form">-->

                 <div class="card-body">
                     <f:input path="cityId" type="hidden"/>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Tên Thành Phố:</label>
                    <f:input path="cityName" type="text"  class="form-control" id="exampleInputEmail1" placeholder="Enter Category Name"/>
                  </div>
                   <div class="form-group">
                    <label for="exampleInputEmail1">Trạng Thái:</label>
                    <div class="form-check">
                        <f:radiobutton path="cityStatus" value="true"  class="form-check-input" checked="true" id="exampleInputEmail1"/>
                    <label class="form-check-label" for="exampleCheck1">Hiện </label>
                    <br>
                    <f:radiobutton path="cityStatus" value="false"  class="form-check-input" id="exampleInputEmail1"/>
                    <label class="form-check-label" for="exampleCheck1">Ẩn</label>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-info">Cập Nhật</button>
                </div>
              <!--</form>-->
              </f:form>
            </div>
            <!-- /.card -->


          </div>
        </div>
    </div>
</div>

  <jsp:include page="../layout/footer.jsp"></jsp:include>
