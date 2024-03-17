<%@page import="com.study.mvc.model.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	/* 게스트 세션 받아오기 */
	GuestDTO guest = (GuestDTO) session.getAttribute("guest");
	
	/* 전화번호 문자열 자르기 */
	String guTel = guest.getGuTel();
	
	String guTel1 = guTel.substring(0,3);
	String guTel2 = guTel.substring(3,7);
	String guTel3 = guTel.substring(7,11);	
	
	/* 가입일자 문자열 자르기 */
	String guDate = guest.getGuDate().substring(0,11);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestMyMenuMain.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestPageStyle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{
		// 수정하기 버튼(연필 모양)을 누르면 비밀번호 확인 후 수정 페이지로 진입 처리
		$("#modifyIcon").click(function()
		{	
			// 취소, 엑스 버튼으로 닫았다가 다시 모달창 열었을 때, 다시 초기화 처리
			$("#guPwCheck").val("");
			$(".descrption").css("display", "flex");		
			$(".wrongPw").css("display", "none");
			
			// 진입하기 위한 비밀번호 확인 처리
			$("#upGuInfo").click(function()
			{
				var guPwCheck = $("#guPwCheck").val();
				
				var info = "userType=guest&check=pw"
				         + "&guCode=" + <%=guest.getGuCode() %>
						 + "&guPwCheck=" + $("#guPwCheck").val();
				$.ajax(
				{	
					type:"POST"
					, url : "checkpw.do"
					, data:info
					, success:function(args)
					{
						var pwCount = args;  
						
						if(pwCount == 1)
						{
							$("#modifyPwCheck").modal("hide")				// 비밀번호 확인 모달창 hide 처리
							
							$("#modifyIcon").css("display", "none");		// 수정 이모티콘 none 처리
							$("#Icon").css("display","flex");				// 확인, 취소 이모티콘 display 처리
							
							$("#guInfo_list").css("display", "none");		// 정보 div none 처리
							$("#guUpdateForm").css("display", "flex");		// 수정 div display 처리
						}
						else
						{
							$("#guPwCheck").val("");						// 이전 입력 내용 reset
							$("#descrption").css("display", "none");		// 기본 안내 메세지 none 처리
							$("#wrongPw").css("display", "flex");			// 비밀번호 틀릴 경우 틀렸다는 안내 문구 출력
						}
					}
					, error:function(e)
					{
						alert(e.responseText);
					}
				})
				
			});
			
			// 닉네임 유효성 & 중복 확인 처리
			$("#upGuNick").keyup(function()
			{
				var regNick = /^[a-z0-9가-힣]{3,8}$/;
				
				var guNick = $("#upGuNick").val();
				
				if(guNick == null || guNick == "")
				{
					$(".nickErrMsg").css("display", "none");
					$(".nickUsingMsg").css("display", "none");
					$(".nickOkMsg").css("display", "none");
					$(".nickNullMsg").css("display", "flex");
					$(".nickMyMsg").css("display", "none");
				}
				else
				{
					$.ajax(
					{
						type:"POST"
						, url:"checkid.do?check=nick"
						, data:{guNick:guNick}
						, success:function(args)
						{
							var nickCount = args;
							
							if(!regNick.test(guNick))
							{
								$(".nickErrMsg").css("display", "flex");
								$(".nickUsingMsg").css("display", "none");
								$(".nickOkMsg").css("display", "none");
								$(".nickNullMsg").css("display", "none");
								$(".nickMyMsg").css("display", "none");
							}
							else if (nickCount == 0)
							{
								$(".nickErrMsg").css("display", "none");
								$(".nickUsingMsg").css("display", "none");
								$(".nickOkMsg").css("display", "flex");
								$(".nickNullMsg").css("display", "none");
								$(".nickMyMsg").css("display", "none");
							}
							else if($("#upGuNick").val() == "<%=guest.getGuNick()%>")
							{
								$(".nickErrMsg").css("display", "none");
								$(".nickUsingMsg").css("display", "none");
								$(".nickOkMsg").css("display", "none");
								$(".nickNullMsg").css("display", "none");
								$(".nickMyMsg").css("display", "flex");
							}
							else
							{
								$(".nickErrMsg").css("display", "none");
								$(".nickUsingMsg").css("display", "flex");
								$(".nickOkMsg").css("display", "none");
								$(".nickNullMsg").css("display", "none");
								$(".nickMyMsg").css("display", "none");
							}
								
						}
						, error:function(e)
						{
							alert(e.responseText);
						}
					});
				}
			});
		});
		
		
		// 정보수정 창 닫음 처리
		$("#closeIcon").click(function()
		{
			$("#modifyIcon").css("display", "flex");
			$("#Icon").css("display","none");
			
			$("#guInfo_list").css("display", "flex");
			$("#guUpdateForm").css("display", "none");
		});
		
		
		// 게스트 정보 수정 버튼 클릭 이후 처리
		$("#upGuInfoOk").click(function()
		{
			$("#guUpdateForm").submit();
		});
	});
	
	
	// 회원 탈퇴 모달 처리
	function unregCheck1()
	{
		var unregReason = $("select[name=unregReason]").val();
		
		$(".reason").css("display", "none");
		$(".unregCheck").css("display", "block");
		$(".unregCheckBtn").css("display", "flex");
		
		$("#unregCheck").click(function()
		{
			var unregCheck = $("#unregCheckBox").is(":checked");
		
			var checkPw = $("#unregCheckPw").val();		// 사용자가 입력한 비밀번호
			
			var info = "userType=guest&check=pw"
				     + "&guCode=" + <%=guest.getGuCode() %>
			     	 + "&guPwCheck=" + checkPw;
			     	 
			$.ajax(
			{	
				type:"POST"
				, url : "checkpw.do"
				, data:info
				, success:function(args)
				{
					var pwCount = args;  
					
					if(unregCheck == true)
					{
						if(pwCount == 1)
							$(location).attr("href","guestunreg.do?reasonCode="+unregReason + "&guCode=" +"<%=guest.getGuCode()%>");
						else
							alert("비밀번호가 일치하지 않습니다.");
					}
					else
						alert("확인 사항에 동의해주십시오.");
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
		});
	};
	
			
</script>


</head>
<body>

<header>
	<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
</header>

<section>
	<div id="content">
		<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
		
		<div class="rightContent_div">
			<div class="page_title">
				<span>마이페이지<span></span></span>
			</div>
		
			<div class= "guMypage_div">
				<div class="guMypage">
					
					<div class="guInfo_div">
					
						<div class="guInfo">
							<div>
								반가워요, <span style="color: #94be2c;"><%=guest.getGuName() %></span>님!
							</div>
							<div>
								<span style="font-size: 16px;">가입 일자 : <%=guDate %></span>
							</div>
						</div>
						
						<!-- 아이콘 처리 영역 ------------------------------------------------------------------------->					
						<div>
							<!-- 기본 수정 아이콘 영역 ---------------------------------------------------------->
							<div class="modifyIcon" id="modifyIcon">
								<button type="button" class="modifyIcon" data-bs-toggle="modal" data-bs-target="#modifyPwCheck" style="display: flex; align-items: center;">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
		  							<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
								</svg>
								</button>
							</div>
							<!-- 기본 수정 아이콘 end ---------------------------------------------------------->
							
						</div>
						<!-- 아이콘 처리 end ------------------------------------------------------------------------->
						
						
						<!-- 수정 아이콘 눌렀을 때 나타나는 상단 아이콘 영역 ------------------------------------------------------->
						<div id= "Icon" style="display: none; justify-content: flex-end; height: 24px;">
							<div>
								<button type="button" class="modifyIcon" id="modifyOkIcon" data-bs-toggle="modal" data-bs-target="#modifyCheck" style="display: flex; align-items: center;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
										<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
										<path d="m10.97 4.97-.02.022-3.473 4.425-2.093-2.094a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05"/>
									</svg>
								</button>
							</div>
							
							
							<div>
								<button class="modifyIcon" id="closeIcon">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
										<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
										<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
									</svg>
								</button>
							</div>
						</div>
						<!-- 수정 아이콘 눌렀을 때 나타나는 상단 아이콘 end ------------------------------------------------------->
						
						<div id="guInfo_list">
							<div class="guInfo_list1" id="guInfo_list1">
								<table>
									<tr>
										<td style="width: 100px;">이름</td>
										<td style="width: 150px;"><%=guest.getGuName() %>	</td>
									</tr>
									<tr>
										<td>아이디</td>
										<td><%=guest.getGuId() %></td>
									</tr>
									<tr>
										<td>닉네임</td>
										<td><%=guest.getGuNick() %></td>
									</tr>
								</table>
							</div>
									
							<div class="guInfo_list2" id="guInfo_list2">
								<table>
									<tr>
										<td style="width: 100px;">전화번호</td>
										<td style="width: 200px;">
										<%=guTel1 %> - <%=guTel2 %> - <%=guTel3 %>
										</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td><%=guest.getGuEmail() %></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td>
											<button type="button" class="modal_btn" data-bs-toggle="modal" data-bs-target="#guModifyPw">
											    변경하기
											</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					
						<!-- 비밀번호 변경 모달 영역 ------------------------------------------------------------------------------------------->
						<div class="modal fade" id="guModifyPw" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						    <div class="modal-dialog modal-dialog-centered">
						        <div class="modal-content" style="z-index: 1000;">
						            <div class="modal-header">
						                <h1 class="modal-title fs-5" id="staticBackdropLabel">비밀번호 변경</h1>
						                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						            </div>
						            <form action="guestmodify.do?modifyType=pw&guCode=<%=guest.getGuCode() %>" method="post">
						                <div class="modal-body">
						                    변경할 비밀번호를 입력해주세요.
						                    <div class="modal_form" style="margin-top: 10px;">
						                        <table>
						                            <tr>
						                                <td style="width: 150px;">비밀번호</td>
						                                <td><input type="password" class="upGuPw" id="upGuPw" name="upGuPw"></td>
						                            </tr>
						                            <tr>
						                                <td>비밀번호 확인</td>
						                                <td><input type="password" class="upGuPw" id="upGuPwCheck"></td>
						                            </tr>
						                        </table>
						                    </div>
						                </div>
						                <div class="modal-footer">
						                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						                    <button type="submit" class="btn" style="background-color: #94be2c; color: #ffffff;">변경</button>
						                </div>
						            </form>
						        </div>
						    </div>
						</div>
						<!-- 비밀번호 변경 모달 end ------------------------------------------------------------>
						
						
						<!-- 수정 아이콘 눌렀을 때 나타나는 정보 수정 영역 --------------------------------------------------------->
						<form action="guestmodify.do?modifyType=all&guCode=<%= guest.getGuCode()%>" method="post" style="display: none;" id="guUpdateForm">
							<div id="guInfo_modify">
								<div class="guInfo_list1" id="guInfo_modify1">
									<table>
										<tr>
											<td style="width: 100px;">이름</td>
											<td style="width: 150px;"><%= guest.getGuName()%></td>
										</tr>
										<tr>
											<td>아이디</td>
											<td><%= guest.getGuId()%></td>
										</tr>
										<tr>
											<td>닉네임</td>
											<td class="modify_input">
												<input type="text" style="width: 130px;" name="upGuNick" id="upGuNick" class="modify_text" required="required" value="<%= guest.getGuNick()%>">
											</td>
										</tr>
									</table>
								</div>
								
								<div class="guInfo_list2" id="guInfo_modify2">
									<table>
										<tr>
										
											<td style="width: 100px;">전화번호</td>
											<td class="modify_input" style="width: 200px;">
												<input type="text" style="width: 45px;" name="upGuTel1" id="upGuTel1" class="modify_text" required="required" value="<%= guTel1%>">
												- <input type="text" style="width: 55px;" name="upGuTel2" id="upGuTel2" class="modify_text" required="required" value="<%= guTel2%>">
												- <input type="text" style="width: 55px;" name="upGuTel3" id="upGuTel3" class="modify_text" required="required" value="<%= guTel3%>">
											</td>
											
										</tr>
										<tr>
											<td>이메일</td>
											<td class="modify_input">
												<input type="text" name="upGuEmail" id="upGuEmail" class="modify_text" required="required" value="<%= guest.getGuEmail()%>">
											</td>
										</tr>
										<tr>
											<td colspan="2">
											<span class="nickErrMsg" style="display: none;">올바른 형식에 맞춰 입력해주세요.<br>(5~10 자 사이의 한글, 영소문자, 숫자)</span>
											<span class="nickUsingMsg" style="display: none;">사용중인 닉네임 입니다.</span>
											<span class="nickOkMsg" style="display: none;">사용 가능한 닉네임 입니다.</span>
											<span class="nickNullMsg" style="display: none;">닉네임을 입력해주세요.</span>
											<span class="nickMyMsg" style="display: none;">현재 닉네임과 동일합니다.</span>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</form>
						<!-- 수정 아이콘 눌렀을 때 나타나는 정보 수정 end --------------------------------------------------------->
						
						<!-- 정보 수정을 위한 비밀번호 확인 모달 영역 ---------------------------------------------------------------------------->
						<div class="modal fade" id="modifyPwCheck" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						 	<div class="modal-dialog modal-dialog-centered">
						    	<div class="modal-content">
						      		<div class="modal-header">
						        		<h1 class="modal-title fs-5" id="staticBackdropLabel">비밀번호 확인</h1>
					        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      		</div>
						      		<div class="modal-body" style="height: 120px; display: flex; flex-direction: column; justify-content: space-around;">
						        		<span id="descrption" style="display: flex; justify-content: center;">정보 수정을 위해 비밀번호를 입력해주세요.</span>
						        		<span id="wrongPw" style="display: none; flex-direction: column; align-items: center;"><span style="color: red;">비밀번호가 일치하지 않습니다.</span>다시 입력해주세요. </span>
							        	
							        	<div class="modal_form" style="margin-top: 10px; display: flex; justify-content: center;">
							        	
											<input type="password" style="width: 250px;" class="modify_text" id="guPwCheck" name="guPwCheck" placeholder="비밀번호를 입력해주세요">
											
										</div>
							      	</div>
							      	
							      	<div class="modal-footer">
							        	<button type="button" class="btn btn-secondary" id="upGuInfoClose" data-bs-dismiss="modal">취소</button>
							        	<button type="submit" class="btn" id="upGuInfo" style="background-color: #94be2c; color: #ffffff;">확인</button>
							      	</div>
						    	</div>
						 	 </div>
						</div>
						<!-- 정보 수정을 위한 비밀번호 확인 모달 end ---------------------------------------------------------------------------->
						
						
						<!-- 정보 수정 확인 모달 영역 ---------------------------------------------------------------------------->
						<div class="modal fade" id="modifyCheck" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						 	<div class="modal-dialog modal-dialog-centered">
						    	<div class="modal-content">
						      		<div class="modal-header">
						        		<h1 class="modal-title fs-5" id="staticBackdropLabel">정보 수정</h1>
					        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      		</div>
						      		<div class="modal-body" style="height: 120px; display: flex; flex-direction: column; justify-content: space-around;">
						        		<span style="display: flex; justify-content: center;">입력하신 정보로 수정하시겠습니까?</span>
							      	</div>
							      	
							      	<div class="modal-footer">
							        	<button type="button" class="btn btn-secondary" id="upGuInfoClose" data-bs-dismiss="modal">취소</button>
							        	<button type="submit" class="btn" id="upGuInfoOk" style="background-color: #94be2c; color: #ffffff;">확인</button>
							      	</div>
						    	</div>
						 	 </div>
						</div>
						<!-- 정보 수정 확인 모달 end ---------------------------------------------------------------------------->
						
						<!-- 회원 탈퇴 ------------------------------------------------------------------------------------------------>
						<div>
							<button type="button" class="unregBtn" data-bs-toggle="modal" data-bs-target="#unregBtn">
							  회원 탈퇴
							</button>
							
							<!-- 모달 영역 -->
							<div class="modal fade" id="unregBtn" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							 	<div class="modal-dialog modal-dialog-centered" style="display: flex; justify-content: center;">
							    	<div class="modal-content" style="height: 300px; text-align: center; width: 60%;">
							      		<div class="modal-header">
							        		<h1 class="modal-title fs-5" id="staticBackdropLabel">회원 탈퇴</h1>
						        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      		</div>
							      		
							      		<div class="modal-body">
							      			
							      			<!-- 회원 탈퇴 1단계 -->
							      			<div class="reason">
								        		회원 탈퇴 사유를 입력해주세요.
									        	<div class="modal_form">
									        		<select name="unregReason">
									        			<option value="101">개인정보 노출 우려</option>
									        			<option value="102">재가입 목적</option>
									        			<option value="103">서비스 불만족</option>
									        			<option value="104">이용 안함</option>
									        			<option value="105">기타</option>
									        		</select>
												</div>
											</div>
											
											<!-- 회원 탈퇴 2단계 -->
											<div class="unregCheck" style="display: none;">
												탈퇴 후 계정 복구는 불가합니다.<br>
												탈퇴하시겠습니까?<br>
												
												<input type="checkbox" id="unregCheckBox">예, 확인했습니다.
												
												<input type="password" placeholder="비밀번호를 입력해주세요" id="unregCheckPw">
											</div>
											
								      	</div>
								      	
								      	
								      	<div class="modal-footer reason">
								        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								        	<button type="button" class="btn" onclick="unregCheck1()" style="background-color: #94be2c; color: #ffffff;">다음</button>
								      	</div>
								      	
								      	<div class="modal-footer unregCheckBtn" style="display: none;">
								        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								        	<button type="button" class="btn" id="unregCheck" style="background-color: #94be2c; color: #ffffff;">탈퇴</button>
								      	</div>
								      	
							    	</div>
							 	 </div>
							</div>
						</div>
						<!-- 회원 탈퇴 end------------------------------------------------------------------------------------------------>
					</div>	
				</div>
			</div>
		</div>
	</div>
</section>

<footer>
	<jsp:include page="/WEB-INF/view/main/Footer.jsp" />
</footer>

</body>
</html>