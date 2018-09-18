
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Form</title>
        <%@include file="_bootstrap.jsp" %>
        <style> .error {color:red} </style>
        <spring:url value="/resources/script.js" var="scriptJs" /> <script src="${scriptJs}"></script>
    </head>

    <c:if test="${empty teachercourse.teachercourseId}">
        <c:set var = "status"  value = "false"/>        
        <c:url var="action" value="/teachercourse/add" ></c:url>        
    </c:if>

    <c:if test="${!empty teachercourse.teachercourseId}">
        <c:set var = "status"  value = "true"/>
        <c:url var="action" value="/teachercourse/edit" ></c:url>
    </c:if>  

    
    <body onload="disableForm('teachercourse',${status})">
        
        <%@include file="_navbar.jsp" %>
        
        <div class="container">
            <div class="jumbotron jumbotron-fluid justify-content-center" >                
               
                <form:form action="${action}"  modelAttribute="teachercourse" >

                    <div class="form-row">
                        
                        <div class="form-group col-md-1"></div>

                        <div class="form-group col-md-1">
                            <form:label path="teachercourseId" > <spring:message text="Id"/> </form:label>
                            <form:input path="teachercourseId" class="form-control" readonly="true" />
                            <form:errors path="teachercourseId" cssClass="error"/>
                        </div>
                    </div>
                        
                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-1">
                            <form:label path='teachercourseTeacher.teacherId'> <spring:message text='Teacher Id'/> </form:label> 
                            <form:input path='teachercourseTeacher.teacherId' class="form-control"  id="teachercourseTeacher" readonly="true" />
                            <form:errors path="teachercourseTeacher.teacherId" cssClass="error"/>
                        </div>


                        <div class="form-group col-md-3">
                            <form:label path='teachercourseTeacher.teacherFirstName'> <spring:message text='First Name'/> </form:label> 
                            <form:input path='teachercourseTeacher.teacherFirstName' class="form-control"  id="teacherFirstName" readonly="true" />
                            <form:errors path="teachercourseTeacher.teacherFirstName" cssClass="error"/>
                        </div>


                        <div class="form-group col-md-3">
                            <form:label path='teachercourseTeacher.teacherLastName'> <spring:message text='Last Name'/> </form:label> 
                            <form:input path='teachercourseTeacher.teacherLastName' class="form-control"  id="teacherLastName"  readonly="true" />
                            <form:errors path="teachercourseTeacher.teacherLastName" cssClass="error"/>
                        </div>
                    </div>
                        
                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-3">  
                            <form:label path='teachercourseCourse.courseId'> <spring:message text='Course'/> </form:label> 
                            <form:select path="teachercourseCourse.courseId" class="form-control" id="courseId">
                                <form:option value="0" label="--- Select ---"/>
                                <form:options items="${courseList}" itemLabel="courseName" itemValue="courseId" />
                            </form:select>
                        </div>                           
                    </div>
                        
                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        
                        <c:if test="${!empty teachercourse.teachercourseId}">
                            <div class="form-group col-md-1">
                                <input type="button" class="btn btn-primary" value="Edit" onclick="disableForm('teachercourse', false)"></input>
                            </div>
                        </c:if>
                        
                        <div class="form-group col-md-1">                            
                            <input type="submit" class="btn btn-primary mb-2" value="<spring:message text="Add"/>"></input>
                        </div>
                        
                    </div>

                </form:form>
                
                <c:url var="actionDelete" value="/teachercourse/delete/${teachercourse.teachercourseId}" ></c:url>
                <form:form action="${actionDelete}"  modelAttribute="result" onsubmit="return confirmDelete()" >
                    <div class="form-row">
                    <div class="form-group col-md-1"></div>    
                    <div class="form-group col-md-1">
                        <input type="submit" class="btn btn-primary" value="<spring:message text="Delete"/>" ></input>
                    </div>                    

                    </div>
                </form:form>                
                
            </div>
        </div>
               
    </body>
</html>