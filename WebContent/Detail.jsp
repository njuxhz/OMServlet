<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.om.order.Order" %>
<%@ page import="com.om.user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html><!--Bootstrap 使用到的某些 HTML 元素和 CSS 属性需要将页面设置为 HTML5 文档类型-->
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <title>Document</title>

  <link rel="stylesheet" href="<%=basePath %>css/bootstrap.css">
</head>
<body>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<blockquote>
				<p>维修单细节.</p> <small>只有未锁定输入可修改</small>
				<form action="show">
				<button class="btn btn-info" type="submit">返回</button>
				</form>
			</blockquote>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<div class="row">
				<div class="span12">
			<form action="edit" method="post">
			<%
			Order order = (Order) session.getAttribute("order");
			if((order.status == 1) && (order.isaccepted.equals("0"))){
			%>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Task ID</th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td><%=order.id %></td>
						<td>未接</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>客户姓名</th>
						<th>客户电话</th>
						<th>客户单位</th>
						<th>客户地址</th>
						<th>分值</th>
						<th>工程师</th>
						<th>销售员</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td><input type="text" style="width:80px" value="<%=order.name %>" name="editname"></input></td>
						<td><input type="text" style="width:80px" value="<%=order.tel %>" name="edittel"></input></td>
						<td><input type="text" style="width:80px" value="<%=order.company %>" name="editcompany"></input></td>
						<td><input type="text" style="width:80px" value="<%=order.address %>" name="editaddress"></input></td>
						<td><input type="text" style="width:80px" value="<%=order.score %>" name="editscore"></input></td>
						<td>
						<select style="width:80px" name="editengineerid">
						<%
							List<User> engineerList = (List<User>) session.getAttribute("engineerlist");
							int engineernum = engineerList.size();
							for(int j = 0; j < engineernum; j++){
								User engineer = engineerList.get(j);
								if(order.engineerid.equals(engineer.id)){
						%>
						<option value ="<%=engineer.id%>" selected="selected"><%=engineer.id%></option>
								<%} else{%>
						<option value ="<%=engineer.id%>"><%=engineer.id%></option>
						<%} }%>
						</select>
						</td>
						<td>
						<select style="width:80px" name="editsalerid">
						<%
							List<User> salerList = (List<User>) session.getAttribute("salerlist");
							int salernum = salerList.size();
							for(int k = 0; k < salernum; k++){
								User saler = salerList.get(k);
								if(order.salerid.equals(saler.id)){
						%>
						<option value ="<%=saler.id%>" selected="selected"><%=saler.id%></option>
								<%} else{%>
						<option value ="<%=saler.id%>"><%=saler.id%></option>
						<%} }%>
						</select>
						</td>
					</tr>
				</tbody>
				<thead>
					<tr>
						<th>送货服务</th>
						<th>安装调试</th>
						<th>上门服务</th>
						<th>安装单</th>
						<th>库房安装</th>
						<th>出库单号</th>
						<th>确认</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td><select style="width:80px" name="editisdeliver">
						<%if(order.isdeliver.equals("*")){ %><option value ="*" selected="selected"></option><%}else{ %><option value ="*"></option><%} %>
						<%if(order.isdeliver.equals("1")){ %><option value ="1" selected="selected">Yes</option><%}else{ %><option value ="1">Yes</option><%} %>
						<%if(order.isdeliver.equals("0")){ %><option value ="0" selected="selected">No</option><%}else{ %><option value ="0">No</option><%} %>
						</select></td>
						<td><select style="width:80px" name="editisdebug">
						<%if(order.isdebug.equals("*")){ %><option value ="*" selected="selected"></option><%}else{ %><option value ="*"></option><%} %>
						<%if(order.isdebug.equals("1")){ %><option value ="1" selected="selected">Yes</option><%}else{ %><option value ="1">Yes</option><%} %>
						<%if(order.isdebug.equals("0")){ %><option value ="0" selected="selected">No</option><%}else{ %><option value ="0">No</option><%} %>
						</select></td>
						<td><select style="width:80px" name="editisondoor">
						<%if(order.isondoor.equals("*")){ %><option value ="*" selected="selected"></option><%}else{ %><option value ="*"></option><%} %>
						<%if(order.isondoor.equals("1")){ %><option value ="1" selected="selected">Yes</option><%}else{ %><option value ="1">Yes</option><%} %>
						<%if(order.isondoor.equals("0")){ %><option value ="0" selected="selected">No</option><%}else{ %><option value ="0">No</option><%} %>
						</select></td>
						<td><input type="text" style="width:80px" name="editinstallid" value="<%=order.installid %>"></input></td>
						<td><select style="width:80px" name="editiswarehouse">
						<%if(order.iswarehouse.equals("*")){ %><option value ="*" selected="selected"></option><%}else{ %><option value ="*"></option><%} %>
						<%if(order.iswarehouse.equals("1")){ %><option value ="1" selected="selected">Yes</option><%}else{ %><option value ="1">Yes</option><%} %>
						<%if(order.iswarehouse.equals("0")){ %><option value ="0" selected="selected">No</option><%}else{ %><option value ="0">No</option><%} %>
						</select></td>
						<td><input type="text" style="width:80px" name="editwarehouseid" value="<%=order.warehouseid %>"></input></td>
						<td><button class="btn btn-info" type="submit" style="width:80px">修改</button></td>
					</tr>
				</tbody>
			</table>
			<%}else{
			%>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Task ID</th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td><%=order.id %></td>
						<td>
						<%if((order.status == 1) && (order.isaccepted.equals("1"))) {%>已接<%}else if(order.status == 2) {%>
						已接<%}else if(order.status == 3){ %>已完成<%} else{%>已审核<%} %>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>客户姓名</th>
						<th>客户电话</th>
						<th>客户单位</th>
						<th>客户地址</th>
						<th>分值</th>
						<th>工程师</th>
						<th>销售员</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td><input type="text" style="width:80px" name="editname" disabled value="<%=order.name%>"></input></td>
						<td><input type="text" style="width:80px" name="edittel" disabled value="<%=order.tel%>"></input></td>
						<td><input type="text" style="width:80px" name="editcompany" disabled value="<%=order.company%>"></input></td>
						<td><input type="text" style="width:80px" name="editaddress" disabled value="<%=order.address%>"></input></td>
						<td>
						<%if(order.status == 4){ %><input type="text" style="width:80px" name="editscore" disabled value="<%=order.score%>"></input>
						<%}else{ %><input type="text" style="width:80px" name="editscore" value="<%=order.score%>"></input><%} %>
						</td>
						<td>
						<select style="width:80px" name="editengineerid" disabled>
						<option value ="<%=order.engineerid%>" selected="selected"><%=order.engineerid%></option>
						</select>
						</td>
						<td>
						<select style="width:80px" name="editsalerid" disabled>
						<option value ="<%=order.salerid%>" selected="selected"><%=order.salerid%></option>
						</select>
						</td>
					</tr>
				</tbody>
				<thead>
					<tr>
						<th>送货服务</th>
						<th>安装调试</th>
						<th>上门服务</th>
						<th>安装单</th>
						<th>库房安装</th>
						<th>出库单号</th>
						<th>确认</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td><select style="width:80px" name="editisdeliver" disabled>
						<option value ="<%=order.isdeliver%>" selected="selected"><%=order.isdeliver%></option>
						</select></td>
						<td><select style="width:80px" name="editisdebug" disabled>
						<option value ="<%=order.isdebug%>" selected="selected"><%=order.isdebug%></option>
						</select></td>
						<td><select style="width:80px" name="editisondoor" disabled>
						<option value ="<%=order.isondoor%>" selected="selected"><%=order.isondoor%></option>
						</select></td>
						<td><input type="text" style="width:80px" name="editinstallid" disabled value="<%=order.installid %>"></input></td>
						<td><select style="width:80px" name="editiswarehouse" disabled>
						<option value ="<%=order.iswarehouse%>" selected="selected"><%=order.iswarehouse%></option>
						</select></td>
						<td><input type="text" style="width:80px" name="editwarehouseid" disabled value="<%=order.warehouseid%>"></input></td>
						<td>
						<%if(order.status == 4){ %><button class="btn btn-info" type="submit" style="width:80px" disabled>修改</button>
						<%}else{ %><button class="btn btn-info" type="submit" style="width:80px">修改</button><%} %>
						</td>
					</tr>
				</tbody>
			</table>
			<%} %>
			<input type="text" name="ordertaskprocessid" value="<%=order.processid%>"  style="display:none;"/>
			<input type="text" name="orderstatusinfo" value="<%=order.status%>"  style="display:none;"/>
			<input type="text" name="orderisacceptedinfo" value="<%=order.isaccepted%>"  style="display:none;"/>
			<input type="text" name="orderoldscore" value="<%=order.score%>"  style="display:none;"/>
			</form>
				</div>
			</div>
		</div>
	</div>

  <!--bootstrap需要依赖jQuery，所以必须在他之前先引入jQuery-->
  <script src="<%=basePath %>js/jquery-3.1.0.min.js"></script>
  <script src="<%=basePath %>js/bootstrap.js"></script>
</body>
</html>