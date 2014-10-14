<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import="org.springframework.security.core.AuthenticationException"%>
<%@ page
	import="org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter"%>
<%@ page
	import="org.springframework.security.oauth2.common.exceptions.UnapprovedClientAuthenticationException"%>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>OAuth2 服务器</title>
<link type="text/css" rel="stylesheet"
	href="../webjars/bootstrap/3.0.3/css/bootstrap.min.css" />
<script type="text/javascript"
	src="../webjars/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript"
	src="../webjars/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>

<body>

	<div class="container">
		<h1>OAuth2 服务器</h1>

		<%
			if (session
					.getAttribute(AbstractAuthenticationProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY) != null
					&& !(session
							.getAttribute(AbstractAuthenticationProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY) instanceof UnapprovedClientAuthenticationException)) {
		%>
		<div class="error">
			<h2>Woops!</h2>

			<p>
				Access could not be granted. (<%=((AuthenticationException) session
						.getAttribute(AbstractAuthenticationProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY))
						.getMessage()%>)
			</p>
		</div>
		<%
			}
		%>
		<c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION" />

		<authz:authorize ifAllGranted="ROLE_USER">
			<h2>确认授权</h2>

			<p>
				你在此授权 "
				<c:out value="${client.clientId}" />
				" 访问你受保护的资源.
			</p>

			<form id="confirmationForm" name="confirmationForm"
				action="<%=request.getContextPath()%>/oauth/authorize" method="post">
				<input name="user_oauth_approval" value="true" type="hidden" />
				<ul class="list-unstyled">
					<c:forEach items="${scopes}" var="scope">
						<c:set var="approved">
							<c:if test="${scope.value}"> checked</c:if>
						</c:set>
						<c:set var="denied">
							<c:if test="${!scope.value}"> checked</c:if>
						</c:set>
						<li>
							<div class="form-group">
								${scope.key}: <input type="radio" name="${scope.key}"
									value="true" ${approved}>批准</input> <input type="radio"
									name="${scope.key}" value="false" ${denied}>拒绝</input>
							</div>
						</li>
					</c:forEach>
				</ul>
				<button class="btn btn-primary" type="submit">提交</button>
			</form>

		</authz:authorize>

		<div class="footer">
		</div>

	</div>

</body>
</html>
