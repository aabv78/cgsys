
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Form</title>
        <%@include file="_bootstrap.jsp" %>
        <style> .error {color:red} </style>
        <spring:url value="/resources/script.js" var="scriptJs" /> <script src="${scriptJs}"></script>
    </head>

    <c:if test="${teacher.teacherId eq 0}">
        <c:set var = "status"  value = "false"/>        
        <c:url var="action" value="/teacher/add" ></c:url>        
    </c:if>
    
    <c:if test="${teacher.teacherId ne 0}">
        <c:set var = "status"  value = "true"/>
        <c:url var="action" value="/teacher/edit" ></c:url>
    </c:if>

    <body onload="disableForm('teacher',${status})">
        
        <%@include file="_navbar.jsp" %>
       
        <div class="container">
            <div class="jumbotron jumbotron-fluid justify-content-center" >               
               
                <div class="py-1 text-center">
                    <h3>Teacher Information</h3>
                </div>   
                <form:form action="${action}" commandName="teacher">
                    
                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-2">
                            <form:label path="teacherId" > <spring:message text="Id"/> </form:label> 
                            <form:input path="teacherId" class="form-control" readonly="true" />
                            <form:errors path="teacherId" cssClass="error"/>
                        </div>
                    </div>


                        
                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-5">
                            <form:label path='teacherFirstName'> <spring:message text='First name'/> </form:label> 
                            <form:input path='teacherFirstName' class="form-control" required="true" id="teacherFirstName"/>
                            <form:errors path="teacherFirstName" cssClass="error"/>
                        </div>

                        <div class="form-group col-md-5">
                            <form:label path='teacherLastName'> <spring:message text='Last name'/> </form:label> 
                            <form:input path='teacherLastName' class="form-control" required="true" id="teacherLastName"/>                
                            <form:errors path="teacherLastName" cssClass="error"/>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-3">
                            <form:label path='teacherSalary'> <spring:message text='Salary'/> </form:label> 
                            <form:input path='teacherSalary' class="form-control" required="true" id="teacherSalary" />
                            <form:errors path="teacherSalary" cssClass="error"/>
                        </div>

                        <div class="form-group col-md-7">
                            <form:label path='teacherAddress'> <spring:message text='Address'/> </form:label> 
                            <form:input path='teacherAddress' class="form-control" required="true" id="teacherAddress" />                
                            <form:errors path="teacherAddress" cssClass="error"/>
                        </div>
                    </div>                    

                    <div class="form-row">    
                        <div class="form-group col-md-1"></div>
                        
                        <div class="form-group col-md-3">
                            <form:label path='teacherPhone'> <spring:message text='Phone'/> </form:label> 
                            <form:input path='teacherPhone' class="form-control" required="true" id="teacherPhone"/>                
                            <form:errors path="teacherPhone" cssClass="error"/>
                        </div>                        
                        
                        <div class="form-group col-md-3">
                            <form:label path='teacherCity'> <spring:message text='City'/> </form:label> 
                            <form:input path='teacherCity' class="form-control" required="true" id="teacherCity"/>                
                            <form:errors path="teacherCity" cssClass="error"/>
                        </div>

                        <div class="form-group col-md-4">
                            <form:label path='teacherCountry'> <spring:message text='Country'/> </form:label> 
                            <form:input path='teacherCountry' class="form-control" required="true" id="teacherCountry"/>                
                            <form:errors path="teacherCountry" cssClass="error"/>
                        </div>
                    </div>

                    <div class="form-row" >                     

                        <div class="form-group col-md-1"></div>
                        
                        <c:if test="${teacher.teacherId ne 0}">
                            <div class="form-group col-md-1">
                                <input type="button" class="btn btn-primary" value="Edit" onclick="disableForm('teacher',false)"></input>
                            </div>
                        </c:if>
                        
                        <div class="form-group col-md-1">
                            <input type="submit" class="btn btn-primary" value="<spring:message text="Save"/>"></input>
                        </div>

                    </div>

                </form:form>

            </div>
            
            <c:if test="${teacher.teacherId ne 0}">
                <div class="jumbotron jumbotron-fluid justify-content-center" >
                    <div class="col-md-12 order-md-1">
                    <div class="py-1 text-center">
                        <h3>List of courses in which the teacher is assigned</h3>
                    </div>
                    <c:if test="${!empty teachercourseList}">
                        <table class="table table-striped" id="tableResults">
                            <thead>                            
                            <th scope="col">Id</th>
                            <th scope="col">Course Id</th>
                            <th scope="col">Course Name</th>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${teachercourseList}">
                                    <tr>
                                        <td>
                                            <a href="<c:url value='/teachercourse/${item.teachercourseId}' />" >
                                                ${item.teachercourseId}
                                            </a>
                                        </td>
                                        <td>${item.teachercourseCourse.courseId}</td>
                                        <td>${item.teachercourseCourse.courseName}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>                        
                    </c:if>    
                    
                    <c:if test="${empty teachercourseList}">
                        <h3>No courses added yet</h3>
                    </c:if>
                    <br><br>
                        
                    <c:url var="action3" value="/teachercourse/add/${teacher.teacherId}" ></c:url>
                    <form:form action="${action3}" commandName="teachercourse" method="GET">
                        <div class="form-row" >                 
                            <div class="form-group col-md-1"></div>
                            <div class="form-group col-md-2">
                                <input type="submit" class="btn btn-primary" value="Add Teacher to course" />                                
                            </div>
                        </div>
                    </form:form>
                    </div>
                </div>
            </c:if>             
            
            <div class="jumbotron jumbotron-fluid justify-content-center" >
                <c:if test="${teacher.teacherId ne 0}">
                    <c:url var="actionDelete" value="/teacher/delete/${teacher.teacherId}" ></c:url>
                    <form:form action="${actionDelete}"  modelAttribute="teacher" onsubmit="return confirmDelete()">
                        <div class="form-row">
                        <div class="form-group col-md-1"></div>    
                        <div class="form-group col-md-1">
                            <input type="submit" class="btn btn-primary" value="<spring:message text="Delete Teacher"/>" ></input>
                        </div>                    

                        </div>
                    </form:form> 
                </c:if>
            </div>
        </div>
        
        <script>
            $(document).ready(function () {
                $('#tableResults').DataTable();
            });
        </script>
        
    </body>
</html>