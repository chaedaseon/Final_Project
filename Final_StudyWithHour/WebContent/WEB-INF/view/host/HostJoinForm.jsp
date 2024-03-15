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
<title>HostJoinForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/joinPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	
	
	$(document).ready(function()
	{
		// 정규식
		var regId = /^[a-z0-9]{5,10}$/;
		var regPw = /^[a-zA-Z0-9\!@#$%^&*]{8,16}$/;
		var regName = /^[가-힣]{2,5}$/;
		var regSsn = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))[1-8][0-9]{6}$/;
		var regTel = /^(010|011|016|017|018|019)[0-9]{3,4}[0-9]{4}$/;
		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		
		//------ 정규식 및 중복 검사 수행 (키보드 이벤트가 발생함에 따라)
		
		// 1. 아이디 정규식 & 중복 확인
		$("#hoId").keyup(function()
		{
			var hoId = $("#hoId").val();
			
			// 입력한 값이 없을 경우
			if(hoId == null || hoId == "")
			{
				$(".idErrMsg").css("display", "none");
				$(".idUsingMsg").css("display", "none");
				$(".idOkMsg").css("display", "none");
				$(".idNullMsg").css("display", "flex");
				
			}
			else		// 아이디 중복 확인 위한 Ajax 처리
			{
				$.ajax(
				{
					type:"POST"
					, url:"checkid.do?userType=host&check=id"
					, data : {hoId:hoId}
					, success:function(args)
					{
						var idCount = args;
						
						// 정규식을 만족하지 못할 경우
						if(!regId.test(hoId))	
						{
							$(".idErrMsg").css("display", "flex");
							$(".idUsingMsg").css("display", "none");
							$(".idOkMsg").css("display", "none");
							$(".idNullMsg").css("display", "none");
						}
						else if	(idCount == 0)			// 중복되는 아이디가 없을 경우 (사용 가능)
						{
							$(".idErrMsg").css("display", "none");
							$(".idUsingMsg").css("display", "none");
							$(".idOkMsg").css("display", "flex");
							$(".idNullMsg").css("display", "none");
						}
						else		// 중복되는 아이디가 존재하는 경우
						{
							$(".idErrMsg").css("display", "none");
							$(".idUsingMsg").css("display", "flex");
							$(".idOkMsg").css("display", "none");
							$(".idNullMsg").css("display", "none");
						}
					}
				});
			}
		});	// 아이디 정규식 & 중복 확인 end
		
		// 2. 비밀번호 정규식 확인
		$("#hoPw1").keyup(function()
		{
			var hoPw = $("#hoPw1").val();
			
			// 입력한 값이 없을 경우
			if(hoPw == null || hoPw == "")
			{
				$(".pwErrMsg").css("display", "none");
				$(".pwOkMsg").css("display", "none");
				$(".pwNullMsg").css("display", "flex");
			}
			// pw 정규식 검사
			else if(!regPw.test(hoPw))
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
		
		// 3. 비밀번호 확인란에 입력된 비밀번호가 동일한지 체크
		$("#hoPw2").keyup(function()
		{
			var hoPw1 = $("#hoPw1").val();	
			var hoPw2 = $("#hoPw2").val();
			
			if (hoPw1 != hoPw2)
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
		
		// 4. 이름 정규식 확인
		$("#hoName").keyup(function()
		{
			var hoName = $("#hoName").val();
			
			// 입력한 값이 없을 경우
			if(hoName == null || hoName == "")
			{
				$(".nameErrMsg").css("display", "none");
				$(".nameOkMsg").css("display", "none");
				$(".nameNullMsg").css("display", "flex");
			}
			if(!regName.test(hoName))
			{
				$(".nameErrMsg").css("display", "flex");	
				$(".nameOkMsg").css("display", "none");	
				$(".nameNullMsg").css("display", "none");
			}
			else
			{
				$(".nameErrMsg").css("display", "none");	
				$(".nameOkMsg").css("display", "flex");	
				$(".nameNullMsg").css("display", "none");
			}
			
		});
		
		// 5. 주민등록번호 정규식 확인
		$("#hoSsn2").blur(function()
		{
			var hoSsn1 = $("#hoSsn1").val();
			var hoSsn2 = $("#hoSsn2").val();
			
			var hoSsn = hoSsn1 + hoSsn2;
			
			// 입력한 값이 없을 경우
			if((hoSsn1 == null || hoSsn1 == "") && (hoSsn2 == null || hoSsn2==""))
			{
				$(".ssnErrMsg").css("display", "none");
				$(".ssnOkMsg").css("display", "none");
				$(".ssnNullMsg").css("display", "flex");
			}
			if(!regSsn.test(hoSsn))
			{
				$(".ssnErrMsg").css("display", "flex");	
				$(".ssnOkMsg").css("display", "none");
				$(".ssnNullMsg").css("display", "none");
			}
			else
			{
				$(".ssnErrMsg").css("display", "none");	
				$(".ssnOkMsg").css("display", "flex");	
				$(".ssnNullMsg").css("display", "none");
			}
		});
		
		// 6. 전화번호 정규식 확인
		$("#hoTel3").blur(function()
		{
			var hoTel1 = $("#hoTel1").val();
			var hoTel2 = $("#hoTel2").val();
			var hoTel3 = $("#hoTel3").val();
			
			var hoTel = hoTel1 + hoTel2 + hoTel3;
			
			// 입력한 값이 없을 경우
			if((hoTel1 == null || hoTel1 == "") && (hoTel2 == null || hoTel2=="") && (hoTel3 == null || hoTel3==""))
			{
				$(".telErrMsg").css("display", "none");
				$(".telOkMsg").css("display", "none");
				$(".telNullMsg").css("display", "flex");
			}
			if(!regTel.test(hoTel))
			{
				$(".telErrMsg").css("display", "flex");	
				$(".telOkMsg").css("display", "none");	
				$(".telNullMsg").css("display", "none");
			}
			else
			{
				$(".telErrMsg").css("display", "none");	
				$(".telOkMsg").css("display", "flex");
				$(".telNullMsg").css("display", "none");
			}
		});
		
		// 7. 이메일 정규식 확인
		$("#hoEmail").keyup(function()
		{
			var hoEmail = $("#hoEmail").val();
			
			if(hoEmail == null || hoEmail == "")
			{
				$(".emailErrMsg").css("display", "none");
				$(".emailOkMsg").css("display", "none");
				$(".emailNullMsg").css("display", "flex");
			}
			if(!regEmail.test(hoEmail))
			{
				$(".eamilErrMsg").css("display", "flex");	
				$(".emailOkMsg").css("display", "none");	
				$(".emailNullMsg").css("display", "none");
			}
			else
			{
				$(".eamilErrMsg").css("display", "none");	
				$(".emailOkMsg").css("display", "flex");	
				$(".emailNullMsg").css("display", "none");
			}
		});
		
	});
	
	
	// 회원가입 작업 수행!!!!
	function sginUp()
	{
		var result = true;
		var foundError = false;
		var check = true;
		
		$(".errMsg span").each(function()
		{
			// 현재 보여지는 span으로 추림
			var isnowDisplay = $(this).css('display') == 'flex';
			
			if(isnowDisplay)
			{
				var span = $(this).attr('class');
				
				var splitspan = span.slice(-5)
				
				if(splitspan != "OkMsg")
				{
					$(this).closest('tr').addClass('error');
					foundError = true;
	                result = false;
					return false;
				}
			}
		});
		
		if (foundError) 
		{
	        var errorElement = $(".error").find(".join_text");
	        errorElement.focus();
	    }
		if(result)
		{
			// 개인정보 중복 여부 확인 (이름, 전화번호, 주민등록번호)
			if(check)
			{
				var hoSsn1 = $("#hoSsn1").val();
				var hoSsn2 = $("#hoSsn2").val();
				var hoTel1 = $("#hoTel1").val();
				var hoTel2 = $("#hoTel2").val();
				var hoTel3 = $("#hoTel3").val();
				
				var hoName = $("#hoName").val();
				var hoSsn = hoSsn1 + hoSsn2;
				var hoTel = hoTel1 + hoTel2 + hoTel3;
				
				$.ajax(
				{
					type:"POST"
					, url:"checkinfo.do?userType=host&check=info"
					, data : {hoName:hoName, hoSsn:hoSsn, hoTel:hoTel}
					, success:function(args)
					{
						var infoCount = args;
						
						if(infoCount != null && infoCount != 0)
						{
							alert("일치하는 회원 정보가 존재합니다.");							
						}
						else
							$("#hostJoinForm").submit();
						
					}
					, error:function(e)
					{
						alert(e.responseText);
					}
					
				});
			}
		}
		
	} 

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
					<div class="join_description">
						<span style="color: #94bc32; font-weight: bold; font-size: 38px;">호스트</span><span style="color: #212529; font-size: 20px;"> 회원가입을 위해 정보를 입력해주세요</span>
					</div>	
					
					<div class="underline"></div>
					
					<div class="join_form">
						<form action="memberinsert.do?type=${type }" method="post" id="hostJoinForm">
							<table class="join_table">
								<tr>
									<td class="join_title"><span>아이디</span></td>
									<td class="join_input"><input type="text" name="hoId" id="hoId" class="join_text" placeholder="아이디를 입력해주세요" required="required"></td>
									<td class="errMsg">
										<span class="idErrMsg" style="display: none; font-size: 12px; color: red;">형식에 맞춰 입력해주세요.<br>(영소문자, 숫자 5~10자)</span>
										<span class="idUsingMsg" style="display: none; font-size: 12px; color: red;">이미 사용중인 아이디입니다.</span>
										<span class="idOkMsg" style="display: none; color: #94be2c;">
											<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
												<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z"/>
											</svg>
										</span>
										<span class="idNullMsg" style="display: none; font-size: 12px; color: red;">아이디를 입력해주세요.</span>
									</td>
								</tr>
								<tr>
									<td class="join_title"><span>비밀번호</span></td>
									<td class="join_input"><input type="password" name="hoPw" id="hoPw1" class="join_text" placeholder="비밀번호를 입력해주세요" required="required"></td>
									<td class="errMsg">
										<span class="pwErrMsg" style="display: none; font-size: 12px; color: red;">영 대/소문자, 숫자, 특수문자<br>8~16자로 입력해주세요.</span>
										<span class="pwOkMsg" style="display: none; color: #94be2c;">
											<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
												<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z"/>
											</svg>
										</span>
										<span class="pwNullMsg" style="display: none; font-size: 12px; color: red;">비밀번호를 입력해주세요.</span>
									</td>
								</tr>
								<tr>
									<td class="join_title"><span>비밀번호 확인</span></td>
									<td class="join_input"><input type="password" name="hoPw" id="hoPw2" class="join_text" placeholder="비밀번호 확인" required="required"></td>
									<td class="errMsg">
										<span class="pw2ErrMsg" style="display: none; font-size: 12px; color: red;">비밀번호가 일치하지 않습니다.</span>
										<span class="pw2OkMsg" style="display: none; color: #94be2c;">
											<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
												<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z"/>
											</svg>
										</span>
									</td>
								</tr>
								<tr>
									<td class="join_title"><span>이름</span></td>
									<td class="join_input"><input type="text" name="hoName" id="hoName" class="join_text" required="required" placeholder="이름을 입력해주세요"></td>
									<td class="errMsg">
										<span class="nameErrMsg" style="display: none; font-size: 12px; color: red;">형식에 맞춰 입력해주세요.<br>(한글 2~5자)</span>
										<span class="nameOkMsg" style="display: none; color: #94be2c;">
											<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
												<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z"/>
											</svg>
										</span>
										<span class="nameNullMsg" style="display: none; font-size: 12px; color: red;">이름을 입력해주세요.</span>
									</td>
								</tr>
								<tr>
									<td class="join_title"><span>주민등록번호</span></td>
									<td class="join_input">
										<input type="text" name="hoSsn1" class="join_text" id="hoSsn1" required="required" style="width: 114px;" placeholder="앞6자리"> 
										- <input type="password" name="hoSsn2" class="join_text" id="hoSsn2" style="width: 120px;" required="required" placeholder="뒤 7자리">
									</td>
									<td class="errMsg">
										<span class="ssnErrMsg" style="display: none; font-size: 12px; color: red;">올바른 형식을 입력해주세요.</span>
										<span class="ssnOkMsg" style="display: none; color: #94be2c;">
											<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
												<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z"/>
											</svg>
										</span>
										<span class="ssnNullMsg" style="display: none; font-size: 12px; color: red;">주민등록번호를 입력해주세요.</span>
									</td>
								</tr>
								<tr>
									<td class="join_title"><span>전화번호</span></td>
									<td class="join_input">
										<input type="tel" name="hoTel1" id="hoTel1" class="join_text" style="width: 68px;" required="required">
										 - <input type="tel" name="hoTel2" id="hoTel2" class="join_text" style="width: 75px;" required="required">
										 - <input type="tel" name="hoTel3" id="hoTel3" class="join_text" style="width: 75px;" required="required">
									 </td>
									 <td class="errMsg">
										<span class="telErrMsg" style="display: none; font-size: 12px; color: red;">올바른 형식을 입력해주세요.</span>
										<span class="telOkMsg" style="display: none; color: #94be2c;">
											<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
												<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z"/>
											</svg>
										</span>
										<span class="telNullMsg" style="display: none; font-size: 12px; color: red;">전화번호를 입력해주세요.</span>
									</td>
								</tr>
								<tr>
									<td class="join_title"><span>이메일</span></td>
									<td class="join_input"><input type="email" name="hoEmail" id="hoEmail" class="join_text" placeholder="이메일을 입력해주세요" required="required">
									<td class="errMsg">
										<span class="emailErrMsg" style="display: none; font-size: 12px; color: red;">이메일 형식에 맞춰 입력해주세요.</span>
										<span class="emailOkMsg" style="display: none; color: #94be2c;">
											<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
												<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z"/>
											</svg>
										</span>
										<span class="emailNullMsg" style="display: none; font-size: 12px; color: red;">이메일을 입력해주세요.</span>
									</td>
								</tr>
							</table>
							<div class="underline"></div>
							<input type="button" class="signUp" id="signUpBtn" onclick="sginUp()" value="회 원 가 입">
						</form>
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