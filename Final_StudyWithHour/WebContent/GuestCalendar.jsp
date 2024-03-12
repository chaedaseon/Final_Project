<%@page import="com.test.mybatis.GuestCalendarDTO"%>
<%@page import="com.test.mvc.GuestDTO"%>
<%@page import="com.test.mvc.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	/* 게스트 세션 받아오기 */
	GuestDTO guest = (GuestDTO) session.getAttribute("guest");
	
%>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestCalendar.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestPageStyle.css">

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

	var today = new Date(); // 오늘 날짜
	var date = new Date();
	
	//이전 달을 today에 값을 저장
	function beforeMonth() 
	{ 
	    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	    build(); //만들기
	}

	//다음 달을 today에 저장
	function nextMonth()  
	{
	    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	    build();
	}
	
	// 달력 생성 함수 (페이지 로드되면 실행)
	function build()
	{
	    var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); 					// 현재 달의 첫째 날
	    var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); 				// 현재 달의 마지막 날
	    var calTb = document.getElementById("calendar"); 									// 테이블 달력을 만들 테이블
	    var yearMonth = document.getElementById("yearMonth"); 								// 달력 상단에 년도와 월 출력할 곳
	    yearMonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; 	// 해당 위치에 현재 보여지는 년도와 월 출력
	    
	    // 남은 테이블 줄 삭제
	    while (calTb.rows.length > 2) 
	    {
	    	calTb.deleteRow(calTb.rows.length - 1);
	    }
	    var row = null;
	    row = calTb.insertRow();
	    var cnt = 0;
	
	    // 1일 시작칸 찾기
	    for (i = 0; i < nMonth.getDay(); i++) 
	    {
	        cell = row.insertCell();
	        cnt = cnt + 1;
	    }
	
	    // 달력 출력
	    for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
	    { 
	        cell = row.insertCell();
	        cell.innerHTML = "<div class='date'><a href='#' id='date_" + String(i).padStart(2,'0') + "'><div class='i'>" + i + "</div></a></div>";
	        cell.className = "div_date"
	        cnt = cnt + 1;
	        if (cnt % 7 == 1)		//일요일 계산 
	        {
	        	cell.innerHTML = "<div class='date'><a href='#' style='color: #ff8282;' id='date_" + String(i).padStart(2,'0') + "'><div class='i'>" + i + "</div></a></div>";
	           					
	            cell.className = "div_date"
	        }
	        if (cnt % 7 == 0) 		// 1주일이 7일 이므로 토요일 계산
	        { 
	            cell.innerHTML = "<div class='date'><a href='#' style='color: #62b0ff;' id='date_" + String(i).padStart(2,'0') + "'><div class='i'>" + i + "</div></a></div>";
	            cell.className = "div_date"
	            	
	            row = calendar.insertRow();// 줄 추가
	        }
	    }
		
		var info = "gu_code=<%=guest.getGuCode()%>";
	    $.ajax(
	    {
	    	type:"GET"
	    	, url:"schedulelist.do"
	    	, data:info
	    	, dataType :"json"
	    	, success:function(jsonObj)
	    	{
	    		
	    		for (var idx=0; idx<jsonObj.length; idx++)
	    		{
	    			var sch_name = jsonObj[idx].sch_name;
	    			var sch_content = jsonObj[idx].sch_content;
	    			var sch_date = jsonObj[idx].sch_date;
	    			
	    			
	    			for(var i=1; i<lastDate.getDate(); i++)
	    			{
	    				if(today.getFullYear()==sch_date.substring(0,4)
    						&&(String(today.getMonth()+1).padStart(2, '0'))==sch_date.substring(5,7)
    						&&(String(i).padStart(2,'0'))==sch_date.substring(8,10))
	    				{

	    					var cell = document.getElementById("date_" + sch_date.substring(8, 10)); // 각 날짜에 해당하는 셀 가져오기
	   						cell.innerHTML += "<div class='sch_name'>" + sch_name.substring(0,6) + "</div>";
	    				}
	    			}
	    		}
	    	}
	    	, error:function(e)
	    	{
	    		alert(e.responseText);
	    	}
    	});
	}
	
	// 일정 추가 모달
	$(function()
	{
        $('#datepicker').datepicker();
     })
	
	
	
	

</script>
</head>


<body onload="build();">

<header>
	<c:import url="Menu.jsp"></c:import>
</header>

