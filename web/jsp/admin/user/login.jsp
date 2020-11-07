<%-- 
    Document   : login
    Created on : Sep 23, 2020, 1:31:48 PM
    Author     : asuspc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layout/head.jsp"/>
    </head>
    <body class="login-page" style="min-height: 510.602px;">
        <div class="login-box">
            <div class="login-logo">
                <a href="../../index2.html"><b>Admin</b></a>
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">Đăng Nhập Vào Trang Quản Lý</p>

                    <form action="<%=request.getContextPath()%>/userController/loginUser.htm" method="post">
                        <div class="input-group mb-3">
                            <input type="email" class="form-control" name="email" placeholder="Email">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" name="pass" placeholder="Password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="icheck-primary">
                                  
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-4">
                                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>

                    
                    <!-- /.social-auth-links -->

<!--                    <p class="mb-1">
                        <a href="forgostPassword.htm">I forgot my password</a>
                    </p>
                    <p class="mb-0">
                        <a href="register.htm" class="text-center">Register a new membership</a>
                    </p>-->
                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <jsp:include page="../layout/script.jsp"></jsp:include>
