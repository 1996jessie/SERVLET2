package myPkg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FormServlet
 */
@WebServlet("/FormServlet")
public class FormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//System.out.println("doGet()");
		
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String[] coffee = request.getParameterValues("coffee");
		String job = request.getParameter("job");
		String[] travel = request.getParameterValues("travel");
		
		ResultBean rb = new ResultBean();
		rb.setName(name);
		rb.setAge(age);
		rb.setGender(gender);
		rb.setCoffee(coffee);
		rb.setJob(job);
		rb.setTravel(travel);
		
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		request.setAttribute("gender", gender);
		request.setAttribute("coffee", coffee);
		request.setAttribute("job", job);
		request.setAttribute("travel", travel);
		request.setAttribute("rb", rb);
		
		RequestDispatcher rd = request.getRequestDispatcher("Ex05_result_이예원.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
