<%@page import="car.Car"%>
<%@page import="car.CarDao"%>
<%@page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <title>Cart Page</title>
        <link rel="stylesheet" href="css/cart.css">
    </head>

    <body>
        <jsp:useBean id="carDao" class="car.CarDao" scope="page" />
        <jsp:useBean id="cart" class="java.util.HashMap" scope="session" />

        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="ibox cart-table">
                        <div class="ibox-title">
                            <i class="fas fa-shopping-cart"></i>
                            <span class="pull-right">${cart.size()} items</span>
                            <h2>Items in your cart</h>
                        </div>
                        <div class="ibox-content">
                            <c:if test="${not empty cart and cart.size() > 0}">
                               
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Car</th>
                                            <th>Car Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Select</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="total" value="0" />
                                        <c:forEach var="id" items="${cart.keySet()}">
                                            <c:set var="c" value="${carDao.getCar(id)}" />
                                        <form action="MainController" method="post">
                                            <tr>
                                                <td><img class="item-image" src="image/${c.image}.png"></td>
                                                <td class="name">${c.name}</td>
                                                <td>
                                                    <fmt:formatNumber value="${c.price}" type="number" pattern="#,##0" />VND
                                                </td>
                                                <td><input type="number" value="${cart.get(id)}" min="1" max="10" name="quantity" /></td>
                                                <td>
                                                    <input class="submit" type="submit" value="Change" name="action" /><br>
                                                    <input type="submit" value="Remove" name="action" />
                                                </td>
                                            <input type="hidden" value="${c.id}" name="carid" />
                                            </tr>
                                        </form>
                                        <c:set var="total" value="${total + (c.price * cart.get(id))}" />
                                        <fmt:formatNumber value="${total}" type="number" pattern="#,##0" var="formattedTotal" />
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${empty cart or cart.size() == 0}">
                                <h1 class="message">Giỏ hàng trống</h1>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Cart Summary</h5>
                        </div>
                        <div class="ibox-content">
                            <span>Total</span>
                            <h2> ${formattedTotal}VND</h2>
                           
                            <div class="m-t-sm">
                                <div class="btn-group">
                                    <a href="MainController?action=checkout" class="submit"><i class="fa fa-shopping-cart"></i> Checkout</a>
                                    <a href="MainController?action=find" class="btn btn-white btn-sm"> Cancel</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Support</h5>
                        </div>
                        <div class="ibox-content text-center">
                            <h3><i class="fa fa-phone"></i> +43 100 783 001</h3>
                            <span class="small">
                                Please contact with us if you have any questions. We are available 24/7.
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

      
    </body>
</html>
