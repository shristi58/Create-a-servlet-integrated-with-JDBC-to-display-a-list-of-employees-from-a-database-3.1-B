package com.example.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SearchEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("empId"));
        Employee employee = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM employees WHERE id = ?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                employee = new Employee(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("department"),
                        rs.getDouble("salary")
                );
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        request.setAttribute("employee", employee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
        dispatcher.forward(request, response);
    }
}
