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
                            <form action="/admin/uploadImgFromEdit" method="post" id="formSubmit" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Active</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="active" name="active">
                                            <option value="0">Deactive</option>
                                            <option value="1">Active</option>
                                        </select>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Brand</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="categoryCode" name="categoryCode" multiple>
                                        </select>
                                    </div>
                                </div>
                                <input id="id" name="id" hidden>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Tên sản phẩm</label>
                                    <div class="col-sm-9">
                                        <input required type="text" class="form-control" id="name" name="name" value=""/>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Mô tả</label>
                                    <div class="col-sm-9">
                                        <input type="text" required class="form-control" id="shortDescription" name="shortDescription" value=""/>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Giá</label>
                                    <div class="col-sm-9">
                                        <input type="text" required class="form-control" id="price" name="price" value=""/>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Size</label>
                                 	<div class="col-sm-9" style="padding-left:12px">
                                    <table style="width:60%;" class="table table-bordered table-responsive-md table-striped text-center">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Size</th>
                                            <th class="text-center">Số Lượng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="pt-3-half" contenteditable="false">XS</td>
                                            <td class="pt-3-half" contenteditable="true" id="XS"></td>
                                        </tr>
                                        <tr>
                                            <td class="pt-3-half" contenteditable="false">XL</td>
                                            <td class="pt-3-half" contenteditable="true" id="XL"></td>
                                        </tr>
                                        <tr>
                                            <td class="pt-3-half" contenteditable="false">2XL</td>
                                            <td class="pt-3-half" contenteditable="true" id="2XL"></td>
                                        </tr>
                                        <tr>
                                            <td class="pt-3-half" contenteditable="false">L</td>
                                            <td class="pt-3-half" contenteditable="true" id="L"></td>
                                        </tr>
                                        <tr>
                                            <td class="pt-3-half" contenteditable="false">M</td>
                                            <td class="pt-3-half" contenteditable="true" id="M"></td>
                                        </tr>
                                        <tr>
                                            <td class="pt-3-half" contenteditable="false">S</td>
                                            <td class="pt-3-half" contenteditable="true" id="S"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Hình ảnh</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="img" name="anh" value="${model.anh}"/>
                                        <div class="row myanhnho" id="list_img" style="padding-left: 10px; padding-right: 12px;">

                                        </div>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Thêm mới Hình ảnh</label>
                                    <div class="col-sm-9">
                                        <input type="file" multiple="multiple" class="form-control" id="images" name="images"/>
                                        <div class="row myanhnho" id="list_img_new">

                                        </div>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                            <input type="button" class="btn btn-warning btn-bold" value="Cập nhật" id="btnUpdate"/>
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
