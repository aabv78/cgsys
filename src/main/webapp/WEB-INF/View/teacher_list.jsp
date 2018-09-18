<%-- 
    Document   : teacher_add
    Created on : Jun 16, 2018, 10:32:48 AM
    Author     : armando
--%>
<%@page import="model.Teacher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.title}</title>
        <%@include file="_bootstrap.jsp" %>
    </head>

    <body>

        <%@include file="_navbar.jsp" %>

        <div class="container">
            <div class="jumbotron jumbotron-fluid justify-content-center" >
                <div class="col-md-12 order-md-1">
                <div class="py-1 text-center">
                    <h3>Teacher List</h3>
                </div>
                <c:if test="${!empty listTeachers}">
                    <table class="table table-striped" id="tableTeachers">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Address</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Salary</th>

                    </thead>
                    <tbody>

                        <c:forEach var="item" items="${listTeachers}">
                            <tr>
                                <td>
                                    <a href="<c:url value='/teacher/${item.teacherId}' />" >
                                        ${item.teacherId}
                                    </a>
                                </td>
                                <td>${item.teacherFirstName}</td>
                                <td>${item.teacherLastName}</td>
                                <td>${item.teacherAddress}</td>
                                <td>${item.teacherPhone}</td>
                                <td>${item.teacherSalary}</td>
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>
                </c:if>    
                <c:if test="${empty listTeachers}">
                    <h3>No teachers added yet</h3>
                </c:if>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#tableTeachers').DataTable();
            });
        </script>
    </body>
</html>
