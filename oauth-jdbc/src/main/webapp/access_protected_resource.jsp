<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="pretected_resource" value="/articles" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>访问受保护的资源</title>
<link type="text/css" rel="stylesheet"
	href="webjars/bootstrap/3.0.3/css/bootstrap.min.css" />
<script type="text/javascript" src="webjars/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript"
	src="webjars/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-md-4">
			<h3>访问受保护的资源</h3>
			<form id="form-authorize" action="${pretected_resource }"
				method="get">
				<div class="form-group">
					<label for="access_token">access_token</label> <input type="text"
						class="form-control" id="access_token" name="access_token"
						value="" placeholder="填写刚刚获取的token">
				</div>
				<button type="submit" class="btn btn-default" id="btn-authorize">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>