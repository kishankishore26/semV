import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class lab1a
 */
@WebServlet("/lab1a")
public class lab1a extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lab1a() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//	response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.println("<html><body>");
		out.println("<h2>Submit your details: </h2><br>");
		out.println("<form method='POST' action='lab1a'>");
		out.println("Name: <input type='text' name='name'><br><br>");
		out.println("Password: <input type='password' name='password'><br><br>");
		out.println("<input type='submit' value='submit'>");
		out.println("</form></body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.println("<html><body>");
		out.println("<h2>Submitted Data: </h2>");
		out.println("Name: "+name+"<br>");
		out.println("Password: "+password+"<br>");
		out.println("</body></html>");
	}
}
