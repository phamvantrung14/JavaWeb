<%-- 
    Document   : register
    Created on : Sep 23, 2020, 1:39:58 PM
    Author     : asuspc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layout/head.jsp"/>
    </head>
    <body class="login-page" style="min-height: 510.602px;">
        <div class="register-box">
            <div class="register-logo">
                <a href="../../index2.html"><b>Admin</b>LTE</a>
            </div>

            <div class="card">
                <div class="card-body register-card-body">
                    <p class="login-box-msg">Register a new membership</p>

                    <f:form action="addUser.htm" method="post" commandName="userNew">
                        <div class="input-group mb-3">
                            <f:input type="text" class="form-control" path="userId" placeholder="User ID"/>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                              <div class="input-group mb-3">
                            <f:input type="text" class="form-control" path="userName" placeholder="Full name"/>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <f:input type="email" class="form-control" path="userEmail" placeholder="Email"/>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <f:input type="password" class="form-control" path="password" placeholder="Password"/>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                            <div class="input-group mb-3">
                                <f:select type="password" class="form-control" path="citys.cityId" placeholder="Password">
                                    <c:forEach items="${listCity}" var="city">
                                        <f:option value="${city.cityId}">${city.cityName}</f:option>
                                    </c:forEach>
                                </f:select>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <f:input type="text" class="form-control"path="userAddress" placeholder="Retype password"/>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="icheck-primary">
                                    <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                                    <label for="agreeTerms">
                                        I agree to the <a href="#">terms</a>
                                    </label>
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-4">
                                <button type="submit" class="btn btn-primary btn-block">Register</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </f:form>

                    <div class="social-auth-links text-center">
                        
                    </div>

                    <a href="login.htm" class="text-center">I already have a membership</a>
                </div>
                <!-- /.form-box -->
            </div><!-- /.card -->
        </div>
        <jsp:include page="../layout/script.jsp"></jsp:include>
