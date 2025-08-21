import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/ItemServlet")
public class ItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action"); // add / update / delete

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pahanaedu", "root", "narmitha");

            if ("add".equals(action)) {
                String itemName = request.getParameter("itemName");
                String price = request.getParameter("price");
                String stock = request.getParameter("stock");

                String sql = "INSERT INTO items (item_name, price, stock) VALUES (?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, itemName);
                stmt.setBigDecimal(2, new java.math.BigDecimal(price));
                stmt.setInt(3, Integer.parseInt(stock));
                stmt.executeUpdate();
                stmt.close();

                response.sendRedirect("viewItems.jsp");

            } else if ("update".equals(action)) {
                String itemId = request.getParameter("itemId");
                String itemName = request.getParameter("itemName");
                String price = request.getParameter("price");
                String stock = request.getParameter("stock");

                String sql = "UPDATE items SET item_name=?, price=?, stock=? WHERE item_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, itemName);
                stmt.setBigDecimal(2, new java.math.BigDecimal(price));
                stmt.setInt(3, Integer.parseInt(stock));
                stmt.setInt(4, Integer.parseInt(itemId));
                stmt.executeUpdate();
                stmt.close();

                response.sendRedirect("viewItems.jsp");

            } else if ("delete".equals(action)) {
                String itemId = request.getParameter("itemId");

                String sql = "DELETE FROM items WHERE item_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(itemId));
                stmt.executeUpdate();
                stmt.close();

                response.sendRedirect("viewItems.jsp");
            }

            conn.close();
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
