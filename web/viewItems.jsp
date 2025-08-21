<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Items</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 40px; background-color: #f0f0f0; }
        table { width: 80%; margin: auto; border-collapse: collapse; background-color: white; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: center; }
        th { background-color: #4CAF50; color: white; }
        h2 { text-align: center; margin-bottom: 30px; }
        form { display: inline; }
        
        
        
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
    <h2>Item List</h2>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahanaedu", "root", "narmitha");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM items");
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Item Name</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("item_id") %></td>
            <td><%= rs.getString("item_name") %></td>
            <td><%= rs.getBigDecimal("price") %></td>
            <td><%= rs.getInt("stock") %></td>
            <td><a href="editItem.jsp?itemId=<%=rs.getInt("item_id")%>">Edit</a></td>
            <td>
                <form action="ItemServlet" method="post" onsubmit="return confirm('Delete this item?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="itemId" value="<%=rs.getInt("item_id")%>">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
    <%
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    %>
    <a href="home.jsp" class="button">Back to Home</a>
</body>
</html>
