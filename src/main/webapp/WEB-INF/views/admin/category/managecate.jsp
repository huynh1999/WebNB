<%@include file="/common/taglib.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
    pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Quản lí category</title>
		<style>
        .dropdown-submenu {
            position: relative;
            text-align: center;
        }

        .dropdown-submenu .dropdown-menu {
            top: 0;
            left: 100%;
            margin-top: -1px;
            width: fit-content;
            text-align: center;
        }
        .myborder{
            border-left: 2px inset rgb(248, 246, 246);
        }
    </style>
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
                    <li class="active">Manage category</li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
            <div class="page-content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 myborder">
                            <!-- <div class="lopong">
                        <div class="btn-group-vertical">
                            <button type="button" class="btn btn-primary">Ông 1</button>
                            <div class="lopcha">
                                <div class="btn-group-vertical">
                                    <button type="button" class="btn btn-primary">Cha 1</button>
                                    <button type="button" class="btn btn-primary">Cha 2</button>
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary">Samsung</button>
                            <button type="button" class="btn btn-primary">Sony</button>
                          </div>
                    </div> -->
                            <div class="sidebar responsive ace-save-state">
                                <ul class="nav nav-list" id="listMenuType">

                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 myborder">
                            <form action="#">
                                <h3>Add type</h3>
                                <label for="tentype">Tên type</label>
                                <br>
                                <input name="nametype" id="nametype" type="text">
                                <br>
                                <button id="btn_addtype" type="button" class="btn btn-warning">Thêm</button>
                            </form>
                            <br>
                            <form action="#">
                                <h3>Add New Category Code</h3>
                                <label for="">Category Code</label>
                                <br>
                                <input name="categoryCode" id="addCategoryCode" type="text">
                                <br>
                                <button type="button" id="btn_addCategoryCode" class="btn btn-warning">Thêm</button>
                            </form>
                        </div>
                        <div class="col-lg-3 myborder">
                            <form action="#">
                                <h3>Add Menu</h3>
                                <label for="sel1">Chọn type:</label>
                                <select class="form-control" id="TypeMenuForm" name="sellist1">
                                </select>
                                <label for="tencategory">Tên category</label><br>
                                <input name="tencategory" id="nameMenu" type="text"><br>
                                <label for="categorycode">Category code</label><br>
                                <select class="form-control" id="CategoryCodeMenuForm" name="sellist">
                                </select>
                                <br>
                                <button type="button" id="btn_addMenu" class="btn btn-warning">Thêm</button>
                            </form>
                        </div>
                        <div class="col-lg-3 myborder">
                            <form id="xoatypecate" action="#">
                                <h3>Xóa</h3>
                                <div class="form-check-inline">
                                    <label class="form-check-label" for="radio1">
                                        <input type="radio" class="form-check-input" id="radio1" name="optradio"
                                            value="option1" checked>Type
                                    </label>
                                </div>
                                <div class="form-check-inline">
                                    <label class="form-check-label" for="radio2">
                                        <input type="radio" class="form-check-input" id="radio2" name="optradio"
                                            value="option1">Menu
                                    </label>
                                </div>
                                <div class="del-type">
                                    <label for="typeOfDelete">Type:</label>
                                    <select class="form-control" id="typeOfDelete" name="typeOfDelete">

                                    </select>
                                </div>

                                <div class="del-cate" style="display: none;">
                                    <label for="categoryOfDelete">Menu:</label>
                                    <select class="form-control" id="categoryOfDelete" name="categoryOfDelete">
                                    </select>
                                </div>
                                <br>
                                <button type="button" id="deleteBtn" class="btn btn-warning">Xóa</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        window.onload=function () {
            $.getScript("/template/js/admin/manageCategory.js");
        }
    </script>
	</body>

	</html>