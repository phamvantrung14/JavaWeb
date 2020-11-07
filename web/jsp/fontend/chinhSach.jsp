<%-- 
    Document   : chinhSach
    Created on : Sep 22, 2020, 11:28:50 PM
    Author     : asuspc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../fontend/layoutFontend/header.jsp"/>  

<div class="about_bg_area">
        <div class="container">
            ${poliStore.pscontent}
        </div>
    </div>
<jsp:include page="../fontend/layoutFontend/footer.jsp"/>
