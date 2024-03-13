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
<title>SearchIdForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/joinPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">


	$(function()
	{
		$("#searchIdBtn").click(function()
		{	
			var userType = $("input[name='userType']:checked").val();
			
			var info = "userType=" + userType
						+ "&searchType=id"
						+ "&searchIdName=" + $.trim($("#searchIdName").val())
						+ "&searchIdTel=" + $.trim($("#searchIdTel1").val()) + $.trim($("#searchIdTel2").val()) + $.trim($("#searchIdTel3").val());				
			
			$.ajax(
			{
				type:"POST"
				, url:"searchid.do"
				, data:info
				, success:function(args)
				{
					var result = args;
					
					if (result != null)
					{
						$(".search_account").css("display", "none");
						$(".search_result").css("display", "block");
						$(".search_result_btn").css("display", "block");
						$(".radio_status").css("display","none");
						
						//alert(typeof resultId);
						//alert(resultId.substring(0,7));
						
						//alert(result.substring(0,7));
						
						//alert(result.replaceAll(result.substring(7), "*"));
						
						
						//var resultId = result.substring(0,7) + result.substring(7).replaceAll('*');
						
						$("#searchId").html(result);
					}					
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
		});
	});

</script>


</head>
<body>

	<header>
		<c:import url="Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div class="content_div">
				<div class="join_div">
				
					<div class="join_form">
						<div class="login_description">
							<span style="color: #94bc32; font-weight: bold; font-size: 38px;">아이디<span style="color: #5b5b5b; font-size: 20px;"> 찾기</span></span>
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
									<td class="join_title"><span>이름</span></td>
									<td class="join_input"><input type="text" name="userName" id="searchIdName" class="join_text" required="required" placeholder="이름을 입력해주세요"></td>
								</tr>
								<tr>
									<td class="join_title"><span>전화번호</span></td>
									<td>
										<input type="tel" name="userTel1" id="searchIdTel1" class="join_text" style="width: 68px;" required="required">
										 - <input type="tel" name="userTel2" id="searchIdTel2" class="join_text" style="width: 75px;" required="required">
										 - <input type="tel" name="userTel3" id="searchIdTel3" class="join_text" style="width: 75px;" required="required">
									</td>
								</tr>
							</table>
						</div>
						
						<div class="search_result">
							회원님의 아이디는 아래와 같습니다.<br>
							<span id="searchId"></span>
						</div>
						
							<div class="underline"></div>
							
							<div class="search_account">
								<div style="margin-bottom:10px;">
									<button type="button" class="signUp" id="searchIdBtn">아이디 찾기</button>
								</div>
							</div>
							
							<div class="search_result_btn">
								<div> 
									<button type="button" class="signUp" onclick="location.href='searchpwform.do?type=pw'" style="width: 48%;">비밀번호 찾기</button>
									<button type="button" class="signUp" style="width: 48%;">로그인 하기</button>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<c:import url="Footer.jsp"></c:import>
	</footer>

</body>
</html>