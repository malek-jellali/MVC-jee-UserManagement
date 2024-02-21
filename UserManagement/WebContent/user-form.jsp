<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/beans" prefix="j"%>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
</head>
<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark"
            style="background-color: blue">
            <div>
                <a href="https://www.xadmin.net" class="navbar-brand"> User Management Application </a>
            </div>

            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list"
                    class="nav-link">Users</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <j:useBean id="user" class="com.xadmin.usermanagement.bean.User" scope="request"/>
                
                <c:if test="${not empty user}">
                    <form action="update" method="post">
                </c:if>
                <c:if test="${empty user}">
                    <form action="insert" method="post">
                </c:if>

                <caption>
                    <h2>
                        <c:if test="${not empty user}">
                            Edit User
                        </c:if>
                        <c:if test="${empty user}">
                            Add New User
                        </c:if>
                    </h2>
                </caption>

                <c:if test="${not empty user}">
                    <input type="hidden" name="id" value="<j:getProperty name='user' property='id' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>User Name</label> 
                    <input type="text" value="<j:getProperty name='user' property='name' />" class="form-control" name="name" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>User Email</label> 
                    <input type="text" value="<j:getProperty name='user' property='email' />" class="form-control" name="email">
                </fieldset>

                <fieldset class="form-group">
                    <label>User Country</label> 
                    <input type="text" value="<j:getProperty name='user' property='country' />" class="form-control" name="country">
                </fieldset>

                <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
