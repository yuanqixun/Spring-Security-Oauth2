<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="token" value="/oauth/token" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>获取token</title>
<link type="text/css" rel="stylesheet"
	href="webjars/bootstrap/3.0.3/css/bootstrap.min.css" />
<script type="text/javascript" src="webjars/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript"
	src="webjars/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-md-4">
			<h3>获取token</h3>
			<form id="form-authorize" action="${token}" method="get">
				<div class="form-group">
					<label for="client_id">client_id</label> <input type="text"
						class="form-control" id="client_id" name="client_id"
						value="appclinet">
				</div>
				<div class="form-group">
					<label for="client_secret">client_secret</label> <input type="text"
						class="form-control" id="client_secret" name="client_secret"
						value="secret">
				</div>
				<div class="form-group">
					<label for="grant_type">grant_type</label> <select
						class="form-control" id="grant_type" name="grant_type">
						<option>refresh_token</option>
						<option selected="selected">authorization_code</option>
						<option>implicit</option>
						<option>client_credentials</option>
						<option>password</option>
					</select>
				</div>
				<div class="form-group">
					<label for="code">code</label> <input type="text"
						class="form-control" id="code" name="code" value=""
						placeholder="填写刚刚获取的code">
				</div>
				<div class="form-group">
					<label for="redirect_uri">redirect_uri</label> <input type="text"
						class="form-control" id="redirect_uri" name="redirect_uri"
						value="" placeholder="与在授权接口中填写的要相同">
				</div>
				<button type="submit" class="btn btn-default" id="btn-authorize">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>
