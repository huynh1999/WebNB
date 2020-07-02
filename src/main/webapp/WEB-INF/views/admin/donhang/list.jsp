<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new"/>
<c:url var ="NewURL" value="/admin-new"/>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
    pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Quản lí đơn hàng</title>
	</head>

	<body>
		<div class="main-content">
        <form>
            <div class="main-content-inner">
                <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="#">Trang chủ</a>
                        </li>
                        <li class="active">Quản lí đơn hàng</li>
                    </ul>
                    <!-- /.breadcrumb -->
                </div>
                <div class="page-content">
                <div class="col-xs-12">
                <div class="row" style="display: flex; width: fit-content; justify-content: space-between;">
                
                        <div class="col-2 ">
                            <select class="form-control" name="categoryCode">
                            	<option>Đã hủy</option>
                            	<option>Đã giao</option>	
                            </select>
                        </div>
                        <div class="col-1 mycol2" style="text-align: left;">
                            <button type="button" id="btn_search" class="btn btn-warning">Lọc</button>
                        </div>
</div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Mã hóa đơn</th>
                                                    <th>Người mua</th>
                                                    <th>Ngày mua</th>
                                                    <th>Trạng thái</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>ma1</td>
                                                    <td>huynh</td>
                                                    <td>31/4/2020</td>
                                                    <td>
                                                        đã giao
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                                            title="Chi tiết hóa đơn" href=""><i
                                                                class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ma2</td>
                                                    <td>nghia</td>
                                                    <td>31/4/2020</td>
                                                    <td>
                                                        đã hủy
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                                            title="Chi tiết hóa đơn" href=""><i
                                                                class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                        </a>
                                                    </td>
                                                </tr>
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
        </form>
    </div>
	</body>

	</html>