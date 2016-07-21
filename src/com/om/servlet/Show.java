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
 * Servlet implementation class Show
 */
@WebServlet("/Show")
public class Show extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final int DELIVER = 1;
	public static final int ENGINEER = 2;
	public static final int SALER = 3;
	public static final int ADMIN = 4;
	
	public List<Order> orderList = new ArrayList<Order>();
	public List<User> engineerList = new ArrayList<User>();
	public List<User> salerList = new ArrayList<User>();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Show() {
        super();
        orderList.clear();
		engineerList.clear();
		salerList.clear();
		User user = new User("kermit", 4, "kermit");
		GetOrder getorder = new GetOrder(user);
		getorder.setmachstate("ALL");
		for(Order o : getorder.orderList){
			orderList.add(o);
		}
		
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
		
		int unacceptednum = 0, others = 0;
		int num = orderList.size();
		for(int i = 0; i < num; i++){
			Order o = orderList.get(i);
			if((o.status == 1) && (o.isaccepted.equals("0"))){
				unacceptednum += 1;
			}else others += 1;
		}
		HttpSession session=request.getSession();
		session.setAttribute("orderlist",orderList);
		session.setAttribute("engineerlist", engineerList);
		session.setAttribute("salerlist", salerList);
		session.setAttribute("unacceptednum", unacceptednum);
		session.setAttribute("others", others);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Show.jsp");   
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
