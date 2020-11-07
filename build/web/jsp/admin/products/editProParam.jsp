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
    <f:form action="updateProParam.htm" method="POST" enctype="multipart/form-data" commandName="editProParam">
        <div class="container-fluid">
            <div class="row">
                
                <div class="col-md-4">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Thêm Thông Số Sản Phẩm!</h3>
                        </div>
                        <div class="card-body">
                            <c:forEach items="${editProParam}" var="prm">
                                <div class="form-group">
                                    <label>${prm.parameter.paramName}</label>
                                   
                                    <input type="hidden" name="productId" value="${prm.products.productId}"/>
                                    <input type="hidden" name="productName" value="${prm.products.productName}"/>
                                    <input type="hidden" name="paramId" value="${prm.parameter.paramId}"/>                                                                      
                                    <input class="form-control"  type="text" name="proPramValue" value="${prm.proDetailValue}" />
                                </div>
                            </c:forEach>
                        </div>
                         <div class="card-footer">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>   
                </div> 
            </div>
        </div>
    </f:form>

</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

