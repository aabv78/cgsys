<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGSys</title>
        <%@include file="_bootstrap.jsp" %>
        <spring:url value="/resources/script.js" var="scriptJs" /> <script src="${scriptJs}"></script>
    </head>




    <body class="bg-light">
        <%@include file="_navbar.jsp" %>

        <div class="container">
            <div class="py-5 text-center">
                <h2>Welcome to CGS</h2>
                <p class="lead">The Grading System is a web-based grading system designed to provide admin,  teachers and teacher assistants with an easy, quick way to store grades and allow students to quickly access their grades
                </p>
            </div>


        </div>


    </body>
</html>
