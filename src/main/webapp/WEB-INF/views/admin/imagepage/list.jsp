<%@include file="/common/taglib.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
    pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Quản lí ảnh</title>
		<link rel="stylesheet" href=" ${pageContext.request.contextPath}/template/css/manageimage.css">

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
                        <li class="active">Manage Image</li>
                    </ul>
                    <!-- /.breadcrumb -->
                </div>
                <div class="page-content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="tapanh" id="list">

                            </div>
                            <div id="loadingGif" style="text-align: center">
                                <img src="/template/img/loading.gif">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
        <script>
            window.onload=function(){
                $.getScript("/template/js/admin/imgPage.js");
            }
        </script>
	</body>

	</html>