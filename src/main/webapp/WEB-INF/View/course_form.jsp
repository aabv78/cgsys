
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Form</title>
        <%@include file="_bootstrap.jsp" %>
        <style> .error {color:red} </style>
        <spring:url value="/resources/script.js" var="scriptJs" /> <script src="${scriptJs}"></script>
    </head>
   
    <c:if test="${empty course.courseId}">
        <c:set var = "status"  value = "false"/>        
        <c:url var="action" value="/course/add" ></c:url>        
    </c:if>
    
    <c:if test="${!empty course.courseId}">
        <c:set var = "status"  value = "true"/>
        <c:url var="action" value="/course/edit" ></c:url>
    </c:if>
    
    <body onload="disableForm('course',${status})">
        
        <%@include file="_navbar.jsp" %>
        
        <div class="container">
            <div class="jumbotron jumbotron-fluid justify-content-center" >  

                
                <div class="py-1 text-center">
                    <h3>Course Information</h3>
                </div>                


                
                <div class="row">
                    <div class="col-md-8 order-md-1">
                        <form:form action="${action}" commandName="course" modelAttribute="course" >
                    
                            <div class="form-row">
                                <div class="form-group col-md-1"></div>
                                <div class="form-group col-md-2">
                                    <form:label path="courseId" > <spring:message text="Id"/> </form:label> 
                                    <form:input path="courseId" class="form-control" readonly="true" />                               
                                </div>
                            </div>
                                

                            <div class="form-row">
                                <div class="form-group col-md-1"></div>
                                <div class="form-group col-md-6">
                                    <form:label path='courseName'> <spring:message text='Name'/> </form:label> 
                                    <form:input path='courseName' class="form-control" required="true"   id="courseName" name='courseName' />
                                    <form:errors path="courseName" cssClass="error"/>
                                </div>

                                <div class="form-group col-md-2">
                                    <form:label path='courseCredits'> <spring:message text='Credits'/> </form:label> 
                                    <form:input path='courseCredits' class="form-control" required="true"   id="courseCredits"/> 
                                    <form:errors path="courseCredits" cssClass="error" />
                                </div>
                            </div>

                            <div class="form-row" >                     

                                <div class="form-group col-md-1"></div>

                                <c:if test="${!empty course.courseId}">
                                    <div class="form-group col-md-1">
                                        <input type="button" class="btn btn-primary" value="Edit" onclick="disableForm('course',false)"></input>
                                    </div>
                                </c:if>

                                <div class="form-group col-md-1">
                                    <input type="submit" class="btn btn-primary" value="<spring:message text='Save'/>"></input>
                                </div>

                            </div>

                        </form:form>
                    </div>
                </div>
                
            </div>
            
            
            <c:if test="${!empty course.courseId}">
                <div class="jumbotron jumbotron-fluid justify-content-center" >
                    <div class="col-md-12 order-md-1">
                        
                        <div class="py-1 text-center">
                            <h3>List of teachers assigned to the course</h3>
                            
                        </div>                        
                        
                        <c:if test="${!empty teacherList}">
                            <table class="table table-striped" id="tableResults">
                                <thead>                            
                                <th scope="col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Salary</th>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${teacherList}">
                                        <tr>
                                            <td>
                                                <a href="<c:url value='/teacher/${item.teacherId}' />" >
                                                    ${item.teacherId}
                                                </a>
                                            </td>
                                            <td>${item.teacherFirstName} ${item.teacherLastName}</td>
                                            <td>${item.teacherPhone}</td>
                                            <td>${item.teacherSalary}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>                        
                        </c:if>    

                        <c:if test="${empty teacherList}">
                            <h3>No teachers added yet</h3>
                        </c:if>
                    </div>
                </div>
                
            </c:if>  
            
            <c:if test="${!empty course.courseId}">
                <div class="jumbotron jumbotron-fluid justify-content-center" >
                    <div class="col-md-12 order-md-1">
                        <div class="py-1 text-center">
                            <h3>List of students assigned to the course</h3>                        
                        </div>  
                        <c:if test="${!empty studentList}">
                            <table class="table table-striped" id="tableResults2">
                                <thead>                            
                                <th scope="col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Email</th>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${studentList}">
                                        <tr>
                                            <td>
                                                <a href="<c:url value='/student/${item.studentId}' />" >
                                                    ${item.studentId}
                                                </a>
                                            </td>
                                            <td>${item.studentFirstName} ${item.studentLastName}</td>
                                            <td>${item.studentPhone}</td>
                                            <td>${item.studentEmail}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>                        
                        </c:if>    

                        <c:if test="${empty studentList}">
                            <h3>No students added yet</h3>
                        </c:if>
                    </div>
                </div>
                
            </c:if> 
            
            
            <div class="jumbotron jumbotron-fluid justify-content-center" >
                <c:if test="${!empty course.courseId}">
                    <c:url var="actionDelete" value="/course/delete/${course.courseId}" ></c:url>
                    <form:form action="${actionDelete}"  modelAttribute="course" onsubmit="return confirmDelete()">
                        <div class="form-row">
                        <div class="form-group col-md-1"></div>    
                        <div class="form-group col-md-1">
                            <input type="submit" class="btn btn-primary" value="<spring:message text="Delete Course"/>" ></input>
                        </div>                    

                        </div>
                    </form:form> 
                </c:if>
            </div>
            
            
        </div>
        <script>
            $(document).ready(function () {
                $('#tableResults').DataTable();
                $('#tableResults2').DataTable();
            });
        </script>               
    </body>
</html>