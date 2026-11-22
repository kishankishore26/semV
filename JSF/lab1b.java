
import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class prg1b
 */
@WebServlet("/prg1b")
public class prg1b extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public prg1b() {
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
			if(session!=null) {
				session.invalidate();
			}
			response.sendRedirect("prg1b");
			return;
		}
		
		HttpSession session = request.getSession(false);
		if(session!=null && session.getAttribute("username")!=null) {
			out.println("<html><head><title>Welcome</title></head><body>");
			out.println("<h2>Welcome "+session.getAttribute("username")+"!</h2>");
			out.println("<p><a href='prg1b?action=logout'>Logout</a></p>");
			out.println("<h2>Session information:</h2>");
			out.println("<p>Sessio ID: "+session.getId()+"</p>");
			out.println("<p>Session creation time: "+new java.util.Date(session.getCreationTime())+"</p>");
			out.println("<p>Session Last accessed time: "+new java.util.Date(session.getLastAccessedTime())+"</p>");
			out.println("</body></html>");
		}else {
			out.println("<html><head><title>Login</title></head><body>");
			out.println("<h2>Login</h2>");
			out.println("<form method='POST' action='prg1b'>");
			out.println("Username: <input type='text' name='username'>");
			out.println("Password: <input type='password' name='password'>");
			out.println("<input type='submit' value='Submit'>");
			out.println("</form></body></html>");
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
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		if(username!=null && username.equals("username") && password!=null && password.equals("password")) {
			HttpSession session = request.getSession(true);
			session.setAttribute("username", username);
			response.sendRedirect("prg1b");
		}else {
			response.sendRedirect("prg1b");
		}
	}

}
