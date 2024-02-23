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
<title>ModifyInfoForm.jsp</title>
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
				
				<div class="modify_info">
					<table>
						<tr>
							<td><span>아이디</span></td>
							<td><input type="text" class="modify_text" readonly="readonly"></td>
						</tr>
						<tr>
							<td><span>이름</span></td>
							<td><input type="text" class="modify_text" readonly="readonly"></td>
						</tr>
						<tr>
							<td><span>비밀번호</span></td>
							<td><input type="password" class="modify_text"></td>
						</tr>
						<tr>
							<td><span>비밀번호 확인</span></td>
							<td><input type="password" class="modify_text"></td>
						</tr>
						<tr>
							<td><span>닉네임</span></td>
							<td><input type="text" class="modify_text"></td>
							<td><button type="button">중복 확인</button></td>
						</tr>
						<tr>
							<td><span>전화번호</span></td>
							<td><input type="tel" class="modify_text" style="width: 50px;"> - <input type="tel" class="modify_text" style="width: 60px;"> - <input type="tel" class="modify_text" style="width: 60px;"></td>
						</tr>
						<tr>
							<td><span>이메일</span></td>
							<td><input type="text" class="modify_text" style="width: 85px;"> @ <input type="text" class="modify_text" style="width: 92px;"></td>
						</tr>
						<tr>
							<td colspan="3">
								<button type="submit">정보 수정</button>
							</td>
						</tr>
					</table>
				</div>
				
				
				
			</div>
		</div>
		 
	</section>
	
	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>

</body>
</html>