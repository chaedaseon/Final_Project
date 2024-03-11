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
<title>HostModifyForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<header>
		<c:import url="Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<c:import url="SideMenu.jsp"></c:import>
			
			<div class="rightContent_div">
				<div class="register_div">
					<div class="register_description">
						<span style="color: #94bc32; font-weight: bold; font-size: 38px;">정보수정</span><span style="color: #212529; font-size: 20px;"> 을 위해 정보를 입력해주세요</span>
					</div>	
					
					<div class="underline"></div>
					
					<div class="register_form">
						<table>
							<tr>
								<td class="register_title"><span>아이디</span></td>
								<td class="register_input"><input type="text" class="register_text" placeholder="" readonly="readonly"></td>
							</tr>
							<tr>
								<td class="register_title"><span>비밀번호</span></td>
								<td class="register_input" colspan="2"><input type="password" class="register_text"></td>
							</tr>
							<tr>
								<td class="register_title"><span>비밀번호 확인</span></td>
								<td class="register_input"><input type="password" class="register_text"></td>
							</tr>
							<tr>
								<td class="register_title"><span>이름</span></td>
								<td class="register_input"><input type="text" class="register_text" placeholder="" readonly="readonly"></td>
							</tr>
							<tr>
								<td class="register_title"><span>전화번호</span></td>
								<td class="register_input"><input type="tel" class="register_text" style="width: 68px;" placeholder="" required="required"> - <input type="tel" class="register_text" style="width: 75px;"> - <input type="tel" class="register_text" style="width: 75px;"></td>
							</tr>
							<tr>
								<td class="register_title"><span>주민등록번호</span></td>
								<td class="register_input">
									<input type="text" class="register_text" style="width: 114px;" placeholder="" readonly="readonly"> - <input type="password" class="register_text" style="width: 120px;" placeholder="" readonly="readonly">
								</td>
							</tr>											
							<tr>
								<td class="register_title"><span>이메일</span></td>
								<td class="register_input">
									<input type="text" class="register_text" style="width: 110px;" placeholder="" required="required"> @ <input type="text" class="register_text" style="width: 115px;" placeholder="" required="required">
								</td>
							</tr>
						</table>
					
					</div>
				
					<div class="underline"></div>
					
					<button type="reset" class="signUp" style="margin-left: 10px;">취 소</button>
					<button type="submit" class="signUp" onclick="location.href='#'">수 정</button>
						
				</div>
			</div>
		</div>
	</section>	
	
	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>

</body>
</html>