<%-- 
    Document   : listCate
    Created on : Aug 22, 2020, 4:52:21 PM
    Author     : asuspc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<jsp:include page="../layout/header.jsp"/>
<div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Quản Lý Thương Hiệu</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
              <li class="breadcrumb-item active">Quản Lý Thương Hiệu</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <div class="container-fluid">
        <div class="row">
   <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Danh Sách Thương Hiệu</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-striped projects">
                  <thead>                  
                    <tr>
                      <th style="width: 10px">STT</th>
                      <th>Tên Thương Hiệu</th>                      
                      <th>Ảnh Đại Diện</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                      <c:forEach items="${listBrands}" var="brand" varStatus="itr" >
                    <tr>
                      <td>${offset+itr.index+1}</td>
                      <td>${brand.brandName}</td>
                      <td><img src="${brand.brandImage}" height="80" width="170"></td>
                      <td>
                          <a href="editBrand.htm?id=${brand.brandId}" class="btn  btn-info btn-sm"><i class="fas fa-pencil-alt"> </i> Edit</a>
                          <a href="deleteBrand.htm?id=${brand.brandId}" class="btn  btn-danger btn-sm"><i class="fas fa-trash"> </i> Delete</a>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                   
                  <li class="page-item"><a class="page-link" href="#">«</a></li>
                  <c:forEach var="gift" begin="1" end="${paginateInfo.totalPage}" varStatus="loop">
                      <c:if test="${(loop.index)==paginateInfo.currentPage}">
                          <li class="page-item active"><a class="page-link" href="<c:url value="getAll.htm?page=${loop.index}"/>">${loop.index}</a></li>
                      </c:if>
                         <c:if test="${(loop.index)!=paginateInfo.currentPage}">
                        <li class="page-item"><a class="page-link" href="<c:url value="getAll.htm?page=${loop.index}"/>">${loop.index}</a></li>
                      </c:if>
                  </c:forEach>
                  
                  <li class="page-item"><a class="page-link" href="#">»</a></li>
                 
                </ul>
              </div>
            </div>
            <!-- /.card -->
          </div>
            <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Add Brands New!</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <f:form action="insertBrand.htm" method="POST" enctype="multipart/form-data" commandName="brandNew">
<!--              <form role="form">-->
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Tên Thương Hiệu:</label>
                    <f:input path="brandName" type="text"  class="form-control" id="exampleInputEmail1" placeholder="Nhập Tên Thương Hiệu"/>
                  </div>
                 <div class="form-group">
                    <label for="exampleInputFile">Logo Thương Hiệu:</label>
                    <div class="input-group">
                      <div class="custom-file">
                          <input type="file" name="imageBrand" data-result="imageBrandReview" class="custom-file-input" id="exampleInputFile"/>
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text" id="">Upload</span>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-info">Thêm Mới</button>
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
