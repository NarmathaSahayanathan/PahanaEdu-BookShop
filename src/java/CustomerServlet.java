import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Default: go to add customer form
        response.sendRedirect("addCustomer.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");  // Add / Update / Delete

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pahanaedu", "root", "narmitha");

            if ("add".equals(action)) {
                // ---------- ADD CUSTOMER ----------
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String telephone = request.getParameter("telephone");

                String sql = "INSERT INTO customers (name, address, telephone) VALUES (?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, name);
                stmt.setString(2, address);
                stmt.setString(3, telephone);
                stmt.executeUpdate();
                stmt.close();

                response.sendRedirect("viewCustomers.jsp");

            } else if ("update".equals(action)) {
                // ---------- UPDATE CUSTOMER ----------
                String accountNumber = request.getParameter("accountNumber");
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String telephone = request.getParameter("telephone");

                String sql = "UPDATE customers SET name=?, address=?, telephone=? WHERE account_number=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, name);
                stmt.setString(2, address);
                stmt.setString(3, telephone);
                stmt.setString(4, accountNumber);
                stmt.executeUpdate();
                stmt.close();

                response.sendRedirect("viewCustomers.jsp");

            } else if ("delete".equals(action)) {
                // ---------- DELETE CUSTOMER ----------
                String accountNumber = request.getParameter("accountNumber");

                String sql = "DELETE FROM customers WHERE account_number=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, accountNumber);
                stmt.executeUpdate();
                stmt.close();

                response.sendRedirect("viewCustomers.jsp");

            } else {
                response.getWriter().println("Unknown action!");
            }

            conn.close();

        } catch (Exception e) {
            response.getWriter().println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}
