
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Form</title>
        <%@include file="_bootstrap.jsp" %>
        <style> .error {color:red} </style>
        <spring:url value="/resources/script.js" var="scriptJs" /> <script src="${scriptJs}"></script>
    </head>

    <c:if test="${empty payment.paymentId}">
        <c:set var = "status"  value = "false"/>        
        <c:url var="action" value="/payment/add" ></c:url>        
    </c:if>

    <c:if test="${!empty payment.paymentId}">
        <c:set var = "status"  value = "true"/>
        <c:url var="action" value="/payment/edit" ></c:url>
    </c:if>  

    
    <body onload="disableForm('payment',${status})">
        
        <%@include file="_navbar.jsp" %>
        
        <div class="container">
            <div class="jumbotron jumbotron-fluid justify-content-center" >                
               
                <form:form action="${action}"  modelAttribute="payment" name="Form" >

                    <div class="form-row">
                        
                        <div class="form-group col-md-1"></div>

                        <div class="form-group col-md-1">
                            <form:label path="paymentId" > <spring:message text="paymentId"/> </form:label>
                            <form:input path="paymentId" class="form-control" readonly="true" />
                            <form:errors path="paymentId" />
                        </div>
                    </div>
                        
                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-1">
                            <form:label path='paymentStudent.studentId'> <spring:message text='Student Id'/> </form:label> 
                            <form:input path='paymentStudent.studentId' class="form-control"  id="paymentStudent" readonly="true" />
                            <form:errors path="paymentStudent.studentId" cssClass="error"/>
                        </div>


                        <div class="form-group col-md-3">
                            <form:label path='paymentStudent.studentFirstName'> <spring:message text='First Name'/> </form:label> 
                            <form:input path='paymentStudent.studentFirstName' class="form-control"  id="studentFirstName" readonly="true" />
                            <form:errors path="paymentStudent.studentFirstName" cssClass="error"/>
                        </div>


                        <div class="form-group col-md-3">
                            <form:label path='paymentStudent.studentLastName'> <spring:message text='Last Name'/> </form:label> 
                            <form:input path='paymentStudent.studentLastName' class="form-control"  id="studentLastName"  readonly="true" />
                            <form:errors path="paymentStudent.studentLastName" cssClass="error"/>
                        </div>
                    </div>
                        
                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        <div class="form-group col-md-2">
                            <form:label path='paymentAmount'> <spring:message text='Amount'/> </form:label> 
                            <form:input path='paymentAmount' class="form-control"  id="paymentAmount" />
                            <form:errors path="paymentAmount" cssClass="error" name="paymentAmount" />
                        </div>
                        
                        <div class="form-group col-md-3">
                            <form:label path='paymentDate'> <spring:message text='Date'/> </form:label> 
                            <form:input path='paymentDate' type="date" class="form-control" required="true" id="paymentDate"/>                
                            <form:errors path="paymentDate" cssClass="error"/>
                        </div>

                    </div>
                        
                    <div class="form-row">
                        <div class="form-group col-md-1"></div>
                        
                        <c:if test="${!empty payment.paymentId}">
                            <div class="form-group col-md-1">
                                <input type="button" class="btn btn-primary" value="Edit" onclick="disableForm('payment', false)"></input>
                            </div>
                        </c:if>
                        
                        <div class="form-group col-md-1">                            
                            <input type="submit" class="btn btn-primary mb-2" value="<spring:message text="Save"/>"></input>
                        </div>
                        
                    </div>
                </form:form>
                
                
                <c:url var="actionDelete" value="/payment/delete/${payment.paymentId}" ></c:url>
                <form:form action="${actionDelete}"  modelAttribute="payment" onsubmit="return confirmDelete()">
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