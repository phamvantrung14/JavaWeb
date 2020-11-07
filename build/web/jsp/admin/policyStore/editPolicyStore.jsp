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
            <h1>Policy Store Manager</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Policy Store Manager</li>
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
                <h3 class="card-title">Edit Policy Store!</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <f:form action="updatePolicyStore.htm" method="POST" commandName="editPs">
<!--              <form role="form">-->

                <div class="card-body">
                    <f:input path="policyStoreId" type="hidden"/>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Policy Name:</label>
                    <f:input path="psname" type="text"  class="form-control" id="exampleInputEmail1" placeholder="Enter Brand Name"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Content:</label>
                    <f:textarea path="pscontent" type="text" class="form-control" id="desId" placeholder="Enter Description"/>
                  </div>
                    <div class="form-group">
                        <label>Banner Type:</label>
                        <f:select class="custom-select" path="typePolicyStore.typePsid">
                            <c:forEach items="${listTypePs}" var="bnType">
                                <f:option value="${bnType.typePsid}">${bnType.typePsname}</f:option>
                            </c:forEach>
                        </f:select>
                      </div>
                   <div class="form-group">
                    <label for="exampleInputEmail1">Status:</label>
                    <div class="form-check">
                        <f:radiobutton path="psstatus" value="true"  class="form-check-input" checked="true" id="exampleInputEmail1"/>
                    <label class="form-check-label" for="exampleCheck1">Show Up</label>
                    <br>
                    <f:radiobutton path="psstatus" value="false"  class="form-check-input" id="exampleInputEmail1"/>
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
