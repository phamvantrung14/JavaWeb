<%-- 
    Document   : lienHe
    Created on : Sep 22, 2020, 2:02:46 PM
    Author     : asuspc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../fontend/layoutFontend/header.jsp"/>  


<div id="warranty-page" style="margin-top: 30px;margin-bottom: 30px">
    <div class="warranty-container" style="background: #fff;padding: 30px !important;box-shadow: 0px 0px 1px 0 rgba(0,0,0,.25);">
        <div style="text-align:center;margin-bottom: 20px">
            <h1 style="font-size: 24px;text-transform: uppercase;">Thắc mắc, góp ý với ANTOMI</h1>
            <div style="width:400px;border-top:solid 1px #ddd; margin:10px auto;"></div>
        </div>
        <div class="account_form login" style="margin-bottom: 30px">

            <div class="clear"></div>
            <style type="text/css">
                .require { font-weight:bold; color:#F00}
            </style>
            <p style="text-align: center">Mọi thắc mắc hoặc góp ý, quý khách vui lòng liên hệ trực tiếp với bộ phận chăm sóc khách hàng của chúng tôi bằng cách điền đầy đủ thông tin vào form bên dưới</p>
            <f:form method="post" enctype="multipart/form-data" action="lienHeSave.htm" commandName="fBNew" style="width: 640px;margin: auto;text-align: center;">
                <p>
                    <f:input type="text" path="fullName" size="50"  placeholder="Họ và tên (bắt buộc)" class="khaipv-input"/>
                </p>
                <p>
                    <f:input type="email" path="email" size="50" placeholder="Email (bắt buộc)" class="khaipv-input"/>
                </p>
                <p>
                    <f:input type="text" path="phoneNumber" size="50" placeholder="Số điện thoại" class="khaipv-input"/>
                </p>
                <p>
                    <f:textarea rows="8" path="fbcontents" placeholder="Nội dung thắc mắc, góp ý của quý khách" style="width:100%;border: 1px solid #ebebeb;" class="khaipv-textarea"></f:textarea>
                </p>
             
                <p>
                    <button class="submit-button"  style="cursor:pointer;">Gửi</button>
                </p>
                <f:input type="hidden" path="fbstatus" value="false" name="action"/>
                
               
            </f:form>


        </div><!--float:left-->

    </div>
</div>


<jsp:include page="../fontend/layoutFontend/footer.jsp"/>