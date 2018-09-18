<%@page import="model.Result"%>
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
                <div class="py-1 text-center">
                    <h3>Result List</h3>
                </div>
                <c:if test="${!empty listResults}">
                    <table class="table table-striped" id="tableResults">
                    <thead>
                        <tr>
                            <th scope="col">Result</th>
                            <th scope="col">Course Id</th>
                            <th scope="col">Course Name</th>
                            <th scope="col">Student Id</th>
                            <th scope="col">Student Name</th>
                            <th scope="col">Session</th>
                            <th scope="col">Mark</th>
                    </thead>
                    <tbody>

                        <c:forEach var="item" items="${listResults}">
                            <tr>
                                <td>
                                    <a href="<c:url value='/result/${item.resultId}' />" >
                                        ${item.resultId}
                                    </a>
                                </td>
                                <td>${item.resultCourse.courseId}</td>
                                <td>${item.resultCourse.courseName}</td>
                                <td>${item.resultStudent.studentId}</td>
                                <td>${item.resultStudent.studentFirstName} ${item.resultStudent.studentLastName}</td>
                                <td>${item.resultSession}</td>
                                <td>${item.resultMark}</td>
                            </tr>
                        </c:forEach>


                    </tbody>
                    </table>
                </c:if>    
                <c:if test="${empty listResults}">
                    <h3>No results added yet</h3>
                </c:if>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#tableResults').DataTable();
            });
        </script>
    </body>
</html>
