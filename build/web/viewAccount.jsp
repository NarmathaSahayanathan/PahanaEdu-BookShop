<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Account Details</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 40px; background-color: #f9f9f9; }
        table { width: 60%; margin: auto; border-collapse: collapse; background-color: #fff; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #4CAF50; color: white; }
        h2 { text-align: center; margin-bottom: 30px; }
        form { text-align: center; margin-bottom: 20px; }
        input[type="number"], input[type="submit"] { padding: 8px; margin: 5px; }
    </style>
</head>
<body>
    <h2>Customer Account Details</h2>

    <!-- Input form -->
    <form method="get">
        Enter Customer Account Number: 
        <input type="number" name="account_number" required>
        <input type="submit" value="View Details">
    </form>
    <br>

    <%
        String id = request.getParameter("account_number");
        if (id != null && !id.isEmpty()) {
            try {
                // Load driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Connect to DB
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pahanaedu", "root", "narmitha");

                // Prepare query
                PreparedStatement stmt = conn.prepareStatement(
                    "SELECT account_number, name, address, telephone FROM customers WHERE account_number=?");
                stmt.setInt(1, Integer.parseInt(id));

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
    %>
                <!-- Display customer details -->
                <table>
                    <tr><th>Account Number</th><td><%= rs.getInt("account_number") %></td></tr>
                    <tr><th>Name</th><td><%= rs.getString("name") %></td></tr>
                    <tr><th>Email</th><td><%= rs.getString("address") %></td></tr>
                    <tr><th>Phone</th><td><%= rs.getString("telephone") %></td></tr>
                </table>
    <%
                } else {
                    out.println("<p style='color:red; text-align:center;'>❌ Customer not found!</p>");
                }

                // Close resources
                rs.close();
                stmt.close();
                conn.close();

            } catch (Exception e) {
                out.println("<p style='color:red; text-align:center;'>⚠ Error: " + e.getMessage() + "</p>");
            }
        }
    %>

    <br>
    <div style="text-align:center;">
        <a href="home.jsp">⬅ Back to Home</a>
    </div>
</body>
</html>
