<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String message = request.getParameter("message");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/joinPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">


	// 로그인 실패 시, 실패 안내 출력
	$(document).ready(function()
	{
		var message = "<%=message %>";
		
		if (message == "error")
		{
			$(".errMsg").css("display", "block");
		}
	})
	
	
	$("#loginBtn").click(function()
	{
		$("#loginForm").submit();
	});
	
</script>


</head>
<body>

	<header>
		<c:import url="/Menu.jsp"></c:import>
	</header>
	
	
	<section>
		<div id="content">
			<div class="content_div">
				<div class="join_div">
				
					<div class="join_form">
						<form action="login.do?" method="post" id="loginForm">
							<div class="login_status">
							</div>
				
							<div class="login_description">
								<span style="color: #94bc32; font-weight: bold; font-size: 38px;">로그인</span>
								<div class="radio_status">
									<label class="userType">
										<input type="radio" name=userType value="admin" checked="checked">
									</label>
									<label class="userType" style="border-right: 2px solid #e1e1e1;">
										<input type="radio" name=userType value="guest"><span>게스트</span>
									</label>
									<label class="userType">
										<input type="radio" name="userType" value="host"><span>호스트</span>
									</label>
								</div>
							</div>
								
							<div class="underline"></div>
							
							<table style="margin-top: 40px;">
								<tr>
									<td class="join_title"><span>아이디</span></td>
									<td><input type="text" class="login_text" name="userId" placeholder="아이디를 입력해주세요" required="required"></td>
								</tr>
								<tr>
									<td class="join_title"><span>비밀번호</span></td>
									<td><input type="password" class="login_text" name="userPw" placeholder="비밀번호를 입력해주세요" required="required"></td>
								</tr>
							</table>
							<div style="height: 30px;">
								<div style="display: none;" class="errMsg">
									<span>🚫아이디 또는 비밀번호를 잘못 입력하였습니다🚫</span>
								</div>
							</div>
							<div class="underline"></div>
							<div style="margin-bottom:10px;">
								<button type="submit" class="signUp" id="loginBtn">로  그  인</button>
							</div>
						<div class="login_menu">
							<a href="searchidform.do?type=id">아이디 찾기</a> &nbsp;|&nbsp; <a href="searchidform.do?type=pw">비밀번호 찾기</a> &nbsp;|&nbsp; <a href="jointype.do">회원가입</a>
						</div>
						</form>
					</div>
						
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<c:import url="/Footer.jsp"></c:import>
	</footer>

</body>
</html>