<%-- 
    Document   : listCate
    Created on : Aug 22, 2020, 4:52:21 PM
    Author     : asuspc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
              <li class="breadcrumb-item active">Quản Lý Quà Tặng</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <div class="col-md-12">
        <div class="card card-warning collapsed-card">
            <div class="card-header">
                <h3 class="card-title">Tìm Kiếm Quà Tặng</h3>

                <div class="card-tools">
                    
                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                    </button>
                  
                    <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
            <!-- /.card-header -->
            
            <!-- /.card-body -->
            <div class="card-footer" style="display: none;">
                <form action="searchGift.htm" method="post">
                    <div class="input-group col-md-5">
                        <input name="page" value="1" type="hidden">
                        <input type="text" name="message" placeholder="Nhập mã quà tặng cần tìm kiếm..." class="form-control">
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
   <div class="col-md-7">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Danh Sách Quà Tặng</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-striped projects">
                  <thead>                  
                    <tr>
                      <th style="width: 10px">#</th>
                      <th style="width: 400px">Tên Quà Tặng</th>                      
                        <th>Value</th>
                      
                      <th>Actions</th>
                     
                    </tr>
                  </thead>
                  <tbody>
                      <c:forEach items="${listGift}" var="gift" varStatus="itr">
                    <tr>
                      <td>${offset+itr.index+1}</td>
                      <td>
                          ${gift.giftName}<br>
                          ( ${gift.giftCode})
                      </td>
                      <td><fmt:formatNumber>${gift.giftValue}</fmt:formatNumber> VNĐ</td>
                      <td>
                          <a href="editGift.htm?id=${gift.giftId}" class="btn  btn-info btn-sm"><i class="fas fa-pencil-alt"> </i> Cập Nhật</a>
                          <a href="deleteGift.htm?id=${gift.giftId}" class="btn  btn-danger btn-sm"><i class="fas fa-trash"> </i> Xóa</a>
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
            <div class="col-md-5">
            <!-- general form elements -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Thêm Mới Quà Tặng!</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <f:form action="insertGift.htm" method="POST" commandName="giftNew">
<!--              <form role="form">-->
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Tên Quà Tặng:</label>
                    <f:input path="giftName" type="text"  class="form-control" id="exampleInputEmail1" placeholder="Nhập Tên Quà Tặng"/>
                    <f:errors path="giftName"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Mã Quà Tặng:</label>
                    <f:input path="giftCode" type="text"  class="form-control" id="exampleInputEmail1" placeholder="Nhập Mã Quà Tặng"/>
                    <f:errors path="giftCode"/>
                  </div>
                 <div class="form-group">
                    <label for="exampleInputEmail1">Giá Trị Quà Tặng:</label>
                    <f:input path="giftValue" type="text"  class="form-control" id="exampleInputEmail1" placeholder="Nhập Giá Trị Quà Tặng"/>
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
