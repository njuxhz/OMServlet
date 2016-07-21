package com.om.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.om.order.GetOrder;
import com.om.order.Order;
import com.om.user.GetUser;
import com.om.user.User;

/**
 * Servlet implementation class Detail
 */
@WebServlet("/Detail")
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final int DELIVER = 1;
	public static final int ENGINEER = 2;
	public static final int SALER = 3;
	public static final int ADMIN = 4;
	
	public List<Order> orderList = new ArrayList<Order>();
	public List<User> engineerList = new ArrayList<User>();
	public List<User> salerList = new ArrayList<User>();
    public Order order;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Detail() {
        super();
        GetUser getuser = new GetUser("kermit", "kermit");
		for(User userr : getuser.userList){
			if(userr.mode == ENGINEER){
				engineerList.add(userr);
			}
			if(userr.mode == SALER){
				salerList.add(userr);
			}
		}
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String taskid;
		taskid = request.getParameter("taskid");
		orderList.clear();
		User user = new User("kermit", 4, "kermit");
		GetOrder getorder = new GetOrder(user);
		getorder.setmachstate("ALL");
		for(Order o : getorder.orderList){
			if(o.id.equals(taskid)){
				order = o;
				break;
			}
		}
		
		HttpSession session=request.getSession();
		session.setAttribute("engineerlist", engineerList);
		session.setAttribute("salerlist", salerList);
		session.setAttribute("order", order);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Detail.jsp");   
		requestDispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
