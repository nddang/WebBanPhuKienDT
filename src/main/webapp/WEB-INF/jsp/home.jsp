<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<meta charset="UTF-8">
<title>web phu kien dien thoai</title>
</head>
<body>
	<div class="wrapper">
		<%@ include file="header.jsp"%>
		<%@ include file="menu.jsp"%>
		<div class="content">
			<div class="content_left">
				<%@ include file="leftmenu.jsp"%>
			</div>
			<div class="content_right">
				<c:if test="${content==null}">
					<%@ include file="listproduct.jsp"%>
				</c:if>
				<c:if test="${content=='login'}">
					<%@ include file="login.jsp"%>
				</c:if>
				<c:if test="${content=='register'}">
					<%@ include file="register.jsp"%>
				</c:if>
				<c:if test="${content=='detailproduct'}">
					<%@ include file="detailproduct.jsp"%>
				</c:if>
				<c:if test="${content=='category'}">
					<%@ include file="category.jsp"%>
				</c:if>
				<c:if test="${content=='cart'}">
					<%@ include file="cart.jsp"%>
				</c:if>
			</div>
			<div class="clear"></div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>