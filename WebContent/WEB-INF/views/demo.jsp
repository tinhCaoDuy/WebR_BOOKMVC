<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-hover">
		<tr>
			<td>Username</td>
			<td>Gender</td>
			<td>Birthday</td>
			<td>Photo</td>
			<td>Email</td>
			<td>Phone</td>
			<td>Salary</td>
			<td>Notes</td>
		</tr>
		<c:forEach var="s" items="${staffs}">
			<tr>
				<td>${s.username}</td>
				<td>${s.gender}</td>
				<td>${s.birthday}</td>
				<td>${s.photo}</td>
				<td>${s.email}</td>
				<td>${s.salary}</td>
				<td>${s.notes}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>