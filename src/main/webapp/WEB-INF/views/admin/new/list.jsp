<%@include file="/common/taglib.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
    pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách sản phẩm</title>
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
                    </ul>
                    <!-- /.breadcrumb -->
                </div>
                <div class="page-content">
                	<div class="row" style="display: flex; width: 250px; justify-content: center;">
                        <div class="col-2 ">
                            <select class="form-control" id="categoryCode" name="categoryCode">
                            </select>
                        </div>
                        <div class="col-1 mycol2" style="text-align: left;">
                            <button type="button" id="btn_search" class="btn btn-warning">Lọc</button>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="widget-box table-filter">
                                <div class="table-btn-controls">
                                    <div class="pull-right tableTools-container">
                                        <div class="dt-buttons btn-overlap btn-group">
                                            <a flag="info"
                                                class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                                                data-toggle="tooltip" title='Thêm sản phẩm' href="/admin/AddNewProduct">
                                                <span>
                                                    <i class="fa fa-plus-circle bigger-110 purple"></i>
                                                </span>
                                            </a>
                                            <button id="btnDelete" type="button"
                                                class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                data-toggle="tooltip" title='Xóa sản phẩm'>
                                                <span>
                                                    <i class="fa fa-trash-o bigger-110 pink"></i>
                                                </span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="table-responsive">
                                        <table id="table" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th style="width: 100px">Id Product</th>
                                                    <th style="width: 250px">Tên sản phẩm</th>
                                                    <th >Mô tả</th>
                                                    <th style="width: 60px">Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodyList">

                                            </tbody>
                                        </table>
                                        <ul class="pagination" id="pagination"></ul>
                                        <input type="hidden" value="" id="page" name="page" />
                                        <input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
                                        <input type="hidden" value="" id="sortName" name="sortName" />
                                        <input type="hidden" value="" id="sortBy" name="sortBy" />
                                        <input type="hidden" value="" id="type" name="type" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <script>
        window.onload=function () {
            $.getScript("/template/js/admin/ListProduct.js")
        }
    </script>
	</body>

	</html>