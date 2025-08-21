<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Select Items</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; background: #f9f9f9; }
        table { width: 70%; margin: auto; border-collapse: collapse; background: #fff; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        th { background: #4CAF50; color: white; }
        h2 { text-align: center; }
        
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
    <h2>Select Items for Customer</h2>

    <form method="get">
        Enter Account Number: 
        <input type="number" name="account_number" required>
        <input type="submit" value="Load Items">
    </form>
    <br>

<%
    String acc = request.getParameter("account_number");
    if (acc != null && !acc.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/pahanaedu", "root", "narmitha");

            // Get customer info
            PreparedStatement custStmt = conn.prepareStatement(
                "SELECT name, address, telephone FROM customers WHERE account_number=?");
            custStmt.setInt(1, Integer.parseInt(acc));
            ResultSet custRs = custStmt.executeQuery();

            if (custRs.next()) {
%>
                <h3 style="text-align:center;">Customer: <%= custRs.getString("name") %> 
                | Email: <%= custRs.getString("address") %> 
                | Phone: <%= custRs.getString("telephone") %></h3>

                <form method="post" action="printBill.jsp">
                    <input type="hidden" name="account_number" value="<%= acc %>">
                    <table>
                        <tr>
                            <th>Item</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
<%
                // Show all items
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM items");

                while (rs.next()) {
%>
                        <tr>
                            <td><%= rs.getString("item_name") %></td>
                            <td><%= rs.getDouble("price") %></td>
                            <td>
                                <input type="number" name="qty_<%= rs.getInt("item_id") %>" value="0" min="0">
                            </td>
                        </tr>
<%
                }
%>
                    </table>
                    <br>
                    <div style="text-align:center;">
                        <input type="submit" value="Generate Bill">
                    </div>
                </form>
<%
                rs.close(); stmt.close();
            } else {
                out.println("<p style='color:red;text-align:center;'>Customer not found!</p>");
            }
            custRs.close(); custStmt.close(); conn.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    }
%>
</body>
</html>
