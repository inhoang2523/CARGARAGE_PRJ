<%-- 
    Document   : managecar
    Created on : Jul 20, 2023, 5:16:11 PM
    Author     : YEN HOANG
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/admin.css">
    </head>
    <body>
        <h2>Manage Car</h2>
        <div class="search-bar">
            <form action="MainController" method="get">
                <input type="text" name="load" value="${param.name}" />
                <input  value="load" name="action" hidden="" />
                <input class="button"  type="submit" value="Search" name="action" />
            </form>
        </div>
    <c:if test="${not empty listcars}">
        <table border="1">
            <thead>
                <tr class="header">
                    <th>No</th>
                    <th> </th>

                    <th>Car name</th>
                    <th>Description</th>
                    <th>Seat</th>
                    <th>Origin</th>
                    <th>Fuel</th>
                    <th>Price</th>
                   
                   
                </tr>
            </thead>
            <tbody>



            <c:forEach var="c" varStatus="counter" items="${listcars}">
                <form action="MainController" method="POST">
                    <tr class="content">
                        <td>${counter.count}</td>
                        <td> <img class="item-image" src="image/${c.image}.png"/></td>
                        <td>${c.name}</td>
                        <td>${c.description}</td>
                        <td> ${c.speed}</td>
                        <td>${c.origin}</td>
                        <td>${c.fuel}</td> 
                        <td> <fmt:formatNumber value="${c.price}" type="number" pattern="##,##0"/>VND</td>


            </c:forEach>
            </tr>
            </form>
            </tbody>
        </table>
    </c:if>
    <a href="adminhome.jsp">Turn back</a><br>
    <a href="MainController?action=find">Home Page</a>
</body>
</html>
