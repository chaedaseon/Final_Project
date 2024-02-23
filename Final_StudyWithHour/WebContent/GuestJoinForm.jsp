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
<title>GuestJoinForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/joinFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<header>
		<c:import url="Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div class="content_div">
				<div class="join_div">
					<div class="join_description">
						<span style="color: #94bc32; font-weight: bold; font-size: 38px;">게스트</span><span style="color: #212529; font-size: 20px;"> 회원가입을 위해 정보를 입력해주세요</span>
					</div>	
					
					<div class="underline"></div>
					
					<div class="join_form">
						<table>
							<tr>
								<td class="join_title"><span>아이디</span></td>
								<td class="join_input"><input type="text" class="join_text"></td>
								<td><button type="button" class="double_check">중복 확인</button></td>
							</tr>
							<tr>
								<td class="join_title"><span>비밀번호</span></td>
								<td class="join_input" colspan="2"><input type="password" class="join_text"></td>
							</tr>
							<tr>
								<td class="join_title"><span>비밀번호 확인</span></td>
								<td class="join_input"><input type="password" class="join_text"></td>
							</tr>
							<tr>
								<td class="join_title"><span>이름</span></td>
								<td class="join_input"><input type="text" class="join_text"></td>
							</tr>
							<tr>
								<td class="join_title"><span>주민등록번호</span></td>
								<td class="join_input"><input type="text" class="join_text" style="width: 114px;"> - <input type="password" class="join_text" style="width: 120px;"></td>
							</tr>
							<tr>
								<td class="join_title"><span>전화번호</span></td>
								<td class="join_input"><input type="tel" class="join_text" style="width: 68px;"> - <input type="tel" class="join_text" style="width: 75px;"> - <input type="tel" class="join_text" style="width: 75px;"></td>
							</tr>
							<tr>
								<td class="join_title"><span>이메일</span></td>
								<td class="join_input"><input type="text" class="join_text" style="width: 110px;"> @ <input type="text" class="join_text" style="width: 115px;"></td>
							</tr>
							<tr>
								<td class="join_title"><span>닉네임</span></td>
								<td class="join_input"><input type="text" class="join_text"></td>
								<td><button type="button" class="double_check">중복 확인</button></td>
							</tr>
							<tr>
								<td><span>가입목적</span></td>
								<td class="join_input">
									<select class="join_text">
										<option value="">-- 선택해주세요 ▼ --</option>
										<option value="">자격증</option>
										<option value="">취미</option>
										<option value="">학점관리</option>
										<option value="">자기계발</option>
									</select>
								</td>
							</tr>
						</table>
					
					</div>
				
					<div class="underline"></div>
					
					<button type="submit" class="signUp">회 원 가 입</button>
						
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>

</body>
</html>