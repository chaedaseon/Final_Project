<%@page import="com.test.mvc.GuestDTO"%>
<%@page import="com.test.mvc.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 게스트 세션 받아오기
	GuestDTO guest = (GuestDTO) session.getAttribute("guest");
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
<link rel="stylesheet" type="text/css" href="css/guestPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	function checkPw()
	{
		// 비밀번호 중복 확인 여부
		var inputPw = document.getElementById("inputPw").value;
		var pw = "<%=guest.getGuPw() %>";
		
		var u
		
		if (inputPw == pw)
		{
			alert("비밀번호 일치!");
			$(".modify_pw").css("display", "none");
			$(".modify_info").css("display", "block");
		}
		else
		{
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			// 입력창 초기화
			document.getElementById("inputPw").value = "";
		}
	}

</script>

</head>
<body>

	<header>
		<jsp:include page="/Menu.jsp" />
	</header>
	
	<section>
	
		<div>
		
			<div id="content">
				<c:import url="SideMenu.jsp"></c:import>
				<div class="rightContent_div">
			
					<div class="page_title">
						<span><span>정보</span> 수정</span>
					</div>
					
					<div class="modify_pw">
						비밀번호를 입력해주세요.
						
						<div>
							<input type="text" id="inputPw" />
						</div>
						<div>
							<button type="button" onclick="checkPw()">확인</button>
						</div>
						
					</div>
					
					<div class="modify_info" style="display: none;">
					
						<div class="modify_form">
							<table class="join_table">
								<tr>
									<td class="join_title"><span>아이디</span></td>
									<td class="join_input"><input type="text" name="guId" id="guId" class="join_text" readonly="readonly" value="<%=guest.getGuId() %>"></td>
									<td><span class="doubleCheck" id="idCheck"></span></td>
								</tr>
								<tr>
									<td class="join_title"><span>비밀번호</span></td>
									<td class="join_input"><input type="password" name="guPw" id="guPw1" class="join_text" placeholder="비밀번호를 입력해주세요" required="required"></td>
								</tr>
								<tr>
									<td class="join_title"><span>비밀번호 확인</span></td>
									<td class="join_input"><input type="password" name="guPw" id="guPw2" class="join_text" placeholder="비밀번호 확인" required="required"></td>
								</tr>
								<tr>
									<td class="join_title"><span>이름</span></td>
									<td class="join_input"><input type="text" name="guName" id="guName" class="join_text" readonly="readonly" value="<%=guest.getGuName() %>"></td>
								</tr>
								<%-- <tr>
									<td class="join_title"><span>전화번호</span></td>
									<td class="join_input">
										<input type="tel" name="guTel1" id="guTel1" class="join_text" style="width: 68px;" required="required" value="<%=guest.getGuTel().substring(0,3)%>">
										 - <input type="tel" name="guTel2" id="guTel2" class="join_text" style="width: 75px;" required="required" value="<%=guest.getGuTel().substring(3,7)%>">
										 - <input type="tel" name="guTel3" id="guTel3" class="join_text" style="width: 75px;" required="required"  value="<%=guest.getGuTel().substring(7,11)%>">
									 </td>
								</tr> --%>
								<tr>
									<td class="join_title"><span>이메일</span></td>
									<td class="join_input"><input type="email" name="guEmail" id="guEmail" class="join_text" value="<%=guest.getGuEmail() %>" required="required">
								</tr>
								<tr>
									<td class="join_title"><span>닉네임</span></td>
									<td class="join_input"><input type="text" name="guNick" id="guNick" class="join_text" value="<%=guest.getGuNick()%>" required="required"></td>
									<td><button type="button" class="double_check">중복 확인</button></td>
								</tr>
							</table>
							<div class="underline"></div>
						<button type="submit" class="signUp" id="joinBtn">정보수정</button>
					</div>
					
					
					</div>
					
				</div>
			</div>	
				
				
				<!-- <div class="modify_info">
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
				</div> -->
				
				
				
			</div>
		</div>
		 
	</section>
	
	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>

</body>
</html>