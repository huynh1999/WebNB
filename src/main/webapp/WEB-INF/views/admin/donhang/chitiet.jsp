<%@include file="/common/taglib.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
    pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Quản lí đơn hàng</title>
		<link rel="stylesheet" href=" ${pageContext.request.contextPath}/template/css/chitiethoadon.css">
	</head>
	<body>
		<div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {}
                </script>
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="active">Quản lí đơn hàng</li>
                    <li class="active">Chi tiết hóa đơn</li>
                </ul><!-- /.breadcrumb -->
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Mã hóa đơn</label>
                        <div class="col-sm-9">
                            <input id="billCode" type="text" class="form-control" disabled />
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Khách hàng</label>
                        <div class="col-sm-9">
                            <input id="payer" type="text" class="form-control" disabled />
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Ngày mua</label>
                        <div class="col-sm-9">
                            <input type="text"  id="dateBuy" class="form-control"  disabled />
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Số điện thoại</label>
                        <div class="col-sm-9">
                            <input type="text" id="phone" class="form-control" disabled />
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Email</label>
                        <div class="col-sm-9">
                            <input type="text" id="email" class="form-control" disabled />
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Trạng thái</label>
                        <div class="col-sm-9">
                            <select name="" id="status">
                                <option value='0'>Đã tiếp nhận</option>
                                <option value='1'>Đã xác nhận đơn hàng</option>
                                <option value='2'>Đang vận chuyển</option>
                                <option value='3'>Giao hàng thành công</option>
                            </select>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Sản phẩm</label>
                        <div class="col-sm-9">
                            <div class="table-responsive">
                                <table class="table" id="listP">
                                    <tr>
                                        <th>Tên sản phẩm</th>
                                        <th>Size</th>
                                        <th>Số lượng</th>
                                        <th>Đơn vị giá</th>
                                    </tr>


                                </table>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script>
        window.onload=function () {
            $.getScript("/template/js/admin/bill.js");
        }
    </script>
	</body>

	</html>