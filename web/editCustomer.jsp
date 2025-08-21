<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get account number from request
    String accountNumber = request.getParameter("accountNumber");

    String name = "";
    String address = "";
    String telephone = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/pahanaedu", "root", "narmitha");

        String sql = "SELECT * FROM customers WHERE account_number=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, accountNumber);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            address = rs.getString("address");
            telephone = rs.getString("telephone");
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #f0f0f0;
        }
        form {
            width: 400px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <h2>Edit Customer</h2>
    <form action="CustomerServlet" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="accountNumber" value="<%= accountNumber %>">

        <label>Name:</label>
        <input type="text" name="name" value="<%= name %>" required>

        <label>Address:</label>
        <input type="text" name="address" value="<%= address %>" required>

        <label>Telephone:</label>
        <input type="text" name="telephone" value="<%= telephone %>" required>

        <input type="submit" value="Update Customer">
    </form>
</body>
</html>
