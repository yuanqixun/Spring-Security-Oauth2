<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="authorize" value="/authorize.jsp" />
<c:url var="access_token" value="/access_token.jsp" />
<c:url var="access_protected_resource"
	value="/access_protected_resource.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>这是首页</title>
<link type="text/css" rel="stylesheet"
	href="webjars/bootstrap/3.0.3/css/bootstrap.min.css" />
<script type="text/javascript" src="webjars/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript"
	src="webjars/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-md-12">
			你只有登入了才可以访问此处,这是OAuth2服务器的首页，只是提供服务的。
			<ul>
				<li><a href="${authorize}" target="_blank">授权接口</a></li>
				<li><a href="${access_token}" target="_blank">获取token</a></li>
				<li><a href="${access_protected_resource }" target="_blank">访问受保护的资源</a></li>
			</ul>
		</div>
	</div>
</body>
</html>