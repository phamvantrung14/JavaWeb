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
                        <li class="breadcrumb-item"><a href="#">Trang Chủ</a></li>
                        <li class="breadcrumb-item active">Quản Lý Sản Phẩm</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8">
                    <!-- general form elements -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Chính Sách Sản Phẩm!!</h3>
                        </div>
                        <f:form action="updateProPoli.htm" method="POST">
                            <div class="card-body">
                                <input type="hidden" name="productId" value="${pro.productId}"/>
                                <c:forEach items="${listPoli}" var="poli">
                                   
                                    <div class="form-check">
                                        
                                        <input class="form-check-input" Name="policyIds" value="${poli.policyId}"  type="checkbox">
                                        <label class="form-check-label">${poli.policyName} </label>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Cập nhật</button>
                            </div>
                        </f:form>
                    </div> 

                </div>
                <!-- /.card-header -->
                <!-- form start -->

                <!--              <form role="form">-->



                <!--</form>-->

            </div>


            <!-- /.card -->
        </div>






    </div>


</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

