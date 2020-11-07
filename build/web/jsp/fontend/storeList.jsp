<%-- 
    Document   : storeList
    Created on : Nov 3, 2020, 3:09:51 PM
    Author     : asuspc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib prefix="mytag" uri="/WEB-INF/tlds/MyCustomTag" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../fontend/layoutFontend/header.jsp"/> 
<div class="breadcrumbs_area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                        <ul>
                            <li><a href="index.html">Trang Chủ</a></li>
                            <li>Cửa Hàng</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="account_page_bg">
        <div class="container">
            <section class="main_content_area">
                <div class="account_dashboard">
                    <div class="row">
                        <div class="col-sm-12 col-md-3 col-lg-3">
                           
                        </div>
                        <div class="col-sm-12 col-md-9 col-lg-9">
                            <!-- Tab panes -->
                            <div class="tab-content dashboard_content">
                                
                               
                                <div class="tab-pane fade active show" id="downloads">
                                    <h3>Cửa Hàng</h3>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Tên Cửa Hàng</th>
                                                    <th>Giờ Hoạt Động</th>
                                                    <th>Số Điện Thoại</th>
                                                    <th>Địa Chỉ</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listStore}" var="store">
                                                    <tr>
                                                        <td>${store.storeNames}</td>
                                                        <td>${store.openTime}</td>
                                                        <td><span class="danger">${store.storePhone}</span></td>
                                                        <td><a  class="view">${store.storeAddress}</a></td>
                                                    </tr>
                                                </c:forEach>
                                                
                                               
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>


<jsp:include page="../fontend/layoutFontend/footer.jsp"/>
