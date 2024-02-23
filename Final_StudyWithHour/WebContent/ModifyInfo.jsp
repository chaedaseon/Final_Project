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
<title>ModifyConfirm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/modifyInfoStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<header>
		<jsp:include page="/Menu.jsp" />
	</header>
	
	<section>
	
		<div>
			<jsp:include page="/SideMenu.jsp" />
		</div>
		
		<div id="content">
			<div class="content_div">
				<div class="modify_title">
					<span>정보 수정</span>
				</div>
				
				<div class="input_pw">
					<span class="text1">비밀번호 입력</span><br>
					<span class="text2">정보 수정을 위해 비밀번호를 입력해주세요.</span><br>
					<div class="input_area">
						<input type="password" class="pw_text" placeholder="비밀번호">
						<button class="btn" type="submit">확인</button>
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