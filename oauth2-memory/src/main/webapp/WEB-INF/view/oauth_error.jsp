<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>第三方授权出错</title>
<link type="text/css" rel="stylesheet"
	href="../webjars/bootstrap/3.0.3/css/bootstrap.min.css" />
<script type="text/javascript" src="../webjars/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript"
	src="../webjars/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>

<body>

	<div class="container">

		<h1>授权出错</h1>
		<p>
			<c:out value="${message}" />
			(
			<c:out value="${error.summary}" />
			)
		</p>
		<div class="footer">
		</div>
	</div>
</body>
</html>
