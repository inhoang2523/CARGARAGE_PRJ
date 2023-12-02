<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/admin.css">
    </head>
    <body>
        <h1>Welcome: <span class="name">${sessionScope.loginUser.name}</span> comeback!</h1>
        <h2>Manage User </h2>
        <div class="search-bar">  
            <form action="MainController" method="get">
                <input type="text" name="txtsearch" value="${param.name}" />
                <input value="txtsearch" name="action" hidden="" />
                <input type="submit" value="Search" name="action" />
            </form>
        </div>
        <c:if test="${requestScope.listuser != null}">
            <table border="1">
                <thead>
                    <tr class="header">
                        <th>No</th>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Role ID</th>
                        <th>Password</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="us" varStatus="counter" items="${requestScope.listuser}">
                    <form action="MainController" method="POST">
                        <tr class="content">
                            <td>${counter.count}</td>
                            <td>
                                <input class="box" type="text" name="userID" value="${us.getId()}" readonly="" />
                            </td>
                            <td>
                                <input class="box" type="text" name="fullName" value="${us.getName()}" required="" />
                            </td>
                            <td>
                                <input class="box" type="text" name="roleID" value="${us.getRole()}" required="" />
                            </td>
                            <td>${us.getPassword()}</td>
                            <td>
                                <input class="button" type="submit" name="action" value="Update" />
                                <input type="hidden" name="txtsearch" value="${param.name}" />
                            </td>
                            <td>
                                <input class="button" type="submit" name="action" value="Delete" />
                                <input type="hidden" name="userID" value="${us.getId()}" />
                                <input type="hidden" name="txtsearch" value="${param.name}" />


                            </td>
                        </tr>
                    </form>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${not empty requestScope.SUCCESS}">
        <div class="success-message">${requestScope.SUCCESS}</div>
    </c:if>

    <c:if test="${not empty requestScope.ERROR}">
        <div class="error-message">${requestScope.ERROR}</div>
    </c:if>
    <c:if test="${not empty requestScope.MSG}">
        <p>${requestScope.MSG}</p>
    </c:if>

    <h2><a href="MainController?action=find">Home Page</a></h2>
    <a href="MainController?action=load">Manage Car</a>

</body>
</html>
