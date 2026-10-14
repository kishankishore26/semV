

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class lab1b
 */
@WebServlet("/lab1b")
public class lab1b extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lab1b() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String action = request.getParameter("action");
		if("logout".equals(action)) {
			HttpSession session = request.getSession(false);
			if(session != null) {
				session.invalidate();
			}
			response.sendRedirect("lab1b");
			return;
		}
		HttpSession session = request.getSession(false);
		if(session !=null && session.getAttribute("username")!=null) {
			out.println("<html><head><title>Welcome</title></head><body>");
			out.println("<h2>Welcome, "+session.getAttribute("username")+"!</h2>");
			out.println("<p><a href='lab1b?action=logout'>Logout</a></p>");
			out.println("<h1>Session information: </h1>");
			out.println("<p>Session ID: "+session.getId()+"</p>");
			out.println("<p>Creation time: "+new java.util.Date(session.getCreationTime())+"</p>");
			out.println("<p>Last accessed time: "+new java.util.Date(session.getLastAccessedTime())+"</p>");
			out.println("</body></html>");
		}else {
			out.println("<html><head><title>Login</title></head><body>");
			out.println("<h2>Login</h2>");
			out.println("<form method='POST' action='lab1b'>");
			out.println("Username: <input type='text' name='username'><br><br>");
			out.println("Password: <input type='password' name='password'><br><br>");
			out.println("<input type='submit' value='Login'>");
			out.println("</form></body></html");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(username!=null && username.equals("username") && password!=null && password.equals("password")){
			HttpSession session = request.getSession(true);
			session.setAttribute("username", username);
			
			response.sendRedirect("lab1b");
		}else {
			response.sendRedirect("lab1b");
		}

	}
}
