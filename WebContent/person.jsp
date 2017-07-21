<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Dashboard</title>
        <!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Force IE9 to render in normal mode -->
        <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
        <meta name="author" content="SuggeElson" />
        <meta name="description" content=""
        />
        <meta name="keywords" content=""
        />
        <meta name="application-name" content="sprFlat admin template" />
        <!-- Import google fonts - Heading first/ text second -->
        <link rel='stylesheet' type='text/css' />
        <!-- Css files -->
        <!-- Icons -->
        <link href="assets/css/icons.css" rel="stylesheet" />
        <!-- jQueryUI -->
        <link href="assets/css/sprflat-theme/jquery.ui.all.css" rel="stylesheet" />
        <!-- Bootstrap stylesheets (included template modifications) -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- Plugins stylesheets (all plugin custom css) -->
        <link href="assets/css/plugins.css" rel="stylesheet" />
        <!-- Main stylesheets (template main css file) -->
        <link href="assets/css/main.css" rel="stylesheet" />
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <link href="assets/css/custom.css" rel="stylesheet" />
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/img/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/img/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/img/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/img/ico/apple-touch-icon-57-precomposed.png">
        <link rel="icon" href="assets/img/ico/favicon.ico" type="image/png">
        <!-- Windows8 touch icon ( http://www.buildmypinnedsite.com/ )-->
        <meta name="msapplication-TileColor" content="#3399cc" />
	    <!-- jQuery Js -->
	    <script src="assets/js/jquery-1.10.2.js"></script>
	    <script type="text/javascript" src="assets/ajax_js/base.js"></script>
	    <script type="text/javascript" src="assets/ajax_js/person.js"></script>
    </head>
    <body>
        <!-- Start #header -->
        <div id="header">
            <div class="container-fluid">
                <div class="navbar">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="person.jsp">
                            <i class="im-windows8 text-logo-element animated bounceIn"></i><span class="text-logo">案例</span><span class="text-slogan">系统</span>
                        </a>
                    </div>
                    <nav class="top-nav" role="navigation">
                        <ul class="nav navbar-nav pull-right">
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown">
                                    SuggeElson</a>
                                <ul class="dropdown-menu right" role="menu">
                                    <li><a href="#"><i class="st-settings"></i> 个人设置</a>
                                    </li>
                                    <li><a href="login.jsp"><i class="im-exit"></i> 退出</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- Start #header-area -->
                <!-- End #header-area -->
            </div>
            <!-- Start .header-inner -->
        </div>
        <!-- End #header -->
        <!-- Start #sidebar -->
        <div id="sidebar">
            <!-- Start .sidebar-inner -->
            <div class="sidebar-inner">
                <!-- Start #sideNav -->
                <ul id="sideNav" class="nav nav-pills nav-stacked">
                    <li><a href="person.jsp">人员管理 <i class="im-table"></i></a>
                    </li>
                    <li><a href="group.jsp">分组管理 <i class="im-screen"></i></a>
                    </li>
                    <li><a href="script.jsp">案例管理 <i class="en-upload"></i></a>
                    </li>
                    <li><a href="execute.jsp">运行记录 <i class="im-table2"></i></a>
                    </li>
                    <li><a href="history.jsp">登录记录 <i class="im-paragraph-justify"></i></a>
                    </li>
                <!-- End #sideNav -->
            </div>
            <!-- End .sidebar-inner -->
        </div>
        <!-- End #sidebar -->
        <!-- Start #content -->
        <div id="content">
            <!-- Start .content-wrapper -->
            <div class="content-wrapper">
                <div class="row">
                    <!-- Start .row -->
                    <!-- Start .page-header -->
                    <div class="col-lg-12 heading">
                        <h1 class="page-header"><i class="im-table2"></i> 测试员管理</h1>
                        <!-- Start .bredcrumb -->
                        <ul id="crumb" class="breadcrumb">
                        </ul>
                        <!-- End .breadcrumb -->
                        <!-- Start .option-buttons -->
                        <div class="option-buttons">
                            <div class="btn-toolbar" role="toolbar">
                                <div class="btn-group">
                                    <a id="clear-localstorage" class="btn tip" title="Reset panels position" onclick="refush()">
                                        <i class="ec-refresh color-red s24"></i>
                                    </a>
                                </div>
                                <div class="btn-group dropdown">
                                    <a class="btn dropdown-toggle" data-toggle="dropdown" id="dropdownMenu2"><i class="ec-pencil s24"></i></a> 
                                    <div class="dropdown-menu pull-right" role="menu" aria-labelledby="dropdownMenu2">
                                        <div class="option-dropdown">
                                            <div class="row">
                                                <p class="col-lg-12">添加/编辑</p>
                                                <form id="person_edit" class="form-horizontal" onsubmit="return edit();">
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <input type="text" name="id" class="form-control" placeholder="若编辑，输入序号">
                                                        </div>
                                                    </div>
                                                    <!-- End .form-group  -->
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <textarea name="login_name" class="form-control wysiwyg" placeholder="登录帐号"></textarea>
                                                        </div>
                                                    </div>
                                                    <!-- End .form-group  -->
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <input name="password" type="text" class="form-control tags1" placeholder="密码">
                                                        </div>
                                                    </div>
                                                    <!-- End .form-group  -->
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <textarea name="username" class="form-control wysiwyg" placeholder="姓名"></textarea>
                                                        </div>
                                                    </div>
                                                    <!-- End .form-group  -->
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <input type="text" name="phone" class="form-control tags1" placeholder="联系方式">
                                                        </div>
                                                    </div>
                                                    <!-- End .form-group  -->
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <button class="btn btn-success btn-xs pull-right">添加</button>
                                                        </div>
                                                    </div>
                                                    <!-- End .form-group  -->
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End .option-buttons -->
                    </div>
                    <!-- End .page-header -->
                </div>
                <!-- End .row -->
                <div class="outlet">
                    <!-- Start .outlet -->
                    <!-- Page start here ( usual with .row ) -->
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- col-lg-12 start here -->
                            <div class="panel panel-default plain toggle panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading white-bg">
                                    <h4 class="panel-title">人员列表</h4>
                                </div>
                                <div class="panel-body">
                                    <table class="table" id="person">
                                        <thead>
                                            <tr>
                                                <th class="per10">序号</th>
                                                <th class="per10">姓名</th>
                                                <th class="per25">创建时间</th>
                                                <th class="per25">上一次登录时间</th>
                                                <th class="per20">联系方式</th>
                                                <th class="per10">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <div class="page">
                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate" align="center">
                                            <ul class="pagination" id="page_info">
                                                
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End .panel -->
                        </div>
                        <!-- col-lg-12 end here -->
                    </div>
                    <!-- End .row -->
                    <!-- Page End here -->
                </div>
                <!-- End .outlet -->
            </div>
            <!-- End .content-wrapper -->
            <div class="clearfix"></div>
        </div>
        <!-- End #content -->
        <!-- Javascripts -->
    <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
     
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
    
    
    <script src="assets/js/easypiechart.js"></script>
    <script src="assets/js/easypiechart-data.js"></script>
    
     <script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>
    
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>

      
    <!-- Chart Js -->
    <script type="text/javascript" src="assets/js/chartjs.js"></script>
     
    </body>
</html>