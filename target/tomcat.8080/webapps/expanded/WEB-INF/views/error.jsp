<%--
  Created by IntelliJ IDEA.
  User: ruslan
  Date: 17.03.17
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: ruslan
  Date: 04.03.17
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Lost Pet Finder">
    <meta name="author" content="Ruslan Pareokha">
    <title>Error - Lost Pet Finder</title>
    <link rel="icon" href="../../favicon.ico">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
</head>
<body>
<c:set var="link" value="href='/login'"/>
<c:set var="tabname" value="Sign In"/>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <c:set var="tabname" value="Log out"/>

    <c:set var="link" value="onclick=document.forms['logoutForm'].submit()"/>

    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</c:if>
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">LostPetFinder</a>
            <a class="navbar-brand" href="/add">Add Case</a>
            <a class="navbar-brand" href="/user_case?id=${pageContext.request.userPrincipal.name}">Your case</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/registration"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a ${link} ><span class="glyphicon glyphicon-user"></span>${tabname}</a></li>
        </ul>
    </div>
</nav>

<

    <h3 align="justify">
        Error. Something went wrong.
    </h3>
    <br>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
