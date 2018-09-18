<%-- 
    Document   : student_add
    Created on : Jun 16, 2018, 10:32:48 AM
    Author     : armando
--%>
<%@page import="model.Student"%>
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
                    <h3>Student List</h3>
                </div>
                <c:if test="${!empty listStudents}">
                    <table class="table table-striped" id="tableStudents">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Address</th>
                            <th scope="col">City</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Email</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="st" items="${listStudents}">
                            <tr>
                                <td>
                                    <a href="<c:url value='/student/${st.studentId}' />" >
                                        ${st.studentId}
                                    </a>
                                </td>
                                <td>${st.studentFirstName}</td>
                                <td>${st.studentLastName}</td>
                                <td>${st.studentAddress}</td>
                                <td>${st.studentCity}</td>
                                <td>${st.studentPhone}</td>
                                <td>${st.studentEmail}</td>
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>
                </c:if>    
                <c:if test="${empty listStudents}">
                    <h3>No students added yet</h3>
                </c:if>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#tableStudents').DataTable();
            });
        </script>
    </body>
</html>
