package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.model.service.FindIdPwdService;
import member.model.vo.*;

/**
 * Servlet implementation class FindIdCompleteServlet
 */
@WebServlet(name = "FindIdComplete", urlPatterns = { "/findIdComplete" })
public class FindIdCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String memberEmail = request.getParameter("memberEmail");
		Member m = new FindIdPwdService().showId(memberEmail);
		//m.getUser_id();
		if(m!=null)
		{
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(m,response.getWriter());
		}
		else
		{
			System.out.println("해당하는 정보가 없어요");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
