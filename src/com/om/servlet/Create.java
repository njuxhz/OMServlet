package com.om.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.om.order.OrderConnect;
import com.om.user.User;

/**
 * Servlet implementation class Create
 */
@WebServlet("/Create")
public class Create extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Create() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String createname, createtel, createcompany, createaddress, createscore, createengineerid, createsalerid;
		String createisdeliver, createisdebug, createisondoor, createiswarehouse, createinstallid, createwarehouseid;
		createname = request.getParameter("createname");
		createtel = request.getParameter("createtel");
		createcompany = request.getParameter("createcompany");
		createaddress = request.getParameter("createaddress");
		createscore = request.getParameter("createscore");
		createengineerid = request.getParameter("createengineerid");
		createsalerid = request.getParameter("createsalerid");
		
		createisdeliver = request.getParameter("createisdeliver");
		createisdebug = request.getParameter("createisdebug");
		createisondoor = request.getParameter("createisondoor");
		createiswarehouse = request.getParameter("createiswarehouse");
		createinstallid = request.getParameter("createinstallid");
		createwarehouseid = request.getParameter("createwarehouseid");
		if((createinstallid == null) || (createinstallid.equals(""))) createinstallid = "*";
		if((createwarehouseid == null) || (createwarehouseid.equals(""))) createwarehouseid = "*";
		
		User user = new User("kermit", 4, "kermit");
		if((!createname.equals("")) && (!createcompany.equals("")) 
				&& (!createtel.equals("")) && (!createaddress.equals("")) 
				&& (!createscore.equals(""))){
			OrderConnect ordercnt = new OrderConnect(user);
			ordercnt.createorder(23, "Name", createname, 
					"Company", createcompany, 
					"Tel", createtel,
					"Address", createaddress, 
					"Score", createscore,
					"Engineerid", createengineerid,
					"Salerid", createsalerid,
					"Ondoor", "*",
					"Series", "*",
					"Feedback", "*",
					"Photourl1", "*", "Photourl2", "*", "Photourl3", "*",
					"Picindex", "1",
					"Isdel", "0",
					"Isedit", "0",
					"Isaccepted", "0",
					"Isdeliver", createisdeliver, "Isdebug", createisdebug, 
					"Isondoor", createisondoor, "Iswarehouse", createiswarehouse,
					"Installid", createinstallid, "Warehouseid", createwarehouseid);
		}
		//request.getRequestDispatcher("/Show").forward(request,response);
		response.sendRedirect("show");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
