<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>checking</h1>
	<%-- <c:out value="${currency} }"/> --%>
	<c:forEach var="bank" items="${banks}">
		<tr>
			<td>${bank.id}</td>
			<td>${bank.name}</td>
			<td>${bank.country}</td>
			<br>
		</tr>
	</c:forEach>
</body>
</html>