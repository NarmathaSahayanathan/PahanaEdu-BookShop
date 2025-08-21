<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
            background-color: #f2f2f2;
        }

        h1 {
            color: #333;
        }

        .button {
            padding: 12px 24px;
            margin: 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Welcome to Customer Billing System</h1>

<a href="addCustomer.jsp" class="button">Add Customer</a>
<a href="viewCustomers.jsp" class="button">View Customers</a>
<a href="addItem.jsp" class="button">Add Item</a>
<a href="viewItems.jsp" class="button">View Items</a>
<a href="selectItems.jsp" class="button">ADD item to Customer and generate bill</a>
<a href="LoginServlet?action=logout">Logout</a>

</body>
</html>
