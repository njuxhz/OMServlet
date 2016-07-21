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
  <title>Orders!</title>

  <link rel="stylesheet" href="<%=basePath %>css/bootstrap.css">
</head>
<body>
<script language="javascript">
function f_show(company, name, tel){
	document.getElementById("newcompany").value = company;
	document.getElementById("newname").value = name;
	document.getElementById("newtel").value = tel;
}
</script>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<blockquote>
				<p>您可以创建一张新的维修单.</p> <small>带*为必填</small>
				<button class="btn btn-info" onclick="window.location.href='Login.jsp';">返回</button>
			</blockquote>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<div class="row">
				<div class="span12">
			<form action="create">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>客户姓名*</th>
						<th>客户电话*</th>
						<th>客户单位*</th>
						<th>客户地址*</th>
						<th>分值*</th>
						<th>工程师*</th>
						<th>销售员*</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td><input type="text" style="width:80px" id="newname" name="createname"></input></td>
						<td><input type="text" style="width:80px" id="newtel" name="createtel"></input></td>
						<td><input type="text" style="width:80px" id="newcompany" name="createcompany"></input></td>
						<td><input type="text" style="width:80px" name="createaddress"></input></td>
						<td><input type="text" style="width:80px" name="createscore"></input></td>
						<td>
						<select style="width:80px" name="createengineerid">
						<%
							List<User> engineerList = (List<User>) session.getAttribute("engineerlist");
							int engineernum = engineerList.size();
							for(int j = 0; j < engineernum; j++){
								User engineer = engineerList.get(j);
						%>
						<option value ="<%=engineer.id%>"><%=engineer.id%></option>
						<%} %>
						</select>
						</td>
						<td>
						<select style="width:80px" name="createsalerid">
						<%
							List<User> salerList = (List<User>) session.getAttribute("salerlist");
							int salernum = salerList.size();
							for(int k = 0; k < salernum; k++){
								User saler = salerList.get(k);
						%>
						<option value ="<%=saler.id%>"><%=saler.id%></option>
						<%} %>
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
						<td><select style="width:80px" name="createisdeliver">
						<option value ="*"></option><option value ="1">Yes</option><option value="0">No</option></select></td>
						<td><select style="width:80px" name="createisdebug">
						<option value ="*"></option><option value ="1">Yes</option><option value="0">No</option></select></td>
						<td><select style="width:80px" name="createisondoor">
						<option value ="*"></option><option value ="1">Yes</option><option value="0">No</option></select></td>
						<td><input type="text" style="width:80px" name="createinstallid"></input></td>
						<td><select style="width:80px" name="createiswarehouse">
						<option value ="*"></option> <option value ="1">Yes</option>  <option value="0">No</option></select></td>
						<td><input type="text" style="width:80px" name="createwarehouseid"></input></td>
						<td><button class="btn btn-info" type="submit" style="width:80px">创建</button></td>
					</tr>
				</tbody>
			</table>
			</form>
				</div>
			</div>
		</div>
	</div>
<div>
	<%
		List<Order> orderList = (List<Order>) session.getAttribute("orderlist");
		int num = orderList.size();
		int unacceptednum = ((Integer) session.getAttribute("unacceptednum")).intValue();
		int others = ((Integer) session.getAttribute("others")).intValue();
		if(unacceptednum >= 1){
	%>
		<div class="span12">
			<blockquote>
				<p>未接维修单列表.</p> <small>您可以对这些维修单进行修改</small>
			</blockquote>
		</div>
		
		<%
			for(int i = 0; i < num; i++){
				Order order = orderList.get(i);
				if((order.status == 1) && (order.isaccepted.equals("0"))){
		%>
		
		<div>
				<table class="table table-bordered">
				<thead>
					<tr>
						<th>Task ID</th>
						<th>客户姓名</th>
						<th>客户电话</th>
						<th>客户单位</th>				
						<th>详细信息</th>
						<th>自动填单</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td><input type="text" style="width:80px" disabled value="<%=order.id%>"></input></td>
						<td><input type="text" style="width:80px" disabled value="<%=order.name%>"></input></td>
						<td><input type="text" style="width:80px" disabled value="<%=order.tel%>"></input></td>
						<td><input type="text" style="width:80px" disabled value="<%=order.company%>"></input></td>
						<td>
						<form action="mydetail" method="post">
						<input type="text" name="taskid" value="<%=order.id%>"  style="display:none;"/>
						<button class="btn btn-info" type="submit" style="width:100px">详细信息</button>
						</form>
						</td>
						<td><button class="btn btn-info" type="button" style="width:100px" onclick="f_show('<%=order.company %>', '<%=order.name %>', '<%=order.tel %>');">自动填单</button></td>
					</tr>
				</tbody>
			</table>
			<br/>
		</div>
		<%}}}
			if(others >= 1){
		%>
	
		<div class="span12">
			<blockquote>
				<p>其他维修单列表.</p> <small>您仅可对这些维修单进行分数修改或不能修改（已审核维修单）</small>
			</blockquote>
		</div>
		
		<%
			for(int i = 0; i < num; i++){
				Order order = orderList.get(i);
				if((order.status == 1) && (order.isaccepted.equals("0"))){}else{
		%>
		
		<div>
				<table class="table table-bordered">
				<thead>
					<tr>
						<th>Task ID</th>
						<th>客户姓名</th>
						<th>客户电话</th>
						<th>客户单位</th>				
						<th>详细信息</th>
						<th>自动填单</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td><input type="text" style="width:80px" disabled value="<%=order.id%>"></input></td>
						<td><input type="text" style="width:80px" disabled value="<%=order.name%>"></input></td>
						<td><input type="text" style="width:80px" disabled value="<%=order.tel%>"></input></td>
						<td><input type="text" style="width:80px" disabled value="<%=order.company%>"></input></td>
						<td>
						<form action="mydetail" method="post">
						<input type="text" name="taskid" value="<%=order.id%>"  style="display:none;"/>
						<button class="btn btn-info" type="submit" style="width:100px">详细信息</button>
						</form>
						</td>
						<td><button class="btn btn-info" type="button" style="width:100px" onclick="f_show('<%=order.company %>', '<%=order.name %>', '<%=order.tel %>');">自动填单</button></td>
					</tr>
				</tbody>
			</table>
			<br/>
		</div>
		<%}}} %>
</div>
	

	
  <!--bootstrap需要依赖jQuery，所以必须在他之前先引入jQuery-->
  <script src="<%=basePath %>js/jquery-3.1.0.min.js"></script>
  <script src="<%=basePath %>js/bootstrap.js"></script>
</body>
</html>