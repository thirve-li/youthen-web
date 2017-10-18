<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/inc.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
					<form name="pageForm" id="pageForm" method="post" action="${path}/lj-admin/listUser.action">
						<s:hidden name="userDto.gotoPage" id="gotoPage" theme="simple" />
						<p style="margin-left: 25px; margin-top: 10px;">
						姓名：
						<input name="userDto.name" id="name" type="text" style="wuserDtoh: 180px;" value="${userDto.name}" />&nbsp;&nbsp;&nbsp;
							性别 <select name="userDto.sex" id="sex" class="select_01"
								style="width: 100px;">
								<option value=""
									<c:if test="${userDto.sex == null }"> selected </c:if>>请选择</option>
								<option value="0"
									<c:if test="${userDto.sex == '男' }"> selected </c:if>>男</option>
								<option value="1"
									<c:if test="${userDto.sex == '女' }"> selected </c:if>>女</option>
							 </select> &nbsp;&nbsp;&nbsp; 
					 
				          	积分:<input name="userDto.score" id="score" type="text"
								style="width: 180px;" value="${userDto.score}" />&nbsp;&nbsp;&nbsp;
					 
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
							<th>积分</th>
							<th>操作 </th>
						</tr>
						<c:forEach items="${userList }" var="user">
							<tr>
								<td>${user.name }</td>
								<td>${user.nickName}&nbsp;</td>
								<td>${user.mobile }&nbsp; </td>
								<td>${user.email} &nbsp;</td>
								<td>${user.score} </td>
								<td> </td>
							</tr>
						</c:forEach>

					</table>
				 
				 

				<div class="fy" style="width: 82%; margin-top: 10px">
					<p>
						第
						${userDto.gotoPage}
						页 , 共
						${userDto.pages}
						页 , 共
						<s:property value="userDto.listSize" />
						条 <a href="#" onclick="doSearch(1)" class="fy_left0"></a>
						<s:if test="userDto.gotoPage-1 > 0 ">
							<a href="#"
								onclick="doSearch(${userDto.gotoPage-1})"
								class="fy_left"></a>
						</s:if>
						<s:else>
							<a href="#" class="fy_left"></a>
						</s:else>

						<s:if test="userDto.gotoPage+1 <= userDto.pages ">
							<a href="#"
								onclick="doSearch(${userDto.gotoPage+1})"
								class="fy_right"></a>
						</s:if>
						<s:else>
							<a href="#" class="fy_right"></a>
						</s:else>
						<a href="#" onclick="doSearch(${userDto.pages})"
							class="fy_right0"></a>
					</p>
				</div>
			</div>
		</div>
	</body>
</html>