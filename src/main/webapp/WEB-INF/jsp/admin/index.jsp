<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<link rel="stylesheet" type="text/css" href="/resources/css/admincss.css" />
	<script type="text/javascript" src="/resources/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="/resources/js/delete.js"></script>
	<script type="text/javascript" src="/resources/js/tinymce/js/tinymce/jquery.tinymce.min.js"></script>
	<script type="text/javascript" src="/resources/js/tinymce/js/tinymce/tinymce.min.js"></script>
	<script>tinymce.init({ selector:'textarea' });</script>
	<title>Trang Admin</title>
</head>
<body>
<div class="wrapper">
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>
	<div class="content">
    	<div class="box_contains">
    		<c:if test="${content==null}">
				<%@ include file="ProductManagement/list.jsp"%>
			</c:if>
			<c:if test="${content=='product/list'}">
				<%@ include file="ProductManagement/list.jsp"%>
			</c:if>
			<c:if test="${content=='product/add'}">
				<%@ include file="ProductManagement/add.jsp"%>
			</c:if>
			<c:if test="${content=='product/update'}">
				<%@ include file="ProductManagement/update.jsp"%>
			</c:if>
			<c:if test="${content=='category/list'}">
				<%@ include file="CategoryManagement/list.jsp"%>
			</c:if>
			<c:if test="${content=='category/add'}">
				<%@ include file="CategoryManagement/add.jsp"%>
			</c:if>
			<c:if test="${content=='category/update'}">
				<%@ include file="CategoryManagement/update.jsp"%>
			</c:if>
    	</div>
    </div>
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>