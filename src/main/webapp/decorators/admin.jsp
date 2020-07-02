<%@ page import="online.newbrandshop.util.SecurityUtils" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin home</title>
	<link href="<c:url value='/template/assets/css/bootstrap.min.css' />"
		  rel="stylesheet" type="text/css">
	<link href="<c:url value='/template/assets/font-awesome/4.5.0/css/font-awesome.min.css' />"
		  rel="stylesheet" type="text/css">
	<script src="<c:url value='/template/assets/js/ace-extra.min.js' />"></script>
<%--	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">--%>
	<link rel="stylesheet" href="/template/assets/css/jquery-ui.css">
    <script src="<c:url value='/template/js/common/jquery.js' />"></script>
	<link href="<c:url value='/template/assets/css/ace.min.css' />"
		  rel="stylesheet" type="text/css">
	<script src="<c:url value='/template/assets/js/jquery.2.1.1.min.js' />"></script>
    <script src="/template/assets/js/jquery-ui.js"></script>
    <link rel="stylesheet" href=" ${pageContext.request.contextPath}/template/css/listsp.css">
    <link rel="stylesheet" href=" ${pageContext.request.contextPath}/template/css/edit.css">
    <script type="text/javascript" src="/template/js/common/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="/template/css/bootstrap-multiselect.css" type="text/css"/>
    <dec:head/>
</head>

<body class="no-skin">
	<!-- header  -->
    <div id="navbar" class="navbar navbar-default          ace-save-state">
        <div class="navbar-container ace-save-state" id="navbar-container">
            <div class="navbar-header pull-left">
                <a href="index.html" class="navbar-brand">
                    <small>
                        <i class="fa fa-leaf"></i>
                        Ace Admin
                    </small>
                </a>
            </div>
            <div class="navbar-buttons navbar-header pull-right" role="navigation">
                <ul class="nav ace-nav">
                    <li class="light-blue dropdown-modal">
                        <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                            Xin chào, <%=SecurityUtils.getPrincipal().getName()%>
                        </a>
                    <li class="light-blue dropdown-modal">
                        <a href="/logout">
                            <i class="ace-icon fa fa-power-off"></i>
                            Thoát
                        </a>
                    </li>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="main-container ace-save-state" id="main-container">
        <script type="text/javascript">
            try {
                ace.settings.loadState('main-container')
            } catch (e) {}
        </script>
        <!-- menu  -->
        <div id="sidebar" class="sidebar                  responsive                    ace-save-state">
            <script type="text/javascript">
                try {
                    ace.settings.loadState('sidebar')
                } catch (e) {}
            </script>
            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    <button class="btn btn-success">
                        <i class="ace-icon fa fa-signal"></i>
                    </button>

                    <button class="btn btn-info">
                        <i class="ace-icon fa fa-pencil"></i>
                    </button>

                    <button class="btn btn-warning">
                        <i class="ace-icon fa fa-users"></i>
                    </button>

                    <button class="btn btn-danger">
                        <i class="ace-icon fa fa-cogs"></i>
                    </button>
                </div>
                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>

                    <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span>

                    <span class="btn btn-danger"></span>
                </div>
            </div>
            <ul class="nav nav-list">
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-list"></i>
                        <span class="menu-text"> Quản lí sản phẩm </span>

                        <b class="arrow fa fa-angle-down"></b>
                    </a>
                    <b class="arrow"></b>

                    <ul class="submenu">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/list">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Danh sách sản phẩm
                            </a>

                            <b class="arrow"></b>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/admin/uploadedImage" class="dropdown-toggle">
                        <i class="menu-icon fa fa-list"></i>
                        <span class="menu-text"> Quản lí ảnh </span>

                        <b class="arrow fa fa-angle-down"></b>
                    </a>
                    <b class="arrow"></b>

                    <ul class="submenu">
                        <li>
                            <a href="/admin/uploadImage">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Upload ảnh
                            </a>

                            <b class="arrow"></b>
                        </li>
                        <li>
                            <a href="#">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Quản lí hình ảnh
                            </a>

                            <b class="arrow"></b>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/admin/uploadedImage" class="dropdown-toggle">
                        <i class="menu-icon fa fa-list"></i>
                        <span class="menu-text"> Quản lí menu </span>

                        <b class="arrow fa fa-angle-down"></b>
                    </a>
                    <b class="arrow"></b>

                    <ul class="submenu">
                        <li>
                            <a href="/admin/manageCategory">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Quản lí category
                            </a>

                            <b class="arrow"></b>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/admin/uploadedImage" class="dropdown-toggle">
                        <i class="menu-icon fa fa-list"></i>
                        <span class="menu-text"> Quản lí đơn hàng </span>

                        <b class="arrow fa fa-angle-down"></b>
                    </a>
                    <b class="arrow"></b>

                    <ul class="submenu">
                        <li>
                            <a href="/admin/manageBill">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Danh sách đơn hàng
                            </a>

                            <b class="arrow"></b>
                        </li>
                    </ul>
                    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
                        <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state"
                            data-icon1="ace-icon fa fa-angle-double-left"
                            data-icon2="ace-icon fa fa-angle-double-right"></i>
                    </div>
                </li>
            </ul>
        </div>
		<dec:body />
		<!-- footer  -->
        <div class="footer">
            <div class="footer-inner">
                <div class="footer-content">
                    <span class="bigger-120">
                        <span class="blue bolder">Ace</span>
                        Application &copy; 2013-2014
                    </span>

                    &nbsp; &nbsp;
                    <span class="action-buttons">
                        <a href="#">
                            <i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
                        </a>

                        <a href="#">
                            <i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
                        </a>

                        <a href="#">
                            <i class="ace-icon fa fa-rss-square orange bigger-150"></i>
                        </a>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <script src="<c:url value='/template/assets/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/jquery-ui.custom.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/jquery.ui.touch-punch.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/jquery.easypiechart.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/jquery.sparkline.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/jquery.flot.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/jquery.flot.pie.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/jquery.flot.resize.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/ace-elements.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/ace.min.js' />"></script>
    <script src="<c:url value='/template/assets/js/jquery-ui.min.js' />"></script>
    <script src="${pageContext.request.contextPath}/template/js/common/axios.js"></script>
</body>
</html>