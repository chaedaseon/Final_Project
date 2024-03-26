<!-- 
	비밀번호 재설정 페이지
 	아이디, 이름, 전화번호 일치 여부 확인 후, 비밀번호 재설정 가능.
 -->

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
<title>SearchPwForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/joinPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">


	$(document).ready(function()
	{
		$("#searchPwBtn").click(function()
		{	
			var userType = $("input[name='userType']:checked").val();
			
			var info = "userType=" + userType
						+ "&searchType=id"
						+ "&searchPwId=" + $.trim($("#searchPwId").val())
						+ "&searchPwName=" + $.trim($("#searchPwName").val())
						+ "&searchPwTel=" + $.trim($("#searchPwTel1").val()) + $.trim($("#searchPwTel2").val()) + $.trim($("#searchPwTel3").val());				
			
			$.ajax(
			{
				type:"POST"
				, url:"searchpw.do"
				, data:info
				, success:function(args)
				{
					var searchPw = args;
					
					if (searchPw != null)
					{
						
						$(".search_account").css("display", "none");
						$(".radio_status").css("display", "none");
						$(".search_result").css("display", "flex");
						$(".search_result").css("align-items", "center");
						
						$(".search_result_btn").css("display", "block");
					}
					else
						alert("일치하는 정보가 존재하지 않습니다.");
				}
				, error:function(e)
				{
					alert("일치하는 정보가 존재하지 않습니다.");
				}
			});
			
			var regPw = /^[a-zA-Z0-9\!@#$%^&*]{8,16}$/;
			
			// 1. 비밀번호 정규식 확인
			$("#searchPwId1").keyup(function()
			{
				var searchPwId = $("#searchPwId1").val();
				
				// 입력한 값이 없을 경우
				if(searchPwId == null || searchPwId == "")
				{
					$(".pwErrMsg").css("display", "none");
					$(".pwOkMsg").css("display", "none");
					$(".pwNullMsg").css("display", "flex");
				}
				// pw 정규식 검사
				else if(!regPw.test(searchPwId))
				{
					$(".pwErrMsg").css("display", "flex");
					$(".pwOkMsg").css("display", "none");
					$(".pwNullMsg").css("display", "none");
				}
				else
				{
					$(".pwErrMsg").css("display", "none");
					$(".pwOkMsg").css("display", "flex");
					$(".pwNullMsg").css("display", "none");
				}
				
			});// 비밀번호 정규식 확인 end
			
			// 2. 비밀번호 확인란에 입력된 비밀번호가 동일한지 체크
			$("#searchPwId2").keyup(function()
			{
				var searchPwId1 = $("#searchPwId1").val();	
				var searchPwId2 = $("#searchPwId2").val();
				
				if (searchPwId1 != searchPwId2)
				{
					$(".pw2ErrMsg").css("display", "flex");
					$(".pw2OkMsg").css("display", "none");
				}
				else
				{
					$(".pw2OkMsg").css("display", "flex");
					$(".pw2ErrMsg").css("display", "none");
				}
			});// 비밀번호 일치 여부 확인 end
			
		});
		
	});

</script>


</head>
<body>

	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div class="content_div">
				<div class="join_div">
				
					<div class="join_form">
						<div class="login_description">
							<span style="color: #94bc32; font-weight: bold; font-size: 38px;">비밀번호<span style="color: #5b5b5b; font-size: 20px;"> 재설정</span></span>
							<div class="radio_status" id="userType">
								<label class="userType" style="border-right: 2px solid #e1e1e1;">
									<input type="radio" name="userType" value="guest"><span>게스트</span>
								</label>
								<label class="userType">
									<input type="radio" name="userType" value="host"><span>호스트</span>
								</label>
							</div>
						</div>
								
						<div class="underline"></div>
						
						<div class="search_account">
							<table>
								<tr>
									<td class="join_title"><span>아이디</span></td>
									<td class="join_input"><input type="text" name="searchPwId" id="searchPwId" class="join_text" required="required" placeholder="아이디를 입력해주세요"></td>
								</tr>
								<tr>
									<td class="join_title"><span>이름</span></td>
									<td class="join_input"><input type="text" name="searchPwName" id="searchPwName" class="join_text" required="required" placeholder="이름을 입력해주세요"></td>
								</tr>
								<tr>
									<td class="join_title"><span>전화번호</span></td>
									<td>
										<input type="tel" name="searchPwTel1" id="searchPwTel1" class="join_text" style="width: 68px;" required="required">
										 - <input type="tel" name="searchPwTel2" id="searchPwTel2" class="join_text" style="width: 75px;" required="required">
										 - <input type="tel" name="searchPwTel3" id="searchPwTel3" class="join_text" style="width: 75px;" required="required">
									</td>
								</tr>
							</table>
						</div>
						
						<div class="search_result" style="height: 120px;">
							<div>
								<table>
								<tr>
									<td class="join_title"><span>비밀번호</span></td>
									<td class="join_input"><input type="password" name="searchPwId1" id="searchPwId1" class="join_text" required="required" placeholder="비밀번호를 입력해주세요"></td>
								</tr>
								<tr>
									<td class="join_title"><span>비밀번호 확인</span></td>
									<td class="join_input"><input type="password" name="searchPwId2" id="searchPwId2" class="join_text" required="required" placeholder="비밀번호를 입력해주세요"></td>
								</tr>
								</table>
							</div>
							
						</div>
						
							<div class="underline"></div>
							
							<div class="search_account">
								<div style="margin-bottom:10px;">
									<button type="button" class="signUp" id="searchPwBtn">비밀번호 찾기</button>
								</div>
							</div>
							
							<div class="search_result_btn">
								<div> 
									<button type="button" class="signUp" id="updatePwBtn">비밀번호 재설정</button>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>