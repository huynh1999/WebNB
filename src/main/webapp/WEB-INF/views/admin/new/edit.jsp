<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/taglib.jsp"%>


<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
</head>
<body>
<div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="active">Chỉnh sửa sản phẩm</li>
                </ul><!-- /.breadcrumb -->
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                            <form id="formSubmit">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Brand</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="categoryCode" name="categoryCode" multiple>
                                        </select>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Tên sản phẩm</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="name" name="name" value=""/>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Mô tả</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="shortDescription" name="shortDescription" value=""/>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Giá</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="price" name="price" value=""/>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Hình ảnh</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="img" name="anh" value="${model.anh}"/>
                                        <div class="row myanhnho" id="list_img">

                                        </div>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                            <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật" id="btnUpdate"/>
                                    </div>
                                </div>
                            </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        window.onload=function () {
            $.getScript("/template/js/admin/edit.js");
        }
    </script>
</body>
</html>
