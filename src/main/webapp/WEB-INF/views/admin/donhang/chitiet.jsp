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
                            <input type="text" class="form-control" value="${model.title}" disabled />
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Khách hàng</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" value="Huỳnh" disabled />
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Ngày mua</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" value="22/2/2020" disabled />
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Trạng thái</label>
                        <div class="col-sm-9">
                            <select name="" id="">
                                  <option value="">Đã giao</option>
                                  <option value="">Đã hủy</option>
                            </select>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Sản phẩm</label>
                        <div class="col-sm-9">
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th>Tên sản phẩm</th>
                                        <th>Size</th>
                                        <th>Số lượng</th>
                                        <th>Đơn vị giá</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="ttsanpham">
                                                <div class="anhsp">
                                                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Black_faced_cormorant.jpg/1200px-Black_faced_cormorant.jpg"
                                                        alt="">
                                                </div>
                                                <div class="tensp">áo nike</div>
                                            </div>

                                        </td>
                                        <td>S</td>
                                        <td>1</td>
                                        <td>100000</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="ttsanpham">
                                                <div class="anhsp">
                                                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Black_faced_cormorant.jpg/1200px-Black_faced_cormorant.jpg"
                                                        alt="">
                                                </div>
                                                <div class="tensp">quần adidas</div>
                                            </div>

                                        </td>
                                        <td>S</td>
                                        <td>1</td>
                                        <td>100000</td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th>Thành tiền</th>
                                        <th>200000</th>
                                    </tr>
                                </table>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
	</body>

	</html>