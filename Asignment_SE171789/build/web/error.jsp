<%-- 
    Document   : error
    Created on : Feb 8, 2023, 11:25:40 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h1>Fail</h1>
            ${requestScope.ERROR}
    </body>
</html>
