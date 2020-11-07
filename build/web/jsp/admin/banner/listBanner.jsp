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
            <h1>Quản Lý Banner</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a>Trang Chủ</a></li>
              <li class="breadcrumb-item active">Quản Lý Banner</li>
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
                <h3 class="card-title">Danh Sách Banner</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-striped projects">
                  <thead>                  
                    <tr>
                      <th style="width: 10px">STT</th>
                      <th>Tên Banner</th>                      
                      
                      <th>Loại Banner</th>
                      <th>Ảnh</th>
                      <th>Actions</th>
                     
                    </tr>
                  </thead>
                  <tbody>
                      <c:forEach items="${listBanner}" var="banner" varStatus="itr">
                    <tr>
                      <td>${offset+itr.index+1}
                      </td>
                      <td>${banner.bannerName}<br>
                           <d:choose>
                          <d:when test="${banner.bannerStatus}">
                               <span class="badge badge-success">Hiện</span>
                          </d:when>
                              <d:otherwise>
                                   <span class="badge badge-danger">Ẩn</span>
                              </d:otherwise>
                      </d:choose>
                      </td>
                      
                      <td>${banner.bannerType.bannerTypeName}</td>
                       <td><img src="${banner.imageLink}" width="100"></td>
                      <td>
                          <a href="editBanner.htm?id=${banner.bannerId}" class="btn  btn-info btn-sm"><i class="fas fa-pencil-alt"> </i> Cập Nhật</a>
                          <a href="deleteBanner.htm?id=${banner.bannerId}" class="btn  btn-danger btn-sm"><i class="fas fa-trash"> </i> Xóa</a>
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
            <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Thêm Mới Banner!</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <f:form action="insertBanner.htm" method="POST" enctype="multipart/form-data" commandName="bannerNew">
<!--              <form role="form">-->
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Tên Banner:</label>
                    <f:input path="bannerName" type="text"  class="form-control" id="exampleInputEmail1" required="true" placeholder="Nhập Tên Banner"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Nhập Đường Dẫn:</label>
                    <f:input path="bannerLink" type="text" class="form-control"  placeholder="Nhập Mô Tả Banner"/>
                  </div>
                   <div class="form-group">
                    <label for="exampleInputPassword1">Nhập Thứ Tự:</label>
                    <f:input path="priovity" type="text" class="form-control" id="exampleInputPassword1" placeholder="Nhập Thứ Tự"/>
                  </div>
                  
                  <div class="form-group">
                        <label>Banner Type:</label>
                        <f:select class="custom-select" path="bannerType.bannerTypeId">
                            <c:forEach items="${bannerType}" var="bnType">
                                <f:option value="${bnType.bannerTypeId}">${bnType.bannerTypeName}</f:option>
                            </c:forEach>
                        </f:select>
                      </div>
                  <div class="form-group">
                    <label for="exampleInputFile">Chọn Ảnh:</label>
                    <div class="input-group">
                      <div class="custom-file">
                          <input type="file" name="imageBanner"  class="custom-file-input" id="exampleInputFile"/>
                        <label class="custom-file-label" for="exampleInputFile">Chọn Ảnh</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text" id="">Upload</span>
                      </div>
                    </div>
                  </div>
                   <div class="form-group">
                    <label for="exampleInputEmail1">Trạng Thái:</label>
                    <div class="form-check">
                        <f:radiobutton path="bannerStatus" value="true"  class="form-check-input" checked="true" id="exampleInputEmail1"/>
                    <label class="form-check-label" for="exampleCheck1">Hiện</label>
                    <br>
                    <f:radiobutton path="bannerStatus" value="false"  class="form-check-input" id="exampleInputEmail1"/>
                    <label class="form-check-label" for="exampleCheck1">Ẩn</label>
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
