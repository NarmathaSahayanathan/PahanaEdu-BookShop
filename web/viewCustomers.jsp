<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Customers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #f0f0f0;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: white;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
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

    <h2>Customer List</h2>

    <%
        String url = "jdbc:mysql://localhost:3306/pahanaedu";
        String user = "root";
        String password = "narmitha";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);

            String sql = "SELECT * FROM customers";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
    %>

    <table>
        <tr>
            <th>Account Number</th>
            <th>Name</th>
            <th>Address</th>
            <th>Telephone</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>

        <%
            while (rs.next()) {
                String accountNumber = rs.getString("account_number");
        %>
        <tr>
            <td><%= accountNumber %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("telephone") %></td>

            <!-- Edit button links to editCustomer.jsp -->
            <td>
                <a href="editCustomer.jsp?accountNumber=<%=accountNumber%>">Edit</a>
            </td>

            <!-- Delete handled by CustomerServlet -->
            <td>
                <form action="CustomerServlet" method="post" 
                      onsubmit="return confirm('Are you sure you want to delete this customer?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="accountNumber" value="<%=accountNumber%>">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
        %>
    </table>

    <a href="home.jsp" class="button">Back to Home</a>

</body>
</html>
