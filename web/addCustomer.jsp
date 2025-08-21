<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 40px;
        }

        form, .view-button {
            background-color: white;
            padding: 30px;
            width: 400px;
            margin: 20px auto;
            box-shadow: 0 0 10px #ccc;
            border-radius: 10px;
            text-align: center;
        }

        input[type="text"], input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        input[type="submit"], .view-button a {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
        }

        

        
    </style>
</head>
<body>
   
    <!-- Add Customer Form -->
   <form action="CustomerServlet" method="post">
    <input type="hidden" name="action" value="add">
    Name: <input type="text" name="name"><br>
    Address: <input type="text" name="address"><br>
    Telephone: <input type="text" name="telephone"><br>
    <input type="submit" value="Add Customer">
</form>


</body>
</html>
