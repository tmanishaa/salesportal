
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class handlelogin
 */
@WebServlet("/handlelogin")
public class handlelogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public handlelogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean isEmployee = false;
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String employeeid = request.getParameter("employee_id");
		if (employeeid.length() > 0) {
			isEmployee = true;
		}
		if (username == null || password == null || username.length() == 0 || password.length() == 0) {
			session.setAttribute("errmsg", "username and password cannot be empty strings :-(. ");
			response.sendRedirect("error.jsp");
			return;
		}
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fujifilm?serverTimezone=UTC", "root", "");
			PreparedStatement preparedStmt = null;
			ResultSet rs;
			String equery = "select password,employeeid from employee where username=?";
			String cquery = "select password from customer where username=?";
			if (isEmployee) {
				preparedStmt = con.prepareStatement(equery);
				preparedStmt.setString(1, username);
				rs = preparedStmt.executeQuery();
			} else {
				preparedStmt = con.prepareStatement(cquery);
				preparedStmt.setString(1, username);
				rs = preparedStmt.executeQuery();
			}
			while (rs.next()) {
				if (!rs.getString(1).equals(password)) {
					session.setAttribute("errmsg", username + " login failed :-(. ");
					response.sendRedirect("error.jsp");
					return;
				} else {
					if (isEmployee) {
						if (!rs.getString(2).equals(employeeid)) {
							session.setAttribute("errmsg", username + " login failed :-(. Could not find employeeid. ");
							response.sendRedirect("error.jsp");
							return;
						}
					}
					session.setAttribute("errmsg", username + " login success :-). ");
					response.sendRedirect("error.jsp");
					return;
				}
			}
			session.setAttribute("errmsg", username + " login failed :-(. ");
			response.sendRedirect("error.jsp");
			return;
		} catch (Exception e) {
			System.out.println(e);
			session.setAttribute("errmsg", username + " login failed :-(. ");
			response.sendRedirect("error.jsp");
			return;
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
