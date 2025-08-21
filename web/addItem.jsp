<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Item</title>
    
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        flex-direction: column;
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
            input[type="text"], input[type="number"] {
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
        
        a.button {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
        }
        

        a.button:hover {
            background-color: #45a049;
        }

        form {
            display: inline;
        }
        
    </style>
</head>
<body>
    <h2>Add New Item</h2>
    <form action="ItemServlet" method="post">
        <input type="hidden" name="action" value="add">

        Item Name: <input type="text" name="itemName" required><br><br>
        Price: <input type="number" step="0.01" name="price" required><br><br>
        Stock: <input type="number" name="stock" required><br><br>

        <input type="submit" value="Add Item">
    </form>

    <a href="home.jsp" class="button">Back to Home</a>
</body>
</html>
