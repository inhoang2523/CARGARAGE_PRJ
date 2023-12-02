<%-- 
    Document   : register
    Created on : Jul 8, 2023, 10:40:56 AM
    Author     : YEN HOANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Create new account</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/login.css">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel=stylesheet>
    </head>
    <body>
        
        <div class="container">
            <h1 class="title">User Information</h1>
            <form action="MainController" id="registrationForm" method="post">
                <div class="form-group">
                    <label for="txtusername">User Name</label>
                    <input type="text" name="txtusername" required class="box" id="txtusername" />
                    <span class="error-message">${requestScope.USER_ERROR.userIDError}</span>
                </div>
                <div class="form-group">
                    <label for="txtfullname">Full Name</label>
                    <input type="text" name="txtfullname" class="box" id="txtfullname" />
                    <span class="error-message">${requestScope.USER_ERROR.fullNameError}</span>
                </div>
                <div class="form-group">
                    <label for="txtrole">Role</label>
                    <input type="text" name="txtrole" readonly value="US" class="box" id="txtrole" />
                </div>
                <div class="form-group">
                    <label for="txtpassword">Password</label>
                    <input type="password" name="txtpassword" class="box" id="txtpassword" />
                </div>
                <div class="form-group">
                    <label for="confirm">Confirm</label>
                    <input type="password" name="confirm" required class="box" id="confirm" />
                    <span class="error-message">${requestScope.USER_ERROR.confirmError}</span>
                </div>
                <div class="form-group">
                    <input class="create" value="create" name="action" hidden="" /> 
                    <input type="submit" name="action" value="Create" />
                    <input class="reset" type="reset" value="Reset" onclick="resetForm()" />
                </div>
            </form>
        </div>
        <script>
            function resetForm() {
                document.getElementById("registrationForm").reset();
                location.href = "register.jsp"; // Replace "login.html" with the URL of your login page
            }
        </script>
    </body>
</html>
