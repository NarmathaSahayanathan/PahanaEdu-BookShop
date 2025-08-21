<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Print Bill</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; background: #f9f9f9; }
        table { width: 70%; margin: auto; border-collapse: collapse; background: #fff; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        th { background: #4CAF50; color: white; }
        .total { font-weight: bold; background: #f2f2f2; }
        h2 { text-align: center; }
    </style>
</head>
<body>
    <h2>Customer Bill</h2>
<%
    String acc = request.getParameter("account_number");
    if (acc != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/pahanaedu", "root", "narmitha");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM items");

            double total = 0;
%>
            <table>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
<%
            while (rs.next()) {
                int itemId = rs.getInt("item_id");
                String itemName = rs.getString("item_name");
                double price = rs.getDouble("price");

                String qtyParam = request.getParameter("qty_" + itemId);
                int qty = (qtyParam != null && !qtyParam.isEmpty()) ? Integer.parseInt(qtyParam) : 0;

                if (qty > 0) {
                    double subtotal = price * qty;
                    total += subtotal;
%>
                <tr>
                    <td><%= itemName %></td>
                    <td><%= price %></td>
                    <td><%= qty %></td>
                    <td><%= subtotal %></td>
                </tr>
<%
                }
            }
%>
                <tr class="total">
                    <td colspan="3">TOTAL</td>
                    <td><%= total %></td>
                </tr>
            </table>
<%
            rs.close(); stmt.close(); conn.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    }
%>
<br>
<div style="text-align:center;">
    <a href="selectItems.jsp">⬅ Back</a>
</div>
</body>
</html>
