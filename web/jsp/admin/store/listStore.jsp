<%-- 
    Document   : listCate
    Created on : Aug 22, 2020, 4:52:21 PM
    Author     : asuspc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib prefix="mytag" uri="/WEB-INF/tlds/MyCustomTag" %>
<jsp:include page="../layout/header.jsp"/>
<div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Quản Lý Cửa Hàng</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a>Trang Chủ</a></li>
              <li class="breadcrumb-item active">Quản Lý Cửa Hàng</li>
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
                <h3 class="card-title">Danh Sách Cửa Hàng</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-striped projects">
                  <thead>                  
                    <tr>
                      <th style="width: 10px">STT</th>
                      <th>Tên Cửa Hàng</th>                      
                      <th>Đại Chỉ</th>
                      <th>SĐT</th>
                      <th>Giờ Hoạt Động</th>
                      <th>Actions</th>
                     
                    </tr>
                  </thead>
                  <tbody>
                      <c:forEach items="${listStore}" var="store" varStatus="itr">
                    <tr>
                      <td>${offset+itr.index+1}</td>
                      <td>${store.storeNames}<br>
                           <d:choose>
                          <d:when test="${store.storeStatus}">
                              <span class="badge badge-success">Hiện</span>
                          </d:when>
                              <d:otherwise>
                                <span class="badge badge-danger">Ẩn</span>
                              </d:otherwise>
                      </d:choose>
                                   <br>
                                   Email: ${store.storeEmail}
                                   <br>
                                   Mã Cửa hàng: ${store.storeCode}
                      </td>
                     
                     
                     
                      <td>${store.citys.cityName}-
                          ${store.storeAddress}
                      </td>
                      <td>SĐT: ${store.storePhone}<br>
                          SĐTBH: ${store.guaranteePhone}
                      </td>
                      <td>${store.openTime}</td>
                      <td>
                          <a href="editStore.htm?id=${store.storeId}" class="btn  btn-info btn-sm"><i class="fas fa-pencil-alt"> </i> Cập Nhật</a>
                          <a href="deleteStore.htm?id=${store.storeId}" class="btn  btn-danger btn-sm"><i class="fas fa-trash"> </i> Xóa</a>
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
