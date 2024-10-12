package myPkg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RequestServlet
 */
@WebServlet("/requestAttr")
public class RequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RequestServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);

		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String addr = request.getParameter("address");
		String[] pet = request.getParameterValues("pet");

		request.setAttribute("name", name);
		request.setAttribute("addr", addr);					// 각각 setAttribute 하기
		request.setAttribute("pet", pet);

		AnimalBean rb = new AnimalBean();
		rb.setName(name);
		rb.setAddress(addr);
		rb.setPet(pet);

		request.setAttribute("rb", rb);						// 묶어서 setAttribute 하기

		RequestDispatcher dispatcher = request.getRequestDispatcher("result_내이름.jsp");

		dispatcher.forward(request, response);
	}
}






