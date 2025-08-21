<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String itemId = request.getParameter("itemId");
    String name="", price="", stock="";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahanaedu", "root", "narmitha");

        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM items WHERE item_id=?");
        stmt.setInt(1, Integer.parseInt(itemId));
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("item_name");
            price = rs.getString("price");
            stock = rs.getString("stock");
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
<head><title>Edit Item</title></head>
<body>
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
    <h2>Edit Item</h2>
    <form action="ItemServlet" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="itemId" value="<%=itemId%>">

        Item Name: <input type="text" name="itemName" value="<%=name%>" required><br><br>
        Price: <input type="number" step="0.01" name="price" value="<%=price%>" required><br><br>
        Stock: <input type="number" name="stock" value="<%=stock%>" required><br><br>

        <input type="submit" value="Update Item">
    </form>
    <a href="viewItems.jsp">Back to Items</a>
</body>
</html>
