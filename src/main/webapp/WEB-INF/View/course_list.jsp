<%@page import="model.Course"%>
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
                <div class="py-1 text-center">
                    <h3>Course List</h3>
                </div>               
                
                <div class="col-md-12 order-md-1">    
                    
                    <c:if test="${!empty listCourses}">
                        <table class="table table-striped" id="tableCourses">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Credits</th>
                        </thead>
                        <tbody>

                            <c:forEach var="item" items="${listCourses}">
                                <tr>
                                    <td>
                                        <a href="<c:url value='/course/${item.courseId}' />" >
                                            ${item.courseId}
                                        </a>
                                    </td>
                                    <td>${item.courseName}</td>
                                    <td>${item.courseCredits}</td>
                                </tr>
                            </c:forEach>


                        </tbody>
                        </table>
                    </c:if>    
                    <c:if test="${empty listCourses}">
                        <h3>No courses added yet</h3>
                    </c:if>

                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#tableCourses').DataTable();
            });
        </script>
    </body>
</html>
