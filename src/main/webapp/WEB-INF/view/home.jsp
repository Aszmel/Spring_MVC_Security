<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
	<title>Company Home Page</title>
</head>
<body>
	<h2>Company Home Page</h2>
	<hr>
	Welcome to the company home page!
	<hr>
	<p>
	User: <security:authentication property="principal.username"/>
	<br><br>
	Role(s): <security:authentication property="principal.authorities"/>
	</p>

	<security:authorize access="hasRole('MANAGER')">
	<p>
		<a href="${pageContext.request.contextPath}/leaders">Leaders Meetings</a>
	</p></security:authorize>

	<security:authorize access="hasRole('ADMIN')">
	<p>
		<a href="${pageContext.request.contextPath}/systems">Admins Meetings</a>
	</p></security:authorize>

	<hr>
<form:form action="${pageContext.request.contextPath}/logout" method="post">
	<input type="submit" value="Logout">
</form:form>
</body>
</html>