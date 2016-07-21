<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
  <title>Deliver Login!</title>
  <link rel="stylesheet" href="<%=basePath %>css/bootstrap.css">
</head>
<body>
	<div class="container">
	<div class="row">
		<div class="span6">
			<blockquote>
				<p>OnlineMaintenance在线Deliver登陆系统.</p> <small>请用Deliver账号登陆，其余账号无法登陆。</small>
			</blockquote>
		</div>
		<div class="span6">
			<form class="form-horizontal" action="login">
				<div class="control-group">
					 <label class="control-label" for="inputEmail">用户名</label>
					<div class="controls">
						<input name="username" type="text" />
					</div>
				</div>
				<div class="control-group">
					 <label class="control-label" for="inputPassword">密码</label>
					<div class="controls">
						<input name="password" type="password" />
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						 <label class="checkbox"></label> <button type="submit" class="btn">登陆</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
  <!--bootstrap需要依赖jQuery，所以必须在他之前先引入jQuery-->
  <script src="<%= basePath %>js/jquery-3.1.0.min.js"></script>
  <script src="<%= basePath %>js/bootstrap.js"></script>
</body>
</html>