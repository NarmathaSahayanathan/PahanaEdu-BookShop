<%-- 
    Document   : login.jsp
    Created on : Aug 20, 2025, 11:49:02 AM
    Author     : Narmatha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            
            body { font-family: Arial, sans-serif; background:#fff; margin:0; }
    .login-box {
      width: 320px;
      margin: 60px auto;           
      padding: 16px 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      background: #fff;
    }
    .login-box h1 {
      font-size: 28px;             
      text-align: center;
      margin: 10px 0 18px;
    }
    .field { margin-bottom: 12px; }
    label {
      display: block;               
      margin-bottom: 6px;
      font-weight: 600;
    }
    input[type="text"], input[type="password"] {
      display: block;
      width: 25%;                  
      box-sizing: border-box;
      padding: 8px 10px;
      border: 1px solid #bbb;
      border-radius: 6px;
    }
    .actions { text-align: center; margin-top: 12px; }
    button {
      padding: 10px 16px;
      border: 1px solid #ccc;
      background: #f7f7f7;
      border-radius: 6px;
      cursor: pointer;
    }
    button:hover { background: #eee; }
    </style>
    </head>
    <body>
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" name="username" required><br><br>

            <label for="password">Password:</label>
            <input type="password" name="password" required><br><br>

            <input type="submit" value="Login">
        </form>
    </body>
</html>
