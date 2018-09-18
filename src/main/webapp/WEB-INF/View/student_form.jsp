<%@page import="model.Course"%>
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
        <title>Add Student Form</title>
        <%@include file="_bootstrap.jsp" %>
        <style> .error {color:red} </style>
        <spring:url value="/resources/script.js" var="scriptJs" /> <script src="${scriptJs}"></script>
    </head>

    <c:if test="${student.studentId eq 0}">
        <c:set var = "status"  value = "false"/>        
        <c:url var="action" value="/student/add" ></c:url>        
    </c:if>

    <c:if test="${student.studentId ne 0}">
        <c:set var = "status"  value = "true"/>
        <c:url var="action" value="/student/edit" ></c:url>
    </c:if>         
    
    <body onload="disableForm('student',${status})">
    
        <%@include file="_navbar.jsp" %>
   
        
        <div class="container">
            

            
            <div class="jumbotron jumbotron-fluid justify-content-center " > 
            
                <div class="py-1 text-center">
                    <h3>Student Information</h3>
                </div>
                
                <form:form action="${action}" commandName="student" modelAttribute="student">

                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-2">
                            <form:label path="studentId" > <spring:message text="Id"/> </form:label> 
                            <form:input path="studentId" class="form-control" readonly="true" />
                            
                        </div>
                    </div>

                         
                            
                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-5">
                            <form:label path='studentFirstName'> <spring:message text='First name'/> </form:label> 
                            <form:input path='studentFirstName' class="form-control" required="true" id="studentFirstName"/>
                            <form:errors path="studentFirstName" cssClass="error"/>
                        </div>

                        <div class="form-group col-md-5">
                            <form:label path='studentLastName'> <spring:message text='Last name'/> </form:label> 
                            <form:input path='studentLastName' class="form-control" required="true" id="studentLastName"/> 
                            <form:errors path="studentLastName" cssClass="error"/>
                        </div>
                    </div>


                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-5">
                            <form:label path='studentEmail'> <spring:message text='Email'/> </form:label> 
                            <form:input path='studentEmail' class="form-control" required="true" id="studentEmail"/>
                            <form:errors path="studentEmail" cssClass="error"/>
                        </div>

                        <div class="form-group col-md-5">
                            <form:label path='studentOrganization'> <spring:message text='Organization'/> </form:label> 
                            <form:input path='studentOrganization' class="form-control" required="true" id="studentOrganization"/>                
                            <form:errors path="studentOrganization" cssClass="error"/>
                        </div>
                    </div>                    


                    <div class="form-row">    
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-4">
                            <form:label path='studentAddress'> <spring:message text='Address'/> </form:label> 
                            <form:input path='studentAddress' class="form-control" required="true" id="studentAddress"/>                
                            <form:errors path="studentAddress" cssClass="error"/>
                        </div>

                        <div class="form-group col-md-3">
                            <form:label path='studentPhone'> <spring:message text='Phone'/> </form:label> 
                            <form:input path='studentPhone' class="form-control" required="true" id="studentPhone"/>
                            <form:errors path="studentPhone" cssClass="error"/>
                        </div>

                        <div class="form-group col-md-3">
                            <form:label path='studentBirthday'> <spring:message text='Birthday'/> </form:label> 
                            <form:input path='studentBirthday' type="date" class="form-control" required="true" id="studentBirthday"/>                
                            <form:errors path="studentBirthday" cssClass="error"/>
                        </div>

                    </div>


                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-4">
                            <form:label path='studentCity'> <spring:message text='City'/> </form:label> 
                            <form:input path='studentCity' class="form-control" required="true" id="studentCity"/>                
                            <form:errors path="studentCity" cssClass="error"/>
                        </div>
                        <div class="form-group col-md-3">
                            <form:label path='studentState'> <spring:message text='State'/> </form:label> 
                            <form:input path='studentState' class="form-control" required="true" id="studentState"/>                
                            <form:errors path="studentState" cssClass="error"/>
                        </div>
                        <div class="form-group col-md-3">
                            <form:label path='studentCountry'> <spring:message text='Country'/> </form:label> 
                            <form:input path='studentCountry' class="form-control" required="true" id="studentCountry"/>                
                            <form:errors path="studentCountry" cssClass="error"/>
                        </div>                        
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-2">
                            <fieldset class="form-group">
                                <div class="row">
                                    <legend class="col-form-label col-sm-2 pt-0">Gender </legend>
                                </div>
                                <div class="form-row">
                                    <div class="col-sm-10">
                                        <div class="form-check">
                                            <form:radiobutton path = "studentGender" class="form-check-input"  name="studentGender" id="studentGenderM" value="M" />
                                            <form:label path='studentGender' > <spring:message text='Male'/> </form:label>
                                        </div>
                                        <div class="form-check">
                                            <form:radiobutton path = "studentGender" class="form-check-input"  name="studentGender" id="studentGenderF" value="F" />
                                            <form:label path='studentGender' > <spring:message text='Female'/> </form:label>
                                        </div>
                                        <form:errors path="studentGender" cssClass="error"/>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>

                    <div class="form-row" >                     

                        <div class="form-group col-md-1"></div>

                        <c:if test="${student.studentId ne 0}">
                            <div class="form-group col-md-1">
                                <input type="button" class="btn btn-primary" value="Edit" onclick="disableForm('student', false)"></input>
                            </div>
                        </c:if>

                        <div class="form-group col-md-1">
                            <input type="submit" class="btn btn-primary" value="<spring:message text="Save"/>"></input>
                        </div>

                    </div>

                </form:form>     
                

                
                
            </div>

            <c:if test="${student.studentId ne 0}">
                <div class="jumbotron jumbotron-fluid justify-content-center" >
                    <div class="col-md-12 order-md-1">
                    <div class="py-1 text-center">
                        <h3>List of courses in which the student is registered</h3>
                    </div>
                    <c:if test="${!empty resultList}">
                        <table class="table table-striped" id="tableResults">
                            <thead>                            
                            <th scope="col">Result</th>
                            <th scope="col">Course Id</th>
                            <th scope="col">Course Name</th>
                            <th scope="col">Session</th>
                            <th scope="col">Mark</th>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${resultList}">
                                    <tr>
                                        <td>
                                            <a href="<c:url value='/result/${item.resultId}' />" >
                                                ${item.resultId}
                                            </a>
                                        </td>
                                        <td>${item.resultCourse.courseId}</td>
                                        <td>${item.resultCourse.courseName}</td>
                                        <td>${item.resultSession}</td>
                                        <td>${item.resultMark}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>    
                    
                    <c:if test="${empty resultList}">
                        <h3>No courses added yet</h3>
                    </c:if>
                    <br><br>
                        
                    <c:url var="action3" value="/result/add/${student.studentId}" ></c:url>
                    <form:form action="${action3}" commandName="result" method="GET">
                        <div class="form-row" >                 
                            <div class="form-group col-md-1"></div>
                            <div class="form-group col-md-2">
                                <input type="submit" class="btn btn-primary" value="Add Student to course" />                                
                            </div>
                        </div>
                    </form:form>
                    </div>
                </div>
            </c:if> 

            
            <c:if test="${student.studentId ne 0}">
                <div class="jumbotron jumbotron-fluid justify-content-center" >
                    <div class="col-md-12 order-md-1">
                    <div class="py-1 text-center">
                        <h3>List of payments made by the student</h3>
                    </div>
                    <c:if test="${!empty paymentList}">
                        <table class="table table-striped" id="tableResults">
                            <thead>                            
                            <th scope="col">Payment</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Date</th>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${paymentList}">
                                    <tr>
                                        <td>
                                            <a href="<c:url value='/result/${item.paymentId}' />" >
                                                ${item.paymentId}
                                            </a>
                                        </td>
                                        <td>${item.paymentAmount}</td>
                                        <td>${item.paymentDate}</td>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>    
                    
                    <c:if test="${empty paymentList}">
                        <h3>No payments done yet</h3>
                    </c:if>
                    <br><br>
                        
                    <c:url var="action4" value="/payment/add/${student.studentId}" ></c:url>
                    <form:form action="${action4}" commandName="payment" method="GET">
                        <div class="form-row" >                 
                            <div class="form-group col-md-1"></div>
                            <div class="form-group col-md-2">
                                <input type="submit" class="btn btn-primary" value="Add payment" />                                
                            </div>
                        </div>
                    </form:form>
                    </div>
                </div>
            </c:if> 


            <c:if test="${student.studentId ne 0}">
                <div class="jumbotron jumbotron-fluid justify-content-center" >
                
                    <c:url var="actionDelete" value="/student/delete/${student.studentId}" ></c:url>
                    <form:form action="${actionDelete}"  modelAttribute="student" onsubmit="return confirmDelete()">
                        <div class="form-row">
                        <div class="form-group col-md-1"></div>    
                        <div class="form-group col-md-1">
                            <input type="submit" class="btn btn-primary" value="<spring:message text="Delete Student"/>" ></input>
                        </div>                  

                        </div>
                    </form:form> 
                                   
                </div>
            </c:if>             
        </div>

        <script>
            $(document).ready(function () {
                $('#tableResults').DataTable();
            });
        </script>
    </body>
</html>