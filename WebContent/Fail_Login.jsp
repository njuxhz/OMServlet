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
  <title>Fail Login</title>

  <link rel="stylesheet" href="<%=basePath %>css/bootstrap.css">
</head>
<body>
	<div class="container">
	<div class="row">
		<div class="span6">
			<blockquote>
				<p>
					Sorry. You seem to have wrong login information or you are not a deliver.
				</p> <small>Please try again!</small>
			</blockquote>
		</div>
		<div class="span6">
			 <button class="btn btn-success" type="button" onclick="javascript:history.back(-1);" >返回</button>
		</div>
	</div>
	</div>
  <!--bootstrap需要依赖jQuery，所以必须在他之前先引入jQuery-->
  <script src="<%=basePath %>js/jquery-3.1.0.min.js"></script>
  <script src="<%=basePath %>js/bootstrap.js"></script>
</body>
</html>