<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="authorize" value="/oauth/authorize" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>授权接口</title>
<link type="text/css" rel="stylesheet"
	href="webjars/bootstrap/3.0.3/css/bootstrap.min.css" />
<script type="text/javascript" src="webjars/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript"
	src="webjars/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-md-4">
			<h3>授权接口</h3>
			<form id="form-authorize" action="${authorize}" method="get">
				<div class="form-group">
					<label for="client_id">client_id</label> <input type="text"
						class="form-control" id="client_id" name="client_id"
						value="appclinet">
				</div>
				<div class="form-group">
					<label for="response_type">response_type</label> <input type="text"
						class="form-control" id="response_type" name="response_type"
						value="code">
				</div>
				<div class="form-group">
					<label for="redirect_uri">redirect_uri</label> <input type="text"
						class="form-control" id="redirect_uri" name="redirect_uri"
						value="" placeholder="可以在后台配置，现在是没有配置的,必须填写">
				</div>
				<div class="form-group">
					<label for="state">state</label> <input type="text"
						class="form-control" id="state" name="state" value=""
						placeholder="填写一串字符,防止csrf攻击,可以不用填写 ">
				</div>
				<button type="submit" class="btn btn-default" id="btn-authorize">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>
