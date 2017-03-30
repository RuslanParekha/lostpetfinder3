<%--
  Created by IntelliJ IDEA.
  User: ruslan
  Date: 16.03.17
  Time: 18:00
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
    <title>Lost Pet Finder</title>
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
            <a class="navbar-brand" href="/admin">Users</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/registration"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a ${link} ><span class="glyphicon glyphicon-user"></span>${tabname}</a></li>
        </ul>
    </div>
</nav>


<div class="container">
    <h3>Incedents List</h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <td><b>Photo</b></td>
            <td><b>Case type</b></td>
            <td><b>Date</b></td>
            <td><b>Pet Type</b></td>
            <td><b>Gender</b></td>
            <td><b>Description</b></td>
            <td><b>Latitude</b></td>
            <td><b>Longitude</b></td>
            <td><b>Action</b></td>



        </tr>
        </thead>
        <c:forEach items="${incedents}" var="incedent">
            <tr>
                <td><img height="40" width="40" src="/image/${incedent.photo.id}" /></td>
                <td>${incedent.date}</td>
                <td>${incedent.caseType}</td>
                <td>${incedent.petType}</td>
                <td>${incedent.gender}</td>
                <td><a href="/show?id=${incedent.id}">${incedent.description}</a></td>
                <td>${incedent.latitude}</td>
                <td>${incedent.longitude}</td>
                <td><a href="/delete?id=${incedent.id}">Delete</a></td>

            </tr>
        </c:forEach>
    </table>

    <form class="form-inline" role="form" action="/add" method="get">
        <input type="submit" class="btn btn-default" value="Add new">
    </form>
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
