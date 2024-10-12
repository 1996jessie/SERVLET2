package myPkg;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
//@~ : annotation  
@WebServlet("/Hello") // URL mapping
//http://localhost:8080/03_Servlet/Hello => Hello 요청했다.=>HelloServlet 파일이 실행된다.
// get 방식이 뭔가?
//HelloServlet 객체 생성 new HelloServlet() 와 신기하다~
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public HelloServlet() {
        System.out.println("HelloServlet() 생성자");
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() { // 언제 호출되나? 
		System.out.println("destroy");    
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doGet(request, response);
	}

}
