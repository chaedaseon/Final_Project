<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String adCode = (String)session.getAttribute("adCode");
	String guCode = (String)session.getAttribute("guCode");
	String hoCode = (String)session.getAttribute("hoCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyGroupList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sliderStyle.css">
<link rel="stylesheet" type="text/css" href="css/studyGroupPageStyle.css">
<script type="text/javascript">

	$(document).ready(function() 
	{
		$(".groupJoin_button").click(function() 
		{
		    // 그룹 가입 버튼(모집글 내용)이 속한 댓글 요소의 값을 가져오기
		    var grCode = $(this).closest("li").find("input[name=grCode1]").val();
		    var grGuCode = $(this).closest("li").find("input[name=guCode1]").val();
		    var grComment = $(this).closest("li").find("input[name=grComment1]").val();
		    var grLeader = $(this).closest("li").find("input[name=grLeader1]").val();
		    var age = $(this).closest("li").find("input[name=age1]").val();
		    var grName = $(this).closest("li").find("input[name=grName1]").val();
		    var grCount = $(this).closest("li").find("input[name=grCount1]").val();
		    var gjCount = $(this).closest("li").find("input[name=gjCount1]").val();
		    var grSubject = $(this).closest("li").find("input[name=grSubject1]").val();
		    var gender = $(this).closest("li").find("input[name=gender1]").val();
		    var lsCode = $(this).closest("li").find("input[name=lsCode1]").val();
		    var gpPw = $(this).closest("li").find("input[name=gpPw1]").val();
		    var dDay = $(this).closest("li").find("input[name=dDay1]").val();
		    var periodCode = $(this).closest("li").find("input[name=periodCode1]").val();
		    var endDate = $(this).closest("li").find("input[name=endDate]").val();
		    // 현재 사용자의 guCode 값 가져오기
		    var ssessionGuCode = $("#ssessionGuCode").val();
		    
		    if (ssessionGuCode == 'null') 
		    {
				alert("로그인이 필요한 접근입니다.");
				window.location.href = "loginform.do";
		    }
		    else if(dDay < 0)
		    {
		    	if(periodCode == 1)
		    	{
		    		if(gpPw != 0)
		    		{
		    			$("#groupPassword").modal("show");
		    			$("#InsertPassword").val("");
		    			
		    			$("#insertSubmit").unbind("click").click(function()
						{
		    				if($("#InsertPassword").val() == gpPw)
		    				{
		    					$("#groupPassword").modal("hide");
		    					$("#groupJoinModal").modal("show");
						        $("input[name=grCode]").val(grCode);
						        $("input[name=grGuCode]").val(grGuCode);
						        $("input[name=grComment]").val(grComment);
						        $("#grComment span").text(grComment);
						        $("input[name=grLeader]").val(grLeader);
						        $("#grLeader span").text(grLeader);
						        $("input[name=age]").val(age);
						        $("#age span").text(age);
						        $("input[name=grName]").val(grName);
						        $("#grName span").text(grName);
						        $("input[name=grCount]").val(grCount);
						        $("#grCount span").text(grCount);
						        $("input[name=grSubject]").val(grSubject);
						        $("#grSubject span").text(grSubject);
						        $("input[name=gender]").val(gender);
						        $("#gender span").text(gender);
						        $("input[name=lsCode]").val(lsCode);
						        $("#lsCode span").text(lsCode);
						        $("#endDate span").text(endDate);
		    				}
		    				else if($("#InsertPassword").val() != gpPw)
		    				{
		    					alert("비밀번호가 틀렸습니다.");
		    					$("#groupPassword").modal("hide");
		    				}
						});
		    		}
		    		else
		    		{
		    			$("#groupJoinModal").modal("show");
				        $("input[name=grCode]").val(grCode);
				        $("input[name=grGuCode]").val(grGuCode);
				        $("input[name=grComment]").val(grComment);
				        $("#grComment span").text(grComment);
				        $("input[name=grLeader]").val(grLeader);
				        $("#grLeader span").text(grLeader);
				        $("input[name=age]").val(age);
				        $("#age span").text(age);
				        $("input[name=grName]").val(grName);
				        $("#grName span").text(grName);
				        $("input[name=grCount]").val(grCount);
				        $("#grCount span").text(grCount);
				        $("input[name=grSubject]").val(grSubject);
				        $("#grSubject span").text(grSubject);
				        $("input[name=gender]").val(gender);
				        $("#gender span").text(gender);
				        $("input[name=lsCode]").val(lsCode);
				        $("#lsCode span").text(lsCode);
				        $("#endDate span").text(endDate);
		    		}
		    	}
		    	else
		    	{
		    		alert("모집이 종료된 그룹입니다.");
		    	}
		    }
		    else if(grCount <= gjCount)
		    {
		    	alert("가입 인원이 가득찬 그룹입니다.");
		    }
		    else
		    {
		    	if(gpPw != 0)
	    		{
	    			$("#groupPassword").modal("show");
	    			$("#InsertPassword").val("");
	    			
	    			$("#insertSubmit").unbind("click").click(function()
					{
	    				if($("#InsertPassword").unbind("click").val() == gpPw)
	    				{
	    					$("#groupPassword").modal("hide");
	    					$("#groupJoinModal").modal("show");
					        $("input[name=grCode]").val(grCode);
					        $("input[name=grGuCode]").val(grGuCode);
					        $("input[name=grComment]").val(grComment);
					        $("#grComment span").text(grComment);
					        $("input[name=grLeader]").val(grLeader);
					        $("#grLeader span").text(grLeader);
					        $("input[name=age]").val(age);
					        $("#age span").text(age);
					        $("input[name=grName]").val(grName);
					        $("#grName span").text(grName);
					        $("input[name=grCount]").val(grCount);
					        $("#grCount span").text(grCount);
					        $("input[name=grSubject]").val(grSubject);
					        $("#grSubject span").text(grSubject);
					        $("input[name=gender]").val(gender);
					        $("#gender span").text(gender);
					        $("input[name=lsCode]").val(lsCode);
					        $("#lsCode span").text(lsCode);
					        $("#endDate span").text(endDate);
	    				}
	    				else
	    				{
	    					alert("비밀번호가 틀렸습니다.");
	    					$("#groupPassword").modal("hide");
	    				}
					});
		    		
	    		}
		    	else
		    	{
		    		$("#groupJoinModal").modal("show");
			        $("input[name=grCode]").val(grCode);
			        $("input[name=grGuCode]").val(grGuCode);
			        $("input[name=grComment]").val(grComment);
			        $("#grComment span").text(grComment);
			        $("input[name=grLeader]").val(grLeader);
			        $("#grLeader span").text(grLeader);
			        $("input[name=age]").val(age);
			        $("#age span").text(age);
			        $("input[name=grName]").val(grName);
			        $("#grName span").text(grName);
			        $("input[name=grCount]").val(grCount);
			        $("#grCount span").text(grCount);
			        $("input[name=grSubject]").val(grSubject);
			        $("#grSubject span").text(grSubject);
			        $("input[name=gender]").val(gender);
			        $("#gender span").text(gender);
			        $("input[name=lsCode]").val(lsCode);
			        $("#lsCode span").text(lsCode);
			        $("#endDate span").text(endDate);
		    	}
		    }
		});
	});
	
	$(function()
	{
		$("#joinSubmit").click(function()
   		{
			var ssessionGuCode = $("#ssessionGuCode").val();
			var grGuCode = $("input[name=grGuCode]").val();
			if(grGuCode == ssessionGuCode)
		    {
		    	alert("본인이 작성한 모집글입니다.");
		    }
			else if(confirm("그룹에 가입하시겠습니까?"))
			{
				var guCode = $("input[name=guCode]").val();
				var grCode = $("input[name=grCode]").val();
	        	var data = {"P_GU_CODE": guCode, "P_GR_CODE": grCode}
	            $.ajax({
	                url: "groupjoin.do",
	                type: "POST",
	                data: data,
	                dataType: "json",
	                success: function(response) {
	                	var out = "";
	                	out += response.msg;
	                	
	                	alert(out);
	                	$("#groupJoinModal").modal("hide");
	                },
	                error: function(e) {
	                	alert("잘못된 접근입니다.");
					} 
	            });
			}
   		});
   	});
	
	
</script>
<script type="text/javascript">

	$(function()
	{
		$("#regModify").click(function()
		{
			var ssessionGuCode = $("#ssessionGuCode").val();
			var grGuCode = $("input[name=grGuCode]").val();
			var grCode = $("input[name=grCode]").val();
			
			if(grGuCode != ssessionGuCode)
		    {
		    	alert("본인이 작성한 모집글만 수정이 가능합니다.");
		    }
			else if(grGuCode == ssessionGuCode)
			{
				if(confirm("모집글 수정페이지로 이동하시겠습니까?"))
				{
					window.location.href = "groupopenupdateform.do?grCode=" + grCode;
				}
			}
		});
	});
	
	$(function()
	{
		$("#regDelete").click(function()
   		{
			var ssessionGuCode = $("#ssessionGuCode").val();
			var guCode = $("input[name=grGuCode]").val();
			var grCode = $("input[name=grCode]").val();
			if(guCode != ssessionGuCode)
		    {
		    	alert("본인이 작성한 모집글만 삭제가 가능합니다.");
		    }
			else if(confirm("모집요청을 철회하시겠습니까?"))
			{
				var guCode = $("input[name=guCode]").val();
				var grCode = $("input[name=grCode]").val();
	        	var data = {"P_GU_CODE": guCode, "P_GR_CODE": grCode}
	            $.ajax({
	                url: "groupregdelete.do",
	                type: "POST",
	                data: data,
	                dataType: "json",
	                success: function(response) {
	                	var out = "";
	                	out += response.msg;
	                	
	                	alert(out);
	                	$("#groupJoinModal").modal("hide");
	                },
	                error: function(e) {
	                	alert("잘못된 접근입니다.");
					} 
	            });
			}
   		});
   	});
	
</script>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
<input type="hidden" id="ssessionGuCode" value="<%=guCode%>"/>
	<section>
		<div id="content">
			<div class="category_bar">
				<c:import url="/WEB-INF/view/board/imageSlide.jsp"></c:import>
			<!-- content div 시작 부분 -->	
			<div class="content_div">
				<div class="board_title">
					<span><a href="boardgrouplist.do" style="color: #94bc32;">스터디그룹</a></span>
					<c:import url="/WEB-INF/view/board/CategoryBar_group.jsp"></c:import>
				</div>
				<button type="button" class="btn" id="write_button" onclick="location.href='groupopeninsertform.do'">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
					  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
					</svg>
					모집글작성
				</button>
					<div class="row row-cols-lg-4 row-cols-md-3 row-cols-2 row-cols-1 text-center px-xl-6 aos-init aos-animate" id="groupRegList_box">
					<c:choose>
						<c:when test="${list == null}">
			    				<!-- <h5 class="card-title">Light card title</h5> -->
			    		<div id="null_text"><span>해당 카테고리의 그룹이 존재하지 않습니다.</span></div>
						</c:when>
						<c:when test="${urlparam == 'boardstudygroupadd' }">
							<c:forEach var="group" items="${list }">
							<c:if test="${group.gjCount <= group.grCount}">
							<ul>
								<li id="addRegList">
								<div class="col my-4" id="groupReg_one">
									<div class="card">
										<input type="hidden" name=periodCode value="${group.periodCode}"/>
										<input type="hidden" name="grCode1" value="${group.grCode }"/>
										<input type="hidden" name="guCode1" value="${group.guCode }"/>
										<input type="hidden" name="grLeader1" value="${group.grLeader }"/>
							      		<input type="hidden" name="age1" value="${group.age }"/>
							      		<input type="hidden" name="grSubject1" value="${group.grSubject }"/>
							      		<input type="hidden" name="grName1" value="${group.grName }"/>
							      		<input type="hidden" name="grCount1" value="${group.grCount }"/>
							      		<input type="hidden" name="lsCode1" value="${group.lsCode }"/>
							      		<input type="hidden" name="grComment1" value="${group.grComment }"/>
							      		<input type="hidden" name="gender1" value="${group.gender }"/>
							      		<input type="hidden" name="gjCount1" value="${group.gjCount }"/>
							      		<input type="hidden" name="dDay1" value="${group.dDay }"/>
							      		<input type="hidden" name="gpPw1" value="${group.gpPw}"/>
							      		<input type="hidden" name="endDate" value="${group.endDate}"/>
							      		<input type="hidden" id="periodCode" name="periodCode1" value="${group.periodCode }"/>
										<div class="card-header bg-transparent">
										<c:choose>
										<c:when test="${group.grOpen == '공개'}">
											<span>${group.grName }</span>									
										</c:when>
										<c:when test="${group.grOpen == '비공개'}">
											<span>${group.grName }<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
															  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
															</svg>
											</span>
										</c:when>
										</c:choose>
											<c:choose>
												<c:when test="${group.periodCode == 1 }">
													<span class="d-day">상시모집</span>
												</c:when>
												<c:when test="${group.periodCode == 2 }">
													<c:choose>
													<c:when test="${group.dDay == 0}">
														<span class="d-day">D-DAY 마감임박</span>
													</c:when>
													<c:when test="${group.dDay > 0}">
														<span class="d-day">D-${group.dDay }</span>
													</c:when>
													</c:choose>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</div>
					  					<div class="card-body">
					    				<!-- <h5 class="card-title">Light card title</h5> -->
					    					<p class="card-text"><a type="button" class="groupJoin_button" data-bs-target="#groupJoinModal">${group.grComment }</a></p>
					  					</div>
					    				<div class="card-bottom">
					    					<c:if test="${group.gjCount != 0}">
					    					<span id="count"><img src="images/people.png">${group.gjCount} / ${group.grCount } 명</span>
					    					</c:if>
					    					<c:if test="${group.gjCount == 0 }">
					    					<span id="count"><img src="images/people.png">${group.gjCount+1} / ${group.grCount } 명</span>
					    					</c:if>
					    					<span id="grNum">No. ${group.no}</span>
					    				</div>
									</div>
								</div>
								</li>
							</ul>
							</c:if>	
							</c:forEach>
						</c:when>
						<c:otherwise>
						<c:forEach var="group" items="${list }">
						<ul>
							<li>
							<div class="col my-4" id="groupReg_one">
								<div class="card">
									<input type="hidden" name=periodCode value="${group.periodCode}"/>
										<input type="hidden" name="grCode1" value="${group.grCode }"/>
										<input type="hidden" name="guCode1" value="${group.guCode }"/>
										<input type="hidden" name="grLeader1" value="${group.grLeader }"/>
							      		<input type="hidden" name="age1" value="${group.age }"/>
							      		<input type="hidden" name="grSubject1" value="${group.grSubject }"/>
							      		<input type="hidden" name="grName1" value="${group.grName }"/>
							      		<input type="hidden" name="grCount1" value="${group.grCount }"/>
							      		<input type="hidden" name="lsCode1" value="${group.lsCode }"/>
							      		<input type="hidden" name="grComment1" value="${group.grComment }"/>
							      		<input type="hidden" name="gender1" value="${group.gender }"/>
							      		<input type="hidden" name="gjCount1" value="${group.gjCount }"/>
							      		<input type="hidden" name="dDay1" value="${group.dDay }"/>
							      		<input type="hidden" name="gpPw1" value="${group.gpPw}"/>
							      		<input type="hidden" name="endDate" value="${group.endDate}"/>
							      		<input type="hidden" id="periodCode" name="periodCode1" value="${group.periodCode }"/>
									<div class="card-header bg-transparent">
									<c:choose>
									<c:when test="${group.grOpen == '공개'}">
										<span>${group.grName }</span>									
									</c:when>
									<c:when test="${group.grOpen == '비공개'}">
										<span>${group.grName }<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
														  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
														</svg>
										</span>
									</c:when>
									</c:choose>
									<c:choose>
											<c:when test="${group.periodCode == 1 }">
												<span class="d-day">상시모집</span>
											</c:when>
											<c:otherwise>
												<c:choose>
												<c:when test="${group.dDay == 0}">
													<span class="d-day">D-DAY 마감임박</span>
												</c:when>
												<c:when test="${group.dDay > 0}">
													<span class="d-day">D-${group.dDay }</span>
												</c:when>
												<c:when test="${group.dDay < 0}">
													<span class="d-day">모집 종료</span>
												</c:when>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</div>
				  					<div class="card-body">
				    					<p class="card-text"><a type="button" class="groupJoin_button" data-bs-target="#groupJoinModal">${group.grComment }</a></p>
				  					</div>
				    				<div class="card-bottom">
				    					<span id="count"><img src="images/people.png">${group.gjCount+1 > group.grCount ? group.grCount : group.gjCount+1} / ${group.grCount } 명</span>
				    					<span id="grNum">No. ${group.no}</span>
				    				</div>
								</div>
							</div>
							</li>
						</ul>	
						</c:forEach>
						</c:otherwise>
					</c:choose>
						<!-- 가입 요청 모달 영역 -->
						<div class="modal fade" id="groupJoinModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered">
						    <div class="modal-content">
						      <div class="modal-header">그룹 모집 상세 정보
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						      <table class="groupJoin_info">
						      	<tr>
						      		<td>그룹장</td>
						      		<td id="grLeader"><span></span></td>
						      		<td>그룹명</td>
						      		<td id="grName"><span></span></td>
						      	</tr>
						      	<tr>
						      		<td>연령대</td>
						      		<td id="age"><span></span></td>
						      		<td>성별</td>
						      		<td id="gender"><span></span></td>
						      	</tr>
						      	<tr>
						      		<td>모집 인원</td>
						      		<td id="grCount"><span id="grCount"></span></td>
						      		<td>지역</td>
						      		<td id="lsCode"><span></span></td>
						      	</tr>
						      	<tr>
						      		<td>활동 분류</td>
						      		<td id="grSubject"><span></span></td>
						      		<td>모집 마감일</td>
						      		<td id="endDate"><span></span></td>
						      	</tr>
						      	<tr class="spacer"></tr>
						      	<tr>
						      		<td colspan="4" style="text-align: center;">모집 내용</td>
						      	</tr>
						      	<tr>
						      		<td colspan="4" id="grComment" style="background: none; height: 80px;">
						      			<span></span>
						      		</td>
						      	</tr>
						      </table>
						      
						      <!-- 
						      <div id="grLeader">그룹장 : <span></span></div>
						      <div id="grName">그룹명 : <span></span></div>
						      <div id="age">연령대 : <span></span></div>
						      <div id="gender">성별 : <span></span></div>
						      <div id="grCount">모집 인원 : <span></span>명</div>
						      <div id="lsCode">지역 : <span></span></div>
						      <div id="grSubject">활동 분류 : <span></span></div>
						      
						      <div id="grComment">모집 내용 : <br><span></span></div> 
						       -->
						      
						      <input type="hidden" name="grCode">
						      <input type="hidden" name="grGuCode">
						      <input type="hidden" name="guCode" value="<%=guCode%>">
						      <input type="hidden" name="grLeader" />
						      <input type="hidden" name="age" />
						      <input type="hidden" name="grName" />
						      <input type="hidden" name="grCount" />
						      <input type="hidden" name="lsCode" />
						      <input type="hidden" name="grSubject" />
						      <input type="hidden" name="grComment" />
						      </div>
						      <div class="modal-footer">
						      	<button type="button" class="btn btn-secondary" id="regModify">수정</button>
								<button type="button" class="btn btn-secondary" id="regDelete">개설철회</button>		      
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						        <button type="button" class="btn" id="joinSubmit" style="background-color: #94be2c; color: #ffffff;">가입하기</button>
						      </div>
						    </div>
						  </div>
						</div>
						
						<div class="modal fade" id="groupPassword" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered">
						    <div class="modal-content">
						      <div class="modal-header">비공개 그룹 비밀번호 입력
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						      	<input type="text" id="InsertPassword" name="InsertPassword" placeholder="비밀번호 4자리"/>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
						        <button type="button" class="btn btn-primary" id="insertSubmit">입력</button>
						      </div>
						    </div>
						  </div>
						</div>
						
					</div><!-- 그룹 모집글 영역 end -->
									
				<div class="search_div">
					<div class="category_search">
						<select>
							<option>번호</option>
							<option>제목</option>
							<option>작성자</option>
						</select> 
						<input type="text" class="search_input">
						<button type="button" class="search_btn">Search</button>
					</div>
				</div>
				<c:choose>
				<c:when test="${urlparam == 'boardstudygroupnew'}">
					<c:choose>
						<c:when test="${count > 12 }">
							<nav aria-label="Page navigation example paging" class="paging">
							<ul class="pagination">
							<c:if test="${vNum!=1 }">
								<li class="page-item"><a class="page-link" href="boardgroupnew.do?vNum=${vNum-1}">Previous</a></li>
								<li class="page-item"><a class="page-link" href="boardgroupnew.do?vNum=1">&lt;</a></li>
							</c:if>
								<c:forEach var="pageNum" items="${page }">
									<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"></c:if>
									href="boardgroupnew.do?vNum=${pageNum }">					
									${pageNum }
									</a></li>
								</c:forEach>
								<c:if test="${vNum!=lastNum }">
									<li class="page-item"><a class="page-link" href="boardgroupnew.do?vNum=${lastNum}">&gt;</a></li>
									<li class="page-item"><a class="page-link" href="boardgroupnew.do?vNum=${vNum+1 }">Next</a></li>
								</c:if>
							</ul>
							</nav>
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:when test="${urlparam == 'boardstudygroupadd'}">
					<c:choose>
						<c:when test="${count > 12 }">
							<nav aria-label="Page navigation example paging" class="paging">
							<ul class="pagination">
							<c:if test="${vNum!=1 }">
								<li class="page-item"><a class="page-link" href="boardgroupadd.do?vNum=${vNum-1}">Previous</a></li>
								<li class="page-item"><a class="page-link" href="boardgroupadd.do?vNum=1">&lt;</a></li>
							</c:if>
								<c:forEach var="pageNum" items="${page }">
									<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"></c:if>
									href="boardgroupadd.do?vNum=${pageNum }">					
									${pageNum }
									</a></li>
								</c:forEach>
								<c:if test="${vNum!=lastNum }">
									<li class="page-item"><a class="page-link" href="boardgroupadd.do?vNum=${lastNum}">&gt;</a></li>
									<li class="page-item"><a class="page-link" href="boardgroupadd.do?vNum=${vNum+1 }">Next</a></li>
								</c:if>												 
							</ul>
							</nav>
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:when test="${urlparam == 'boardstudygroupend'}">
					<c:choose>
						<c:when test="${count > 12 }">
							<nav aria-label="Page navigation example paging" class="paging">
							<ul class="pagination">
							<c:if test="${vNum!=1 }">
								<li class="page-item"><a class="page-link" href="boardgroupend.do?vNum=${vNum-1}">Previous</a></li>
								<li class="page-item"><a class="page-link" href="boardgroupend.do?vNum=1">&lt;</a></li>
							</c:if>
								<c:forEach var="pageNum" items="${page }">
									<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"></c:if>
									href="boardgroupend.do?vNum=${pageNum }">					
									${pageNum }
									</a></li>
								</c:forEach>
								<c:if test="${vNum!=lastNum }">
									<li class="page-item"><a class="page-link" href="boardgroupend.do?vNum=${lastNum}">&gt;</a></li>
									<li class="page-item"><a class="page-link" href="boardgroupend.do?vNum=${vNum+1 }">Next</a></li>
								</c:if>
							</ul>
							</nav>
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
				<c:choose>
					<c:when test="${count > 12 }">
						<nav aria-label="Page navigation example paging" class="paging">
						<ul class="pagination">
						<c:if test="${vNum!=1 }">
							<li class="page-item"><a class="page-link" href="boardgrouplist.do?vNum=${vNum-1 }">Previous</a></li>
							<li class="page-item"><a class="page-link" href="boardgrouplist.do?vNum=1">&lt;</a></li>
						</c:if>
							<c:forEach var="pageNum" items="${page }">
								<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"></c:if>
								href="boardgrouplist.do?vNum=${pageNum }">					
								${pageNum }
								</a></li>
							</c:forEach>
							<c:if test="${vNum!=lastNum }">
								<li class="page-item"><a class="page-link" href="boardgrouplist.do?vNum=${lastNum}">&gt;</a></li>
								<li class="page-item"><a class="page-link" href="boardgrouplist.do?vNum=${vNum+1 }">Next</a></li>
							</c:if>
						</ul>
						</nav>
					</c:when>
					<c:otherwise>
					
					</c:otherwise>
				</c:choose>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
		</div>
	</section>
	
	<footer>
		<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>