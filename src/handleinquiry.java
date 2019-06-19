

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Fujifilm.Connection.ConnectionManager;

@WebServlet("/handleinquiry")
public class handleinquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int numrows = (Integer) session.getAttribute("numrows");
		session.setAttribute("numrows", numrows);
		for (int i = 0; i < numrows; i++) {
			int productId = (Integer) session.getAttribute("pno[" + i + "]");
			int qty = (Integer) session.getAttribute("qty[" + i + "]");
			Connection conn = null;
			try {
				conn = ConnectionManager.getCustConnection();
				System.out.println(conn);
				PreparedStatement preparedStmt = null;
				ResultSet rs;
				
				String qry = "select product_name,price from fujifilm.product where product_id = ?";
				preparedStmt = conn.prepareStatement(qry);
				preparedStmt.setInt(1, productId);
				rs = preparedStmt.executeQuery();
				while (rs.next()) {
					String pname = rs.getString(1);
					double price = rs.getDouble(2);
					double totalPrice = price * qty;
					session.setAttribute("productId[" + i + "]", productId);
					session.setAttribute("productName[" + i + "]", pname);
					session.setAttribute("qty[" + i + "]", qty);
					session.setAttribute("totalPrice[" + i + "]", totalPrice);
					break;
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		throw new ServletException("Not implemented");
	}

}