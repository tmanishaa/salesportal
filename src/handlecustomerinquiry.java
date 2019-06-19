

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Fujifilm.Connection.ConnectionManager;

@WebServlet("/handlecustomerinquiry")
public class handlecustomerinquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Enumeration<String> params = request.getParameterNames(); 
		while(params.hasMoreElements()){
		 String paramName = params.nextElement();
		 System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
		}
		int numrows = Integer.parseInt(request.getParameter("numrows"));
		String username = (String) session.getAttribute("who");
		for (int i = 0; i < numrows; i++) {
			int productId = Integer.parseInt(request.getParameter("pno[" + i + "]"));
			int qty = Integer.parseInt(request.getParameter("qty[" + i + "]"));
			Connection conn = null;
			try {
				conn = ConnectionManager.getCustConnection();
				System.out.println(conn);
				PreparedStatement preparedStmt = null;
				String qry = "insert into inquiry (customer_username,qty,dt_customer,product_id) VALUES (?,?,NOW(),?)";
				preparedStmt = conn.prepareStatement(qry);
				preparedStmt.setString(1, username);
				preparedStmt.setInt(2, qty);
				preparedStmt.setInt(3, productId);
				preparedStmt.execute();
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
		response.sendRedirect("customerquotation.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		throw new ServletException("Not implemented");
	}

}