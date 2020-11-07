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
            <h1>Quản Lý Chính Sách Web</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a >Trang Chủ</a></li>
              <li class="breadcrumb-item active">Quản Lý Chính Sách Web</li>
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
                <h3 class="card-title">Danh Sách Chính Sách</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-striped projects">
                  <thead>                  
                    <tr>
                      <th style="width: 10px">STT</th>
                      <th>Tên Chính Sách</th>                      
                      <th>Loại Chính Sách</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                      <c:forEach items="${listPs}" var="listPs" varStatus="itr" >
                    <tr>
                      <td>${offset+itr.index+1}</td>
                      <td>${listPs.psname}<br>
                           <d:choose>
                          <d:when test="${listPs.psstatus}">
                              Show Up
                          </d:when>
                              <d:otherwise>
                                   Hidden
                              </d:otherwise>
                      </d:choose>
                      </td>
                      <td>${listPs.typePolicyStore.typePsname}</td>
                      <td>
                          <a href="editPolicyStore.htm?id=${listPs.policyStoreId}" class="btn  btn-info btn-sm"><i class="fas fa-pencil-alt"> </i> Cập Nhật</a>
                          <a href="deletePolicyStore.htm?id=${listPs.policyStoreId}" class="btn  btn-danger btn-sm"><i class="fas fa-trash"> </i> Xóa</a>
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
                <h3 class="card-title">Thêm Mới Chính Sách!</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <f:form action="insertPolicyStore.htm" method="POST"  commandName="pSNew">
<!--              <form role="form">-->
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Tên Chính Sách:</label>
                    <f:input path="psname" type="text"  class="form-control" required="true" id="exampleInputEmail1" placeholder="Enter Brand Name"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Nội Dung:</label>
                    <f:textarea path="pscontent" type="text" class="form-control" id="desId" placeholder="Enter Description"/>
                  </div>
                    <div class="form-group">
                        <label>Thể Loại Chính Sách:</label>
                        <f:select class="custom-select" path="typePolicyStore.typePsid">
                            <c:forEach items="${listTypePs}" var="bnType">
                                <f:option value="${bnType.typePsid}">${bnType.typePsname}</f:option>
                            </c:forEach>
                        </f:select>
                      </div>
                   <div class="form-group">
                    <label for="exampleInputEmail1">Trang Thái:</label>
                    <div class="form-check">
                        <f:radiobutton path="psstatus" value="true"  class="form-check-input" checked="true" id="exampleInputEmail1"/>
                    <label class="form-check-label" for="exampleCheck1">Hiện</label>
                    <br>
                    <f:radiobutton path="psstatus" value="false"  class="form-check-input" id="exampleInputEmail1"/>
                    <label class="form-check-label" for="exampleCheck1">Ẩn</label>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Thêm Mới</button>
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
