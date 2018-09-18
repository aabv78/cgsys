
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

    <c:if test="${empty result.resultId}">
        <c:set var = "status"  value = "false"/>        
        <c:url var="action" value="/result/add" ></c:url>        
    </c:if>

    <c:if test="${!empty result.resultId}">
        <c:set var = "status"  value = "true"/>
        <c:url var="action" value="/result/edit" ></c:url>
    </c:if>  

    
    <body onload="disableForm('result',${status})">
        
        <%@include file="_navbar.jsp" %>
        
        <div class="container">
            <div class="jumbotron jumbotron-fluid justify-content-center" >                
               
                <form:form action="${action}"  modelAttribute="result" name="Form" onsubmit="return validateFormResult()">

                    <div class="form-row">
                        
                        <div class="form-group col-md-1"></div>

                        <div class="form-group col-md-1">
                            <form:label path="resultId" > <spring:message text="resultId"/> </form:label>
                            <form:input path="resultId" class="form-control" readonly="true" />
                            <form:errors path="resultId" />
                        </div>
                    </div>
                        
                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-1">
                            <form:label path='resultStudent.studentId'> <spring:message text='Student Id'/> </form:label> 
                            <form:input path='resultStudent.studentId' class="form-control"  id="resultStudent" readonly="true" />
                            <form:errors path="resultStudent.studentId" cssClass="error"/>
                        </div>


                        <div class="form-group col-md-3">
                            <form:label path='resultStudent.studentFirstName'> <spring:message text='First Name'/> </form:label> 
                            <form:input path='resultStudent.studentFirstName' class="form-control"  id="studentFirstName" readonly="true" />
                            <form:errors path="resultStudent.studentFirstName" cssClass="error"/>
                        </div>


                        <div class="form-group col-md-3">
                            <form:label path='resultStudent.studentLastName'> <spring:message text='Last Name'/> </form:label> 
                            <form:input path='resultStudent.studentLastName' class="form-control"  id="studentLastName"  readonly="true" />
                            <form:errors path="resultStudent.studentLastName" cssClass="error"/>
                        </div>
                    </div>
                        
                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-3">  
                            <form:label path='resultCourse.courseId'> <spring:message text='Course'/> </form:label> 
                            <form:select path="resultCourse.courseId" class="form-control" id="courseId">
                                <form:option value="0" label="--- Select ---"/>
                                <form:options items="${courseList}" itemLabel="courseName" itemValue="courseId" />
                            </form:select>
                            <form:errors path="resultCourse.courseId" cssClass="error"/>
                        </div>                           
                        
                        <div class="form-group col-md-2">
                            <form:label path='resultSession'> <spring:message text='Session'/> </form:label> 
                            <form:input path='resultSession' class="form-control"  id="resultSession" />
                            <form:errors path="resultSession" cssClass="error" name="resultSession" />
                        </div>

                        <div class="form-group col-md-2">  
                            <form:label path='resultMark'> <spring:message text='Mark'/> </form:label>
                            <form:input path='resultMark' class="form-control"  id="resultMark" />
                            <form:errors path="resultMark" cssClass="error" name="resultMark" />
                        </div>  
                    </div>
                        
                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        
                        <c:if test="${!empty result.resultId}">
                            <div class="form-group col-md-1">
                                <input type="button" class="btn btn-primary" value="Edit" onclick="disableForm('result', false)"></input>
                            </div>
                        </c:if>
                        
                        <div class="form-group col-md-1">                            
                            <input type="submit" class="btn btn-primary mb-2" value="<spring:message text="Save"/>"></input>
                        </div>
                        
                    </div>
                </form:form>
                
                
                <c:url var="actionDelete" value="/result/delete/${result.resultId}" ></c:url>
                <form:form action="${actionDelete}"  modelAttribute="result" onsubmit="return confirmDelete()">
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