<%-- 
    Document   : listCate
    Created on : Aug 22, 2020, 4:52:21 PM
    Author     : asuspc
--%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<jsp:include page="../layout/header.jsp"/>
<div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Quản Lý Quà Tặng</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
              <li class="breadcrumb-item ">Quản Lý Quà Tặng</li>
              <li class="breadcrumb-item ">Cập Nhật Quà Tặng</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Cập Nhật quà Tặng!</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <f:form action="updateGift.htm" method="POST" commandName="giftEdit">
<!--              <form role="form">-->

                 <div class="card-body">
                     <f:input path="giftId" type="hidden"/>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Tên Quà Tặng:</label>
                    <f:input path="giftName" type="text"  class="form-control" id="exampleInputEmail1" placeholder="Enter Brand Name"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Mã Quà Tặng:</label>
                    <f:input path="giftCode" type="text"  class="form-control" id="exampleInputEmail1" placeholder="Enter Brand Name"/>
                  </div>
                 <div class="form-group">
                    <label for="exampleInputEmail1">Giá Trị Quà Tặng:</label>
                    <f:input path="giftValue" type="text"  class="form-control" id="exampleInputEmail1" placeholder="Enter Brand Name"/>
                  </div>
                 
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Cập Nhật</button>
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
