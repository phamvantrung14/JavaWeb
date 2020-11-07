<%-- 
    Document   : CheckOut
    Created on : Oct 3, 2020, 10:17:46 PM
    Author     : asuspc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../fontend/layoutFontend/header.jsp"/> 

<div class="checkout_page_bg">
    <div class="container">
        <h3>${message}</h3>
        <a href="<%=request.getContextPath()%>/antomi/home.htm">Trang Chủ</a>
        </div>
    </div>

<jsp:include page="../fontend/layoutFontend/footer.jsp"/>
