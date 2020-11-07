<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="../dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Antomi</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">${userLogin}</a>
          <c:if test="${!empty userLogin}">
                <a href="<%=request.getContextPath()%>/userController/logout.htm">Logout</a>
          </c:if>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item ">
            <a href="<%=request.getContextPath()%>/adminController/admin.htm" class="nav-link ">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
             
              </p>
            </a>
            
          </li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/cateController/getAll.htm?page=1" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>Danh Mục</p>
            </a>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>Thương Hiệu<i class="fas fa-angle-left right"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/brandsController/getAll.htm?page=1" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Danh Sách Thương Hiệu</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>Quản Lý Quà Tặng<i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/giftController/getAll.htm?page=1" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Danh Sách-Thêm Mới</p>
                </a>
              </li> 
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tree"></i>
              <p>Quản Lý Chính Sách SP<i class="fas fa-angle-left right"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/policyController/getAll.htm?page=1" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Danh Sách-Thêm Mới</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>Thông Số Kỹ Thuật<i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/parameterController/getAll.htm?page=1" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Danh Sách-Thêm Mới</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>Quản Lý Sản Phẩm<i class="fas fa-angle-left right"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/proController/getAll.htm?page=1" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Danh Sách Sản Phẩm</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/proController/insertPro.htm" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Thêm Mới Sản Phẩm</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-header">Website</li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/bannerTypeController/getAll.htm?page=1" class="nav-link">
              <i class="nav-icon far fa-calendar-alt"></i>
              <p>Danh Mục Banner</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/cityController/getAll.htm?page=1" class="nav-link">
             
              <i class="nav-icon fas fa-map-marker-alt"></i>
              <p>Quản Lý Địa Điểm</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/bannerController/getAll.htm?page=1" class="nav-link">
              <i class="nav-icon far fa-image"></i><p>Quản Lý Banner</p>
            </a>
          </li>
          <li class="nav-item has-treeview">
            <a href="" class="nav-link">             
              <i class="nav-icon fas fa-clipboard"></i>
              <p>Chính Sách Cửa Hàng<i class="fas fa-angle-left right"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/typePsController/getAll.htm?page=1" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>DAnh Mục Chính Sách Của Hàng</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/policyStoreController/getAll.htm?page=1" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Chính Sách Cửa Hàng</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-store-alt"></i>
              <p>Quản Lý Cửa Hàng<i class="fas fa-angle-left right"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/storeController/getAll.htm?page=1" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Danh Sách Cửa Hàng</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/storeController/addStore.htm" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Thêm Cửa Hàng</p>
                </a>
              </li>             
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-list-alt"></i>
              <p>
                Quản Lý Đơn Hàng
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/orderController/getAll.htm?page=1" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Danh Sách Đơn Hàng</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="starter.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Starter Page</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="<%=request.getContextPath()%>/feedback/getAll.htm" class="nav-link">
           
              <i class="nav-icon fas fa-envelope"></i>
              <p>Đóng Góp Ý Kiến</p>
            </a>
           
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
