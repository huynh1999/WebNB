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
                    <form id="formSubmit" action="/admin/AddNewProduct" method="post" enctype="multipart/form-data">
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
                                <input type="text" required class="form-control" id="title" name="title"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Mô tả</label>
                            <div class="col-sm-9">
                                <input type="text" required class="form-control" id="shortDescription" name="shortDescription"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Giá</label>
                            <div class="col-sm-9">
                                <input type="text" required class="form-control" id="price" name="price"/>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Size</label>
                            <table style="width: 60%;" class="table table-bordered table-responsive-md table-striped text-center">
                                <thead>
                                <tr>
                                    <th class="text-center">Size</th>
                                    <th class="text-center">Số Lượng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="pt-3-half" contenteditable="false">XS</td>
                                    <td class="pt-3-half" contenteditable="true" id="XS">0</td>
                                </tr>
                                <tr>
                                    <td class="pt-3-half" contenteditable="false">XL</td>
                                    <td class="pt-3-half" contenteditable="true" id="XL">0</td>
                                </tr>
                                <tr>
                                    <td class="pt-3-half" contenteditable="false">2XL</td>
                                    <td class="pt-3-half" contenteditable="true" id="2XL">0</td>
                                </tr>
                                <tr>
                                    <td class="pt-3-half" contenteditable="false">L</td>
                                    <td class="pt-3-half" contenteditable="true" id="L">0</td>
                                </tr>
                                <tr>
                                    <td class="pt-3-half" contenteditable="false">M</td>
                                    <td class="pt-3-half" contenteditable="true" id="M">0</td>
                                </tr>
                                <tr>
                                    <td class="pt-3-half" contenteditable="false">S</td>
                                    <td class="pt-3-half" contenteditable="true" id="S">0</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Hình ảnh</label>
                            <div class="col-sm-9">
                                <input type="file" multiple="multiple" class="form-control" id="images" name="images"/>
                                <div class="row myanhnho" id="list_img">

                                </div>
                            </div>
                        </div>
                        <input id="sizeText" hidden>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="submit" class="btn btn-white btn-warning btn-bold" value="Thêm sản phẩm" id="btnAdd"/>
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
        $.getScript("/template/js/admin/addnew.js");
    }
</script>
</body>
</html>
