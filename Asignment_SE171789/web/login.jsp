

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/login.css">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">       
        <title>Login Page</title>

    </head>

    <body style="background-color:white;">

        <div class="container">  

            <h2>Log in</h2>

            <form action="MainController" method="post" id="form">


                <div class="form-group">
                    <label for="txtusername">User Name</label>
                    <input class="box" type="text" name="txtusername" required="" id="txtusername"/></br>
                </div>
                <div class="form-group">
                    <label for="txtpasswprd">Password</label>
                    <input class="box" type="password" name="txtpassword" required=""/>
                </div>

                <div class="form-group">
                    <input name="action" value="login" hidden=""/>
                    <input class="lg" type="submit" name="action" value="Login"/>


                  
                    
                    <input class="reset" type="reset" value="Reset"/>
                </div>


                <div class="login-box">
                    <a href="MainController?action=Login with google">Login With Google</a>
                    <img src="https://i.pinimg.com/564x/39/21/6d/39216d73519bca962bd4a01f3e8f4a4b.jpg" alt="Google" class="google-icon">



                </div>
                <div class="create">
                    Don't have acount?
                    <a href="register.jsp">Sign Up</a>
                </div>
            </form> 
            <form action="MainController" method="POST" id="form"> 
                <script src="https://www.google.com/recaptcha/api.js" async defer></script>
                <div class="g-recaptcha" data-sitekey="6Lf-egEnAAAAAEnuA9JTfjbzJSXgwNMgAIBz_qc4"></div>
                <div id="error"></div>
            </form>
        </div>
        <script>
            window.onload = function () {
                let isValid = false;
                const form = document.getElementById("form");
                const error = document.getElementById("error");

                form.addEventListener("submit", function (event) {
                    event.preventDefault();
                    const response = grecaptcha.getResponse();
                    if (response) {
                        form.submit();
                    } else {
                        error.innerHTML = "Please check";
                    }
                });
            };
        </script>

    </body>
</html>



