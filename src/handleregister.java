
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
 * Servlet implementation class handleregister
 */
@WebServlet("/handleregister")
public class handleregister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public handleregister() {
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
		String firstname = request.getParameter("first_name");
		String lastname = request.getParameter("last_name");
		String emailid = request.getParameter("emailid");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		String employeeid = request.getParameter("employee_id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
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
			PreparedStatement preparedStmt;
			String cquery = "insert into customer (first_name, last_name, emailid, address, contact, username, password) values (?,?,?,?,?,?,?)";
			String equery = "insert into employee (first_name, last_name, emailid, address, contact, employeeid, username, password) values (?,?,?,?,?,?,?,?)";
			if (isEmployee) {
				preparedStmt = con.prepareStatement(equery);
				preparedStmt.setString(1, firstname);
				preparedStmt.setString(2, lastname);
				preparedStmt.setString(3, emailid);
				preparedStmt.setString(4, address);
				preparedStmt.setString(5, contact);
				preparedStmt.setString(6, employeeid);
				preparedStmt.setString(7, username);
				preparedStmt.setString(8, password);
			} else {
				preparedStmt = con.prepareStatement(cquery);
				preparedStmt.setString(1, firstname);
				preparedStmt.setString(2, lastname);
				preparedStmt.setString(3, emailid);
				preparedStmt.setString(4, address);
				preparedStmt.setString(5, contact);
				preparedStmt.setString(6, username);
				preparedStmt.setString(7, password);
			}
			preparedStmt.execute();

			session.setAttribute("errmsg", username + " registration successful :-). ");
			response.sendRedirect("registered.jsp");
			return;

		} catch (Exception e) {
			System.out.println(e);
			session.setAttribute("errmsg", username + " registration failed :-(. ");
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
