<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/loginFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<header>
		<jsp:include page="/Menu.jsp" />
	</header>
	
	<section>
		<div id="content">
			<div class="content_div">
				<div class="login_form">
					<div class="login_status">
						<div class="radio_status">
							<label class="status" style="margin:0 5px;">
								<input type="radio" name="status" value="guest" checked="checked"><span>게스트</span>
							</label>
							<label class="status">
								<input type="radio" name="status" value="host"><span>호스트</span>
							</label>
						</div>
					</div>
					<div class="login_description">
						<span class="text1">로 그 인<br></span>
						<span class="text2">더 다양한 활동을 즐겨보세요!</span>
					</div>
					<div class="input_area">
						<input type="text" class="login_text" placeholder="USER ID">
						<input type="password" class="login_text" placeholder="PASSWORD">
					</div>
					
					<button class="btn login_btn" type="submit">로 그 인</button>
					<div class="login_menu">
						<a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a> | <a href="#">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>

</body>
</html>