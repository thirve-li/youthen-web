<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!–[if lte IE 8]>
<meta http-equiv=”x-ua-compatible” content=”ie=7″ />
<![endif]–>
<!–[if IE 9]>
<meta http-equiv=”x-ua-compatible” content=”ie=9″ />
<![endif]–>
<meta http-equiv="Content-Type">
	<title>易理家物业后台管理系统</title>
	<link type="text/css" rel="stylesheet"
		href="../lj-resources/lj-css/style.css" />
	<link href="../lj-resources/lj-css/lj.css" rel="stylesheet"
		type="text/css" />
	<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../lj-resources/lj-js/menu.js"></script>
	</head>
	<script type="text/javascript">
	function doSearch(gotoPage) {
		$("#gotoPage").val(gotoPage);
		document.forms[0].submit(); // 提交表单
	}
</script>
	<body>
		<div class="right-nav">
			<ul>
				<li><img src="../lj-resources/lj-images/home.png"></li>
				<li style="margin-left: 25px;">您当前的位置：</li>
					<li>用户管理</li>
					<li>></li>
					<li>注册用户</li>
			</ul>
		</div>
		<div class="main">
			<div class="glkList">
				<div>
					<form name="pageForm" id="pageForm" method="post"
						action="${path}/mst-notice/list.action">
						<s:hidden name="dto.gotoPage" id="gotoPage" theme="simple" />
						<s:hidden name="dto.type" />
						<p style="margin-left: 25px; margin-top: 10px;">
						公告名：
						<input name="dto.name" id="name" type="text" style="width: 180px;" value="${dto.name}" />&nbsp;&nbsp;&nbsp;
					 
							状态 <select name="dto.status" id="status" class="select_01"
								style="width: 100px;">
								<option value=""
									<c:if test="${dto.status == null }"> selected </c:if>>请选择</option>
								<option value="0"
									<c:if test="${dto.status == 0 }"> selected </c:if>>失效</option>
								<option value="1"
									<c:if test="${dto.status == 1 }"> selected </c:if>>有效</option>
							 </select> &nbsp;&nbsp;&nbsp; 
					 
				          	内容:<input name="dto.theContent" id="theContent" type="text"
								style="width: 180px;" value="${dto.theContent}" />&nbsp;&nbsp;&nbsp;
					 
							 <a id="gotoPage" href="#"
								onclick="doSearch(1)" class="button_01">查询</a>
					</form>
					</p>
				</div>
				 
					<table
						style="margin-left: 25px; margin-top: 10px; border: 1px solid #808080; width: 96%; text-align: center;">
						<tr>
							<th>姓名</th>
							<th>昵称</th>
							<th>手机</th>
							<th>email</th>
							<th>操作 </th>
						</tr>
						<c:forEach items="${userList }" var="user">
							<tr>
								<td>${notice.name }</td>
								<td>${user.nickName}</td>
								<td>${notice.mobile } </td>
								<td>${notice.email} </td>
								<td> </td>
							</tr>
						</c:forEach>

					</table>
				 
				 

				<div class="fy" style="width: 82%; margin-top: 10px">
					<p>
						第
						<s:property value="dto.gotoPage" />
						页 , 共
						<s:property value="dto.pages" />
						页 , 共
						<s:property value="dto.listSize" />
						条 <a href="#" onclick="doSearch(1)" class="fy_left0"></a>
						<s:if test="dto.gotoPage-1 > 0 ">
							<a href="#"
								onclick="doSearch(<s:property value="dto.gotoPage-1" />)"
								class="fy_left"></a>
						</s:if>
						<s:else>
							<a href="#" class="fy_left"></a>
						</s:else>

						<s:if test="dto.gotoPage+1 <= dto.pages ">
							<a href="#"
								onclick="doSearch(<s:property value="dto.gotoPage+1" />)"
								class="fy_right"></a>
						</s:if>
						<s:else>
							<a href="#" class="fy_right"></a>
						</s:else>
						<a href="#" onclick="doSearch(<s:property value="dto.pages" />)"
							class="fy_right0"></a>
					</p>
				</div>
			</div>
		</div>
	</body>
</html>