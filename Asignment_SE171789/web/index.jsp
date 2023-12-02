
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="car.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="css/index.css">

    </head>
    <body>

        <div class="header">

            <div class="header-links">

                <ul>
                    <li><a href="homepage.jsp">Home</a></li>
                    <li><a href="#">Products</a></li>
                    <li>
                        <a href="<c:choose><c:when test="${sessionScope.loginUser.role eq 'AD'}">adminhome.jsp</c:when><c:otherwise>user.jsp</c:otherwise></c:choose>">Account</a>
                            </li>
                            <li><a href="#">Service</a></li>
                            <li><a href="#">Contact</a></li>

                        </ul>
                    </div>
                    <div class="right-links">
                            <h4>WELCOME: ${sessionScope.loginUser.name}</h4>
                <div class="right-side-links">
                    <a href="MainController?action=viewdetailcart">
                        <i class="fas fa-shopping-cart"></i>
                        View cart
                    </a>
                    <a href="MainController?action=logout">
                        <i class="fas fa-sign-in-alt"></i>
                        Logout
                    </a>


                </div>
            </div> 
            <div class="header-search">
                <form action="MainController" method="get">
                    <input type="text" name="txtsearch" value="${param.name}" />
                    <input  value="find" name="action" hidden="" />
                    <input class="button"  type="submit" value="Search" name="action" />
                </form>
            </div>

        </div>

        <div class="banner">

            <img src="https://i.pinimg.com/564x/08/d0/c1/08d0c185e66714b4d0dc6c404ddb0a6c.jpg" alt="Car" />
            <img src="https://i.pinimg.com/736x/ac/3e/9f/ac3e9f3361822a030112c64535cee4d2.jpg" alt="Car" />

        </div>

    </div>

    <c:if test="${not empty listcars}">
        <div class="box-product-item">

            <c:forEach var="c" items="${listcars}">
                <div class="container">
                    <div> <img class="item-image" src="image/${c.image}.png"/></div>
                    <div class="item1">
                        <div class="name">${c.name}</div> 
                        <div class="des">${c.description}</div>
                        <div class="seat">Seat: ${c.speed}</div>
                        <div class="origin">Origin: ${c.origin}</div>
                        <div class="fuel">Fuel: ${c.fuel}</div> 
                        <div class="price">Price: <fmt:formatNumber value="${c.price}" type="number" pattern="##,##0"/>VND</div>
                        <a class="buy-link" href="MainController?action=addtocart&id=${c.getId()}">Buy</a>
                    </div>
                </div>
            </c:forEach>


        </div>
    </c:if>
    <c:if test="${not empty MSG}">
        <script>
            alert("Đã thêm sản phẩm vào giỏ hàng");
        </script>
    </c:if>
    <div class="footer">

        <p>Email : CarShowroom.com</p>
        <p>Address: 20/8 Dien Bien Phu, District 3, HCMC</p>
        <h4>&copy; Copyright 2023. CarShowroom.com</h4>

    </div>
</body>
</html>
