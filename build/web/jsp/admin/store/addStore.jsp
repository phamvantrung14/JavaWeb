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
                    <h1>Thêm Mới Cửa Hàng</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a >Trang Chủ</a></li>
                        <li class="breadcrumb-item ">Quản Lý Cửa Hàng</li>
                        <li class="breadcrumb-item active">Thêm Mới Cửa Hàng</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <div class="container-fluid">
        <div class="row">

            <div class="col-md-12">
                <!-- general form elements -->
                <div class="card card-info">
                    <div class="card-header">
                        <h3 class="card-title">Thêm Mới Cửa hàng!</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <f:form action="insertStore.htm" method="POST" commandName="storeNew">
                        <!--              <form role="form">-->
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">Tên Cửa Hàng:</label>
                                        <f:input path="storeNames" type="text" required="true"  class="form-control" id="exampleInputEmail1" placeholder="Enter Category Name"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Mã Cửa hàng:</label>
                                        <f:input path="storeCode" type="text" class="form-control" required="true"  placeholder="Enter Description"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label>Thành Phố:</label>
                                        <f:select class="custom-select" path="citys.cityId">
                                            <c:forEach items="${listCity}" var="city">
                                                <f:option value="${city.cityId}">${city.cityName}</f:option>
                                            </c:forEach>
                                        </f:select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Đại Chỉ:</label>
                                        <f:input path="storeAddress" type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter Store Address"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Số Điện Thoại:</label>
                                        <f:input path="storePhone" type="number" class="form-control" id="exampleInputPassword1" placeholder="Enter Store Phone"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Số Điện Thoại Bảo Hành:</label>
                                        <f:input path="guaranteePhone" type="number" class="form-control" id="exampleInputPassword1" placeholder="Enter Guarantee Phone"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Giờ Hoạt Động:</label>
                                        <f:input path="openTime" type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter Open Time"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputPassword1">Email:</label>
                                        <f:input path="storeEmail" type="Email" class="form-control" id="exampleInputPassword1" placeholder="Enter Open Time"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">Trạng Thái:</label>
                                        <div class="form-check">
                                            <f:radiobutton path="storeStatus" value="true"  class="form-check-input" checked="true" id="exampleInputEmail1"/>
                                            <label class="form-check-label" for="exampleCheck1">Show Up</label>
                                            <br>
                                            <f:radiobutton path="storeStatus" value="false"  class="form-check-input" id="exampleInputEmail1"/>
                                            <label class="form-check-label" for="exampleCheck1">Hidden</label>
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
                    </f:form>
                </div>
                <!-- /.card -->


            </div>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>
