<%-- 
    Document   : listCate
    Created on : Aug 22, 2020, 4:52:21 PM
    Author     : asuspc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<jsp:include page="../layout/header.jsp"/>
<div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Banner Manager</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Banner Manager</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Edit Banner!</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <f:form action="updateBanner.htm" method="POST" commandName="bannerEdit" enctype="multipart/form-data">
<!--              <form role="form">-->
                    <f:input type="hidden" path="bannerId"/>
               <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Banner Name:</label>
                    <f:input path="bannerName" type="text"  class="form-control" id="exampleInputEmail1" placeholder="Enter Category Name"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Banner Link:</label>
                    <f:input path="bannerLink" type="text" class="form-control"  placeholder="Enter Description"/>
                  </div>
                   <div class="form-group">
                    <label for="exampleInputPassword1">Priority:</label>
                    <f:input path="priovity" type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter Priority"/>
                  </div>
                  
                  <div class="form-group">
                        <label>Banner Type:</label>
                        <f:select class="custom-select" path="bannerType.bannerTypeId">
                            <c:forEach items="${bannerType}" var="bnType">
                                <f:option value="${bnType.bannerTypeId}">${bnType.bannerTypeName}</f:option>
                            </c:forEach>
                        </f:select>
                      </div>
                  <div class="form-group">
                    <label for="exampleInputFile">File Images</label>
                    <div class="input-group">
                      <div class="custom-file">
                          <input type="file" name="imageBanner"  class="custom-file-input" id="exampleInputFile"/>
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text" id="">Upload</span>
                      </div>
                    </div>
                  </div>
                   <div class="form-group">
                    <label for="exampleInputEmail1">Status:</label>
                    <div class="form-check">
                        <f:radiobutton path="bannerStatus" value="true"  class="form-check-input" checked="true" id="exampleInputEmail1"/>
                    <label class="form-check-label" for="exampleCheck1">Show Up</label>
                    <br>
                    <f:radiobutton path="bannerStatus" value="false"  class="form-check-input" id="exampleInputEmail1"/>
                    <label class="form-check-label" for="exampleCheck1">Hidden</label>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Update</button>
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
