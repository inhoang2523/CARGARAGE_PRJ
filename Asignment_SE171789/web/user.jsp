
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="Stylesheet" href="css/user.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Page</title>
    </head>
    <body>
        <div class="container">
            <h1>Welcome, <span class="text-warning">${sessionScope.loginUser.name}</span>!</h1>
            <div class="container">
                <h3>Your Information</h3>
                <div class="content">
                    <div class="id">
                        User ID: ${sessionScope.loginUser.id}
                    </div>
                    <div class="name">
                        User Name: ${sessionScope.loginUser.name}
                    </div>
                    <div class="pass">
                        Your Role: ${sessionScope.loginUser.role}
                    </div>
                </div>
            </div>
                    <a href="MainController?action=find">Return </a>
        </div>
                  
    </body>
</html>
