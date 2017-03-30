<%--
  Created by IntelliJ IDEA.
  User: ruslan
  Date: 04.03.17
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Lost pet finder">
    <meta name="author" content="Ruslan Pareokha">
    <title>New case</title>
    <link rel="icon" href="../../favicon.ico">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <style>
        #map {width: 100%;
            height: 40%;
            padding: 0;
            margin: 0 auto;
            margin: 0 auto;}
    </style>

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
<div class="container">
        <form id="incedentForm" role="form" enctype="multipart/form-data" class="form-horizontal" action="${contextPath}/add" method="post">
            <div class="form-group"><h3>Please fill all the fields</h3></div>
            <h4>Please chose have you Lost or Found a pet
            <select name="caseType" size="1">
                <option selected="selected" value="Lost">Lost</option>
                <option value="Found">Found</option>
            </select></h4>
            <h4>Please chose Type of animal
            <select name="petType" size="1">
                <option selected="selected" value="Cat">Cat</option>
                <option value="Dog">Dog</option>
                <option value="Rabbit">Rabbit</option>
                <option value="Rabbit">Parrot</option>
            </select></h4>
            <h4>Please chose its gender
            <select name="gender" size="1">
                <option selected="selected" value="Male">Male</option>
                <option value="Female">Female</option>
            </select></h4>
            <h4>When did it happen? <input style="width: 200" type="date" class="form-control" name="date" required></h4>
            <h4>Please add brief description.   All info may be useful </h4>
            <textarea name="description" cols="140" rows="5" required ></textarea>

            <h4>Please download photo </h4><input type="file" name="photo">
            <h4>Chose location on a map by one time click </h4><div id="map"></div>
            <input type="hidden" name="ownerId" value="${pageContext.request.userPrincipal.name}"/>
            <input type="submit" class="btn btn-primary" value="Submit" align="center">
        </form>
</div>

<script src="https://api-maps.yandex.ru/2.1/?lang=en_US" type="text/javascript"></script>
<script src="${contextPath}/resources/js/event_properties.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/limit_file_size.js"></script>
<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
<!-- polyfiller file to detect and load polyfills -->
<script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>
<script>
    webshims.setOptions('waitReady', false);
    webshims.setOptions('forms-ext', {types: 'date'});
    webshims.polyfill('forms forms-ext');
</script>
</body>
</html>
