<%@include file="/common/taglib.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
</head>
<body>
<div class="main-content">
      <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
          <ul class="breadcrumb">
            <li>
              <i class="ace-icon fa fa-home home-icon"></i>
              <a href="#">Trang chủ</a>
            </li>
            <li class="active">Upload ảnh</li>
          </ul>
        </div>
        <div class="page-content">
          <div class="row">
            <div class="col-xs-12">
              <form id="formSubmit" method="post" action="/admin/saveimgs" enctype="multipart/form-data">
                <div class="form-group">
                  <div class="col-sm-3" style="text-align: right;">
                    <input type="file" multiple="multiple" name="images" class="btn btn-white btn-warning btn-bold" value="Chọn ảnh"
                      id="btnuploadimage" />
                  </div>
                  <div class="col-sm-6">
                    <button type="submit" class="form-control" id="upanh" value="">Submit</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
  </div>
</body>
</html>
