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
 * Servlet implementation class Edit
 */
@WebServlet("/Edit")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String orderstatusinfo = request.getParameter("orderstatusinfo");
		String orderisacceptedinfo = request.getParameter("orderisacceptedinfo");
		String orderoldscore = request.getParameter("orderoldscore");
		String ordertaskprocessid = request.getParameter("ordertaskprocessid");
		if((orderstatusinfo.equals("1")) && (orderisacceptedinfo.equals("0"))){
			String editname, edittel, editcompany, editaddress, editscore, editengineerid, editsalerid;
			String editisdeliver, editisdebug, editisondoor, editiswarehouse, editinstallid, editwarehouseid;
			editname = request.getParameter("editname");
			edittel = request.getParameter("edittel");
			editcompany = request.getParameter("editcompany");
			editaddress = request.getParameter("editaddress");
			editscore = request.getParameter("editscore");
			editengineerid = request.getParameter("editengineerid");
			editsalerid = request.getParameter("editsalerid");
			
			editisdeliver = request.getParameter("editisdeliver");
			editisdebug = request.getParameter("editisdebug");
			editisondoor = request.getParameter("editisondoor");
			editiswarehouse = request.getParameter("editiswarehouse");
			editinstallid = request.getParameter("editinstallid");
			editwarehouseid = request.getParameter("editwarehouseid");
			if((editinstallid == null) || (editinstallid.equals(""))) editinstallid = "*";
			if((editwarehouseid == null) || (editwarehouseid.equals(""))) editwarehouseid = "*";
			
			if(orderoldscore.equals(editscore)){
				if((!editname.equals("")) && (!editcompany.equals("")) 
						&& (!edittel.equals("")) && (!editaddress.equals("")) 
						&& (!editscore.equals(""))){
					User user = new User("kermit", 4, "kermit");
					OrderConnect ordercnt = new OrderConnect(user);
					ordercnt.update(ordertaskprocessid, 12, "Name", editname, 
											"Company", editcompany, 
											"Tel", edittel,
											"Address", editaddress, 
											"Engineerid", editengineerid,
											"Salerid", editsalerid,
											"Isdeliver", editisdeliver, "Isdebug", editisdebug, 
											"Isondoor", editisondoor, "Iswarehouse", editiswarehouse,
											"Installid", editinstallid, "Warehouseid", editwarehouseid);
				}
			}else{
				if((!editname.equals("")) && (!editcompany.equals("")) 
						&& (!edittel.equals("")) && (!editaddress.equals("")) 
						&& (!editscore.equals(""))){
					User user = new User("kermit", 4, "kermit");
					OrderConnect ordercnt = new OrderConnect(user);
					ordercnt.update(ordertaskprocessid, 14, "Name", editname, 
							"Score", editscore,
							"Isedit", "1",
							"Company", editcompany, 
							"Tel", edittel,
							"Address", editaddress, 
							"Engineerid", editengineerid,
							"Salerid", editsalerid,
							"Isdeliver", editisdeliver, "Isdebug", editisdebug, 
							"Isondoor", editisondoor, "Iswarehouse", editiswarehouse,
							"Installid", editinstallid, "Warehouseid", editwarehouseid);
				}
			}
		}else{
			String editscore = request.getParameter("editscore");
			if(orderoldscore.equals(editscore)){
			}else{
				User user = new User("kermit", 4, "kermit");
				OrderConnect ordercnt = new OrderConnect(user);
				ordercnt.update(ordertaskprocessid, 2, "Score", editscore,
														"Isedit", "1");
			}
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
