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
                        <li class="breadcrumb-item active">Quản Lý Sản Phẩm</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <div class="col-md-12">
        <div class="card card-warning collapsed-card">
            <div class="card-header">
                <h3 class="card-title">Tra Cứu sản Phẩm</h3>

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
                            <a href="searchStatusFalse.htm" class="btn btn-block btn-primary">Ẩn</a>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12">
                            <a href="searchStatusTrue.htm" class="btn btn-block btn-info">Hiện</a>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12">
                            <a  href="getAll.htm?page=1" class="btn btn-block btn-success">Tất Cả</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer" style="display: none;">
                <form action="searchPro.htm" method="post">
                    <div class="input-group">
                        <select name="cateId" class="form-control col-md-3">
                            <c:forEach items="${listCate}" var="cate">
                                <option value="${cate.catId}">
                                    <c:forEach items="${lisCateParen}" var="cateParen">
                                        <c:if test="${cate.parentId==cateParen.catId}">
                                             ${cateParen.catName}
                                        </c:if>
                                       
                                    </c:forEach> -${cate.catName}
                                   
                                </option>
                            </c:forEach>
                        </select>
                        <input type="text" name="message" placeholder="Nhập tên sản phẩm cần tìm kiếm..." class="form-control">
                        <span class="input-group-append">
                            <button type="submit" class="btn btn-warning">Tìm kiếm</button>
                        </span>
                    </div>
                </form>
            </div>
            <!-- /.card-footer-->
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Danh Sách Sản Phẩm</h3>
                    </div>
                    <!-- /.card-header -->

                    <div class="card-body p-0">
                        <table class="table table-striped projects">
                            <thead>                  
                                <tr>
                                    <th style="width: 10px">STT</th>
                                    <th>Tên Sản Phẩm</th>                      
                                    <th>Mã Sản Phẩm</th>
                                    <th>Loại Sản Phẩm</th>
                                    <th>Giá Bán</th>
                                    <th>Ảnh Sản Phẩm</th>
                                    <th>Trạng Thái</th>
                                    <th>Actions</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listPro}" var="pro" varStatus="itr">
                                    <tr>
                                        <td>${offset+itr.index+1}
                                        </td>
                                        <td>${pro.productName}</td>
                                        <td>${pro.productCode}</td>
                                        <td>${pro.categories.catName}</td>
                                        <td><fmt:formatNumber>${pro.price}</fmt:formatNumber> đ</td>
                                        <td><img src="${pro.productImage}" width="100"></td>
                                        <td> <d:choose>
                                                <d:when test="${pro.productStatus}">
                                                    <span class="badge badge-success">Hiện</span>
                                                </d:when>
                                                <d:otherwise>
                                                   <span class="badge badge-danger">Ẩn</span>
                                                </d:otherwise>
                                            </d:choose></td>
                                        <td class="project-actions ">
                                            <a href="detailPro.htm?id=${pro.productId}" class="btn btn-primary btn-sm"><i class="fas fa-folder"> </i> Chi Tiết</a>

                                            <a href="deleteProducts.htm?id=${pro.productId}" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Xóa</a>
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

