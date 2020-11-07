<%-- 
    Document   : listCate
    Created on : Aug 22, 2020, 4:52:21 PM
    Author     : asuspc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../layout/header.jsp"/>
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Quản Lý Danh Mục</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a >Trang Chủ</a></li>
                        <li class="breadcrumb-item active">Quản Lý Danh Mục</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-3 col-sm-6 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-info"><i class="far fa-envelope"></i></span>

                    <div class="info-box-content">
                        <a href="statusAn.htm?page=1">
                            <span class="info-box-text">Trạng Thái Ẩn</span>
                            <span class="info-box-number">${fn:length(listAn)}</span>
                        </a>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-md-3 col-sm-6 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-success"><i class="far fa-flag"></i></span>

                    <div class="info-box-content">
                        <a href="statusHien.htm?page=1">
                            <span class="info-box-text">Trạng Thái Hiện</span>
                            <span class="info-box-number">${fn:length(listHien)}</span>
                        </a>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-md-3 col-sm-6 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="far fa-copy"></i></span>

                    <div class="info-box-content">
                        <a href="getAll.htm?page=1">
                            <span class="info-box-text">Tất Cả</span>
                            <span class="info-box-number">${fn:length(tong)}</span>
                        </a>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->

            <!-- /.col -->
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-7">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Danh Sách Danh Mục</h3>

                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <table class="table table-striped projects">
                            <thead>                  
                                <tr>
                                    <th style="width: 10px">STT</th>
                                    <th>Tên Danh Mục</th>                      
                                    <th>Mô Tả Danh Mục</th>
                                    <th>Actions</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listCate}" var="cate" varStatus="itr">
                                    <tr>
                                        <td>${offset+itr.index+1}
                                        </td>
                                        <td> <c:forEach items="${listParenName}" var="pren">
                                                <c:if test="${cate.parentId==pren.catId}">
                                                    ${pren.catName}
                                                </c:if>
                                            </c:forEach><br>Tên DM: ${cate.catName}<br>
                                            <d:choose>
                                                <d:when test="${cate.catStatus}">
                                                   <span class="badge badge-success">Hiện</span>
                                                </d:when>
                                                <d:otherwise>
                                                   <span class="badge badge-danger">Ẩn</span>
                                                </d:otherwise>
                                            </d:choose><br>
                                            <span>ID: ${cate.catId}</span>
                                            
                                        </td>


                                        <td>${cate.catDescription}</td>
                                        <td>
                                            <a href="editCate.htm?id=${cate.catId}" class="btn  btn-info btn-sm"><i class="fas fa-pencil-alt"> </i> Cập Nhật</a>
                                            <a href="deleteCate.htm?id=${cate.catId}" class="btn  btn-danger btn-sm"><i class="fas fa-trash"> </i> Xóa</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                        <mytag:PaginatiomnTaglib steps="10" offset="${offset}" count="${count}" uri="/cateController/getAll.htm" next="&raquo;" previous="&laquo;"/>
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
            <div class="col-md-5">
                <!-- general form elements -->
                <div class="card card-info">
                    <div class="card-header">
                        <h3 class="card-title">Thêm Mới danh Mục!</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                <i class="fas fa-minus"></i></button>
                        </div>
                    </div>
                    <div class="card-body" style="display: block;">
                        <!-- /.card-header -->
                        <!-- form start -->
                        <f:form action="getAll.htm" method="POST" commandName="cateNew">                        
                            <div class="form-group">
                                <label for="exampleInputEmail1">Tên Danh Mục:</label>
                                <f:input path="catName" type="text"  class="form-control" id="exampleInputEmail1" required="true" placeholder="Nhập Tên Danh mục..."/>

                            </div>
                            <div class="has-error">
                                <f:errors path="catName" class="help-inline"/>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Mô Tả:</label>
                                <f:textarea path="catDescription" type="text" class="form-control" id="desId" placeholder="Enter Description"/>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Thứ Tự:</label>
                                <f:input path="catPriority" type="text" class="form-control" required="true" id="exampleInputPassword1" placeholder="Nhập Thứ Tự Sắp Xếp..."/>
                            </div>
                            <div class="has-error">
                                <f:errors path="catPriority" class="help-inline"/>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Parent Id:</label>
                                <f:input path="parentId" type="text" class="form-control" required="true" id="exampleInputPassword1" placeholder="Nhập ID Danh Mục Cha..."/>
                            </div>
                            <div class="has-error">
                                <f:errors path="parentId" class="help-inline"/>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Trạng Thái:</label>
                                <div class="form-check">
                                    <f:radiobutton path="catStatus" value="true"  class="form-check-input" checked="true" id="exampleInputEmail1"/>
                                    <label class="form-check-label" for="exampleCheck1">Hiện</label>
                                    <br>
                                    <f:radiobutton path="catStatus" value="false"  class="form-check-input" id="exampleInputEmail1"/>
                                    <label class="form-check-label" for="exampleCheck1">Ẩn</label>
                                </div>
                            </div>

                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="submit" class="btn btn-info">Thêm Mới</button>
                            </div>
                        </f:form>
                    </div>
                </div>
                <!-- /.card -->


            </div>
        </div>
    </div>


</div>


<jsp:include page="../layout/footer.jsp"></jsp:include>

