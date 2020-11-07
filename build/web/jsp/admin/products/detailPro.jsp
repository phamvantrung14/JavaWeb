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
                    <h1>Chi Tiết Sản Phẩm</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a >Trang Chủ</a></li>
                        <li class="breadcrumb-item">Quản Lý Sản Phẩm</li>
                        <li class="breadcrumb-item active">Chi Tiết Sản Phẩm</li>
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
                        <h3 class="card-title">Chi Tiết Sản Phẩm</h3>

                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                <i class="fas fa-minus"></i></button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fas fa-times"></i></button>
                        </div>
                    </div>
                    <div class="card-body" style="display: block;">
                        <div class="row">
                            <div class="col-12 col-md-12 col-lg-8 order-2 order-md-1">

                                <div class="row">
                                    <div class="col-12">
                                        <h4>Thông tin sản phẩm:</h4>
                                        <div class="post">
                                            <div class="user-block">
                                                <table class="table">
                                                    <tr>
                                                        <td>ID Sản Phẩm</td>
                                                        <td>${proDetail.productId}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Thương Hiệu:</td>
                                                        <td>${proDetail.brands.brandName}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Loại Sản Phẩm:</td>
                                                        <td>${proDetail.categories.catName}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Mã Sản Phẩm:</td>
                                                        <td>${proDetail.productCode}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Tên Sản Phẩm:</td>
                                                        <td>${proDetail.productName}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Tiêu Đề:</td>
                                                        <td>${proDetail.title}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Trạng Thái:</td>
                                                        <td>${proDetail.productStatus}</td>
                                                    </tr>

                                                    <tr>
                                                        <td>Discount:</td>
                                                        <td>${proDetail.discount} %</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Giá Bán:</td>
                                                        <td><fmt:formatNumber>${proDetail.price}</fmt:formatNumber> đ</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Ngày Tạo:</td>
                                                        <td>${proDetail.created}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Số lượt xem:</td>
                                                        <td>${proDetail.productView}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Mức độ:</td>
                                                        <td>${proDetail.productHot}</td>
                                                    </tr>

                                                </table>  
                                                <a href="editProduct.htm?productId=${proDetail.productId}" class="btn btn-sm btn-info">Cập nhật/Chỉnh sửa</a>                 

                                            </div>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-8 col-lg-4 order-1 order-md-2">


                                <div class="card card-warning collapsed-card" style="transition: all 0.15s ease 0s; height: inherit; width: inherit;">
                                    <div class="card-header">
                                        <h3 class="card-title "><i class="fas fa-paint-brush"></i> Ảnh Sản Phẩm</h3>

                                        <div class="card-tools">
                                            <!--<button type="button" class="btn btn-tool" data-card-widget="card-refresh" data-source="widgets.html" data-source-selector="#card-refresh-content" data-load-on-init="false"><i class="fas fa-sync-alt"></i></button>-->
                                            <button type="button" class="btn btn-tool" data-card-widget="maximize"><i class="fas fa-expand"></i></button>
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                                            <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                                        </div>
                                        <!-- /.card-tools -->
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body" style="display: block;">
                                        Tất Cả Ảnh Của Sản Phẩm
                                    </div>
                                    <div class="card-body table-responsive p-0" style="height: 450px; display: block;">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-sm-2">
                                                    <a href="${proDetail.productImage}" data-toggle="lightbox" data-title="sample 1 - white" data-gallery="gallery">
                                                        <img src="${proDetail.productImage}" class="img-fluid mb-2" alt="white sample">
                                                    </a>
                                                </div>
                                                <c:forEach items="${listImgs}" var="ima" varStatus="itr">
                                                    <div class="col-sm-2 text-center">
                                                        <a href="${ima.imageLink}" data-toggle="lightbox" data-title="sample ${offset+itr.index+1} - black" data-gallery="gallery">
                                                            <img src="${ima.imageLink}" class="img-fluid mb-2" width="300" alt="black sample">
                                                        </a>
                                                        <a class="badge bg-danger" href="deleteImg.htm?idImg=${ima.imageId}" style="cursor: pointer">Delete</a>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>


                                        <!-- /.card-body -->
                                    </div>
                                    <div class="card-footer"  style="display: block;">
                                        <div class="form-group col-md-12 ">
                                            <f:form action="insertImages.htm" method="POST" enctype="multipart/form-data" commandName="imgNew">
                                                <label for="exampleInputFile">Thêm Ảnh Sản Phẩm</label>
                                                <div class="input-group">
                                                    <input name="productId" type="hidden" value="${proDetail.productId}"/>
                                                    <input name="productName" type="hidden" value="${proDetail.productName}"/>
                                                    <div class="custom-file">
                                                        <input type="file" name="listImages"   class="custom-file-input" id="exampleInputFile"/>
                                                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                                                    </div>
                                                    <div class="input-group-append">
                                                        <button type="submit" class="btn btn-warning">Thêm Ảnh</button>
                                                    </div>
                                                </div>
                                            </f:form>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->


                                <!-- /.card-header -->


                                <!-- /.card -->


                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>

            </div>
            <section class="content col-12">

                <!-- Default box -->
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Mô Tả - Đánh Giá Sản Phẩm</h3>

                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                <i class="fas fa-minus"></i></button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fas fa-times"></i></button>
                        </div>
                    </div>
                    <div class="card-body" style="display: none;">
                        <div class="row">
                            <div class="col-12 col-md-12 col-lg-8 order-2 order-md-1">

                                <div class="row">
                                    <div class="col-12 col-md-12">
                                        ${proDetail.productDescription}
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->

            </section>
            <div class="col-12">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-info">
                            <div class="card-header">
                                <div class="card-title">
                                    Danh Sách Thông Số Sản Phẩm
                                </div>
                                <div class="card-tools">
                                    <div class="input-group input-group-sm" >
                                        <a href="editProPram.htm?productId=${proDetail.productId}" class="btn btn-sm btn-info">Cập nhật/Chỉnh sửa</a>                 
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                           
                                            <th>Tên Thông Số</th>
                                            <th>Giá Trị</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listProPram}" var="proPram" varStatus="itr">
                                            <c:if test="${!empty proPram.proDetailValue}">
                                                <tr>
                                                

                                                <td>${proPram.parameter.paramName}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${!empty proPram.proDetailValue}">
                                                            ${proPram.proDetailValue} 
                                                            <br />
                                                        </c:when>    
                                                        
                                                    </c:choose></td>



                                            </tr>
                                            </c:if>
                                            
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="Row">
                            <div class="col-12">
                                <div class="card card-info ">
                                    <div class="card-header">
                                        <div class="card-title">
                                            Quà Tặng Đi Kèm
                                        </div>
                                        <div class="card-tools">
                                            <div class="input-group input-group-sm" >
                                                <a href="editGiftPro.htm?productId=${proDetail.productId}" class="btn btn-sm btn-info">Cập nhật/Chỉnh sửa</a>                 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <c:forEach items="${listGiftPro}" var="giftPro">
                                            <p><i class="fas fa-gifts" style="color: red;margin: 0 20px 0 0;font-size: 20px"></i><span>${giftPro.gift.giftName}</span></p>
                                                </c:forEach>
                                    </div>

                                </div>
                            </div>
                            <div class="col-12">
                                <div class="card card-info ">
                                    <div class="card-header">
                                        <div class="card-title">
                                            Chính Sách Cho Sản Phẩm
                                        </div>
                                        <div class="card-tools">
                                            <div class="input-group input-group-sm" >
                                                <a href="editProPoli.htm?productId=${proDetail.productId}" class="btn btn-sm btn-info">Cập nhật/Chỉnh sửa</a>                 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <c:forEach items="${listProPolicy}" var="proPoli">
                                            <p><i class="fas fa-gifts" style="color: red;margin: 0 20px 0 0;font-size: 20px"></i><span>${proPoli.policy.policyName}</span></p>
                                                </c:forEach>
                                    </div>

                                </div>
                            </div>

                        </div>

                    </div>
                </div>

            </div>
            <section class="content col-6">

                <!-- Default box -->
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Bình Luận Khách Hàng: </h3>

                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                <i class="fas fa-minus"></i></button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fas fa-times"></i></button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 col-md-12 col-lg-12 order-2 order-md-1">

                                <div class="row">
                                    <div class="col-12">

                                        <c:forEach items="${listComment}" var="comment">

                                            <c:choose>
                                                <c:when test="${comment.parenId ==0}">
                                                    
                                                    <c:if test="${(map.get(comment.commentId)).size() ==0}">
                                                        <div class="post">
                                                            <div class="user-block">
                                                                <img class="img-circle img-bordered-sm" src="/Project_Shop_Computer_005/dist/img/user1-128x128.jpg" alt="user image">
                                                                <span class="username">
                                                                    <a href="#">${comment.userName}.</a>
                                                                </span>
                                                                <span class="description">${comment.email} - ${comment.created}</span>
                                                            </div>
                                                            <!-- /.user-block -->
                                                            <p>
                                                                ${comment.commentContent}
                                                            </p>

                                                            <div class="card card-default collapsed-card col-12">
                                                                <div class="card-header">
                                                                    <h5 class="card-title">Trả lời</h5>
                                                                    <div class="card-tools">
                                                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i></button>
                                                                        <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                                                                    </div>
                                                                </div>
                                                                <!-- /.card-header -->
                                                                <div class="card-body" style="display: none;">
                                                                    <f:form method="POST" action="upComment.htm" commandName="commentUp">
                                                                        <f:input type="hidden" path="products.productId" value="${proDetail.productId}"/>
                                                                        <f:input type="hidden" path="parenId" value="${comment.commentId}"/>
                                                                        <div class="form-group">
                                                                            <label for="exampleInputEmail1">Email address</label>
                                                                            <f:input type="text" class="form-control" path="commentContent" />
                                                                        </div>
                                                                        <button type="submit" class="btn btn-primary">Gửi</button>
                                                                    </f:form>
                                                                </div>                                                  
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${(map.get(comment.commentId)).size() >0}">
                                                        <div class="post" style="border-bottom: none;">
                                                            <div class="user-block">
                                                                <img class="img-circle img-bordered-sm" src="/Project_Shop_Computer_005/dist/img/user1-128x128.jpg" alt="user image">
                                                                <span class="username">
                                                                    <a href="#">${comment.userName}.</a>
                                                                </span>
                                                                <span class="description">${comment.email} - ${comment.created}</span>
                                                            </div>
                                                            <!-- /.user-block -->
                                                            <p>
                                                                ${comment.commentContent}
                                                            </p>

                                                           
                                                        </div>
                                                        <c:forEach items="${(map.get(comment.commentId))}" var="comment1">
                                                            <div class="post" style="margin-left: 50px">
                                                                <div class="user-block">
                                                                   
                                                                    <span class="username" style="margin-left: 0px">
                                                                        <a href="#">${comment1.userName}.</a>
                                                                    </span>
                                                                    <span class="description">${comment1.created}</span>
                                                                </div>
                                                                <!-- /.user-block -->
                                                                <p>
                                                                    ${comment1.commentContent}
                                                                </p>                                                               
                                                            </div>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:when>
                                            </c:choose>

                                        </c:forEach>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->

            </section>



        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

