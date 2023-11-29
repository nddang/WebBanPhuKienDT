<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	<link rel="stylesheet" href="/resources/css/loginadmin.css">
</head>
<body>

	<div id="login-form-wrap">
		<h2>Login</h2>
		<p style="font-size: 18px; color: red;">${mess}</p>
		<form id="login-form" action="/admin/login" method="post">
			<p>
				<input type="text" id="username" name="username"placeholder="Username" required>
			</p>
			<p>
				<input type="password" id="password" name="password" placeholder="Password" required>
			</p>
			<p>
				<input type="submit" id="login" value="Login">
			</p>
		</form>
</body>
</html>