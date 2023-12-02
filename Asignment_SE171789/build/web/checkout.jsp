<%-- 
    Document   : checkout
    Created on : Jul 16, 2023, 8:36:45 PM
    Author     : YEN HOANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head> 
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/checkout.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
    </head>
    <body>
        <div class="container">
        <img src="https://i.pinimg.com/564x/96/3f/61/963f616b7879fbd3f85f3603541a8c01.jpg">
        <h1>Awesome!</h1>
        <h2>Thank you,  ${sessionScope.loginUser.name}</h2>
        <h5>Your order has been placed successfully</h5>
        </div>
    </body>
</html>