<section>
	<div id="content">
		<c:import url="SideMenu.jsp"></c:import>
		
		<div class="rightContent_div">
			<div class="page_title">
				<span><span>일정</span> 관리</span>
			</div>
			
			<div style="display: flex; justify-content: space-between;">
				<div style="width: 693px;">
				
					<div>	
						<table id="calendar" style="margin-top: 35px;">
							<tr>
					            <td colspan="7">
					            	<div style="display: flex; justify-content: center; position: relative">
						            	<div>
								            <button onclick="beforeMonth()" class="calBtn" id="before">&lt;</button>
							            	<span id="yearMonth"></span>
								            <button onclick="nextMonth()" class="calBtn" id="next">&gt;</button>
							            </div>
							            
							            <div class="addBtn_div">
					            			<button type="button" class="addBtn" data-bs-toggle="modal" data-bs-target="#addSchedule">일정 등록</button>
					            		</div>
					            		
					            	</div>
					            </td>
				        	</tr>
						
					        <tr>
					            <th style="color: #ff8282;">일</th>
					            <th>월</th>
					            <th>화</th>
					            <th>수</th>
					            <th>목</th>
					            <th>금</th>
					            <th style="color: #62b0ff;">토</th>
					        </tr>
					    </table>
					    
					    <!-- 일정 등록 모달 ----------------------------------------------------------->
						<div class="modal fade" id="addSchedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						 	<div class="modal-dialog modal-dialog-centered">
						 	<form action="guestscheduleinsert.do?gu_code=<%=guest.getGuCode() %>" method="POST" id="scheduleForm">
						    	<div class="modal-content" style="height: 300px;">
						      		<div class="modal-header">
						        		<h1 class="modal-title fs-5" id="staticBackdropLabel">일정 등록</h1>
					        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      		</div>
						      		
						      		<div class="modal-body" style="height: 120px; display: flex; flex-direction: column; justify-content: space-around;">
						        		
						        		<table>
						        			<tr>
						        				<td>
						        					<span id="descrption">일자를 선택해주세요.</span>
						        				</td>
						        				<td>
						        					<input type="date" id="datepicker" name="sch_date">
						        				</td>
						        			</tr>
						        			<tr>
						        				<td>일정명</td>
						        				<td><input type="text" name="sch_name"/></td>
						        			</tr>
						        			<tr>
						        				<td>내용</td>
						        				<td><input type="text" name="sch_content"/></td>
						        			</tr>
						        		
						        		</table>
						        		
						        		<span id="wrongPw" style="display: none; flex-direction: column; align-items: center;"><span style="color: red;">비밀번호가 일치하지 않습니다.</span>다시 입력해주세요. </span>
							        	<!-- 
							        	<div class="modal_form" style="margin-top: 10px; display: flex; justify-content: center;">
							        	
											<input type="password" style="width: 250px;" class="modify_text" id="guPwCheck" name="guPwCheck" placeholder="비밀번호를 입력해주세요">
											
										</div>
										 -->
							      	</div>
								      	
							      	<div class="modal-footer">
							        	<button type="button" class="btn btn-secondary" id="upGuInfoClose" data-bs-dismiss="modal">취소</button>
							        	<button type="submit" class="btn" id="upGuInfo" style="background-color: #94be2c; color: #ffffff;">등록</button>
							      	</div>
						    	</div>
						    	</form>
						 	 </div>
						</div>
						<!-- 일정 등록 모달 end---------------------------------------------------------------------->
					</div>
				</div>
				
				
				<div style="margin-top: 35px;">
					<span style="font-size: 30px; display: flex; justify-content: center; margin-bottom: 20px;">📆오늘의 일정</span>
					<c:forEach var="calendar" items="${list }">
						<fmt:parseDate value="${calendar.sch_date}" var="sch_date" pattern="yyyy-MM-dd HH:mm:ss" />
						<fmt:formatDate value="${sch_date}" pattern="yyyy-MM-dd" var="date" />
						<c:if test="${date eq today}">
							<div style="border-left: 3px solid #94be2c; margin-bottom: 30px; width: 300px; height: 50px;">
								<button type="button" id="schedule_modifyBtn" data-bs-toggle="modal" data-bs-target="#modifySchedule">
									<div style="font-size: 18px; text-align: left;">
										<span style="margin-left: 10px;">${calendar.sch_name }</span>
									</div>
									<div style="font-size: 14px; margin-left: 10px; text-align: left;">
										${calendar.sch_content }
									</div>
								</button>
							</div>
						</c:if>
						
						
						<!-- 일정 수정 및 삭제 모달 ----------------------------------------------------------->
						<div class="modal fade" id="modifySchedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						 	<div class="modal-dialog modal-dialog-centered">
						 	<form action="guestscheduleupdate.do?gu_code=<%=guest.getGuCode() %>" method="POST" id="scheduleForm">
						    	<div class="modal-content" style="height: 300px;">
						      		<div class="modal-header">
						        		<h1 class="modal-title fs-5" id="staticBackdropLabel">일정 수정 및 삭제</h1>
					        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      		</div>
						      		
						      		<div class="modal-body" style="height: 120px; display: flex; flex-direction: column; justify-content: space-around;">
						        		
						        		<table>
						        			<tr>
						        				<td>
						        					<span id="descrption">일자를 선택해주세요.</span>
						        				</td>
						        				<td>
						        					<input type="date" id="datepicker" name="sch_date" value="${calendar.sch_date}">
						        				</td>
						        			</tr>
						        			<tr>
						        				<td>일정명</td>
						        				<td><input type="text" name="sch_name" value="${calendar.sch_name }"></td>
						        			</tr>
						        			<tr>
						        				<td>내용</td>
						        				<td><input type="text" name="sch_content" value="${calendar.sch_content }"/></td>
						        			</tr>
						        		
						        		</table>
						        		
						        		<span id="wrongPw" style="display: none; flex-direction: column; align-items: center;"><span style="color: red;">비밀번호가 일치하지 않습니다.</span>다시 입력해주세요. </span>
							        	<!-- 
							        	<div class="modal_form" style="margin-top: 10px; display: flex; justify-content: center;">
							        	
											<input type="password" style="width: 250px;" class="modify_text" id="guPwCheck" name="guPwCheck" placeholder="비밀번호를 입력해주세요">
											
										</div>
										 -->
							      	</div>
								      	
							      	<div class="modal-footer">
							        	<button type="button" class="btn btn-secondary" id="upGuInfoClose" data-bs-dismiss="modal">삭제</button>
							        	<button type="submit" class="btn" id="upGuInfo" style="background-color: #94be2c; color: #ffffff;">수정</button>
							      	</div>
						    	</div>
						    	</form>
						 	 </div>
						</div>
						<!-- 일정 수정 및 삭제 모달 end---------------------------------------------------------------------->
								
						
					</c:forEach>
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