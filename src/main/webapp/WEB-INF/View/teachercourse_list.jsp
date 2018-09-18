<%@page import="model.Teachercourse"%>
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
            <div class="jumbotron jumbotron-fluid justify-content-center " >
                <div class="col-md-12 order-md-1">
                <h3>Teacher - Course list</h3>
                <c:if test="${!empty listTeachercourses}">
                    <table class="table table-striped" id="tableTeachercourses">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Course Id</th>
                            <th scope="col">Course Name</th>
                            <th scope="col">Teacher Id</th>
                            <th scope="col">Teacher Name</th>
                    </thead>
                    <tbody>

                        <c:forEach var="item" items="${listTeachercourses}">
                            <tr>
                                <td>
                                    <a href="<c:url value='/teachercourse/${item.teachercourseId}' />" >
                                        ${item.teachercourseId}
                                    </a>
                                </td>
                                <td>${item.teachercourseCourse.courseId}</td>
                                <td>${item.teachercourseCourse.courseName}</td>
                                <td>${item.teachercourseTeacher.teacherId}</td>
                                <td>${item.teachercourseTeacher.teacherFirstName} ${item.teachercourseTeacher.teacherLastName}</td>
                            </tr>
                        </c:forEach>


                    </tbody>
                    </table>
                </c:if>    
                <c:if test="${empty listTeachercourses}">
                    <h3>No teachers added to courses yet</h3>
                </c:if>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#tableTeachercourses').DataTable();
            });
        </script>
    </body>
</html>
