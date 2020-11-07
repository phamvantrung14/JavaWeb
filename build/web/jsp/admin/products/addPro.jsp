<%-- 
    Document   : addPro
    Created on : Sep 12, 2020, 3:45:10 PM
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
    <f:form action="insertProduct.htm" method="POST" enctype="multipart/form-data" commandName="proNew">

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8">
                    <!-- general form elements -->
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">Thêm Mới Sản Phẩm!</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->

                        <!--              <form role="form">-->
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">Tên Sản phẩm:</label>
                                        <f:input path="productName" type="text"  class="form-control" id="exampleInputEmail1" required="true" placeholder="Nhập Tên Sản Phẩm"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Mã Sản Phẩm:</label>
                                        <f:input path="productCode" type="text" class="form-control" required="true"  placeholder="Nhập Mã Sản Phẩm"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label>Hãng:</label>
                                        <f:select class="custom-select" path="brands.brandId">
                                            <c:forEach items="${listBrand}" var="brand">
                                                <f:option value="${brand.brandId}">
                                                    
                                                    ${brand.brandName}</f:option>
                                            </c:forEach>
                                        </f:select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Thể Loại:</label>
                                        <f:select class="custom-select" path="categories.catId">
                                            <c:forEach items="${listCate}" var="cate">
                                                <f:option value="${cate.catId}">
                                                    <c:forEach items="${listParent}" var="parent">
                                                        <c:if test="${cate.parentId==parent.catId}">
                                                            ${parent.catName}
                                                        </c:if>
                                                    </c:forEach>
                                                    -${cate.catName}</f:option>
                                            </c:forEach>
                                        </f:select>
                                    </div>

                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Giá Bán:</label>
                                        <f:input path="price" type="number" class="form-control" id="exampleInputPassword1" required="true" placeholder="Nhập Giá Bán Sản Phẩm"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Giảm Giá(%):</label>
                                        <f:input path="discount" type="number" class="form-control" value="0" id="exampleInputPassword1" placeholder="Nhập % Giảm Giá"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Ngày tạo:</label>
                                        <f:input path="created" type="date" class="form-control" id="exampleInputPassword1" placeholder="Nhập Ngày Tạo"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Mức Độ:</label>
                                        <f:select class="custom-select" path="productHot">
                                            <f:option value="1">Sản Phẩm Hot</f:option>
                                            <f:option value="2">Sản Phẩm Bán Chạy</f:option>
                                            <f:option value="3">Sản Phẩm Thường</f:option>
                                        </f:select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Tiêu Đề Sản Phẩm:</label>
                                        <f:input path="title" type="text" class="form-control" id="exampleInputPassword1" placeholder="Nhập Tiêu Đề Sản Phẩm"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Lượt Xem:</label>
                                        <f:input path="productView" type="number" class="form-control" id="exampleInputPassword1" placeholder="Nhập Số Lượt Xem Bắt Đầu"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputFile">Ảnh Đại Diện</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" name="imageAvatar"  class="custom-file-input" id="exampleInputFile"/>
                                                <label class="custom-file-label" for="exampleInputFile">Chọn file</label>
                                            </div>
                                            <div class="input-group-append">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputFile">Ảnh Chi Tiết Sản Phẩm</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" name="listImages" multiple="multiple"  class="custom-file-input" id="exampleInputFile"/>
                                                <label class="custom-file-label" for="exampleInputFile">Chọn file</label>
                                            </div>
                                            <div class="input-group-append">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label for="exampleInputPassword1">Mô Tả Sản Phẩm:</label>
                                        <f:textarea path="productDescription" type="text" class="form-control" id="desId" placeholder="Enter Open Time"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">Trạng Thái:</label>
                                        <div class="form-check">
                                            <f:radiobutton path="productStatus" value="true"  class="form-check-input" checked="true" id="exampleInputEmail1"/>
                                            <label class="form-check-label" for="exampleCheck1">Hiện</label>
                                            <br>
                                            <f:radiobutton path="productStatus" value="false"  class="form-check-input" id="exampleInputEmail1"/>
                                            <label class="form-check-label" for="exampleCheck1">Ẩn</label>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                        </div>
                        <!-- /.card-body -->

                        <div class="card-footer">
                            <button type="submit" class="btn btn-info">Thêm Mới</button>
                        </div>
                        <!--</form>-->

                    </div>

                    <div class="row">                   
                        <div class="col-md-12">
                            <div class="card card-info">
                                <div class="card-header">
                                    <h3 class="card-title">Chính Sách Sản Phẩm!</h3>
                                </div>
                                <div class="card-body">
                                    <c:forEach items="${listPoli}" var="poli">
                                        <div class="form-check">
                                            <input class="form-check-input" name="poliIds" value="${poli.policyId}" type="checkbox">
                                            <label class="form-check-label">${poli.policyName}</label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>   
                        </div>  
                        <div class="col-md-12">
                            <div class="card card-info">
                                <div class="card-header">
                                    <h3 class="card-title">Quà Tặng Sản Phẩm!</h3>
                                </div>
                                  <div class="card-body">
                                    <c:forEach items="${listGift}" var="gift">
                                        <div class="form-check">
                                            <input class="form-check-input" Name="giftIds" value="${gift.giftId}"  type="checkbox">
                                            <label class="form-check-label">${gift.giftName} <span style="color: red"><fmt:formatNumber>${gift.giftValue}</fmt:formatNumber> VNĐ </span></label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>   
                        </div>
                    </div> 
                    <!-- /.card -->
                </div>
                <div class="col-md-4">
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">Thêm Thông Số Sản Phẩm!</h3>
                        </div>
                        <div class="card-body">
                            <c:forEach items="${listPara}" var="prm">
                                <div class="form-group">
                                    <label>${prm.paramName}</label>
                                    <input type="hidden" name="paramId" value="${prm.paramId}"/>                                                                      
                                    <input class="form-control"  type="text" name="proDetailValue"/>
                                </div>
                            </c:forEach>
                        </div>
                    </div>   
                </div>




            </div>
        </div>
    </f:form>

</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

