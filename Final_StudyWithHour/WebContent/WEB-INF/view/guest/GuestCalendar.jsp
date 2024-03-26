<%@page import="com.study.mvc.model.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	/* 게스트 세션 받아오기 */
	GuestDTO guest = (GuestDTO) session.getAttribute("guest");
	
%>
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
	    createCalendar(); // 달력 만들기
	    // 이전 달 클릭 시, 오른 쪽 날짜는 당일 날짜로 셋팅 & 일정은 공백으로 셋팅
	    $("#resultMonth").html(String(date.getMonth()+1).padStart(2, '0'));
		$("#resultDay").html(String(date.getDate()).padStart(2, '0'));
		$("#resultDiv").html("");
	}

	//다음 달을 today에 저장
	function nextMonth()  
	{
	    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	    createCalendar();
	 	// 다음 달 클릭 시, 오른 쪽 날짜는 당일 날짜로 셋팅 & 일정은 공백으로 셋팅
	    $("#resultMonth").html(String(date.getMonth()+1).padStart(2, '0'));
		$("#resultDay").html(String(date.getDate()).padStart(2, '0'));
		$("#resultDiv").html("");
	}
	
	// 달력 생성 함수 (페이지 로드되면 실행)
	function createCalendar()
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
	        cell.innerHTML = "<div class='top-date'><button class='dateBtn' onclick='datefn(this.id)' id='date_" + String(i).padStart(2,'0') + "'><div class='i'>" + i + "</div></button></div>";
	        cell.className = "div_date"
	        cnt = cnt + 1;
	        if (cnt % 7 == 1)		//일요일 계산 
	        {
	        	cell.innerHTML = "<div class='top-date'><button class='dateBtn' onclick='datefn(this.id)' style='color: #ff8282' id='date_" + String(i).padStart(2,'0') + "'><div class='i'>" + i + "</div></a></div>";
	            cell.className = "div_date"
	        }
	        if (cnt % 7 == 0) 		// 토요일 계산
	        { 
	            cell.innerHTML = "<div class='top-date'><button class='dateBtn' onclick='datefn(this.id)' style='color: #62b0ff' id='date_" + String(i).padStart(2,'0') + "'><div class='i'>" + i + "</div></a></div>";
	            cell.className = "div_date"
	            	
	            row = calendar.insertRow();	// 줄 추가
	        }
	    }
		
	    // 에이작스 info로 guestCode 넘김
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
	    				var year = today.getFullYear();
	    				var month = String(today.getMonth()+1).padStart(2, '0');
	    				var day = String(i).padStart(2,'0');
	    				
	    				// 년도, 월, 일자가 같을 경우
	    				if(year==sch_date.substring(0,4) && month==sch_date.substring(5,7) && day==sch_date.substring(8,10))
	    				{
	    					var cell = document.getElementById("date_" + sch_date.substring(8, 10)); // 각 날짜에 해당하는 셀 가져오기
	   						cell.innerHTML += "<div class='sch_name'>" + sch_name.substring(0,6) + "</div>";
	   						
	   						if((String(today.getDate()).padStart(2, '0'))== i)
	   						{
	   							var out = "";
								
								out += "<div class='guestSchedule'>";
								out += "<button type='button' class='schedule_modifyBtn' data-bs-toggle='modal' data-bs-target='#modifySchedule'>";
								out += "<div class='schName'>";
								out += "<span>" + sch_name + "</span>";
								out += "</div>"; 
								out += "<div class='schContent'>"+sch_content+"</div>";
								out += "</button>";
								out += "</div>";
							
				    			$("#resultDiv").append(out);
				    			
								$("#datepicker2").val(sch_date.substring(0,10));
								$("#upSch_name").val(sch_name);
								$("#upSch_content").val(sch_content);
	   						}
	    				}
	    			}
	    		}
	    		// 페이지가 처음 로드될 때에는 오늘 날짜 출력
	    		$("#resultMonth").html(String(date.getMonth()+1).padStart(2, '0'));
				$("#resultDay").html(String(date.getDate()).padStart(2, '0'));
	    	}
	    	, error:function(e)
	    	{
	    		$("#resultMonth").html(String(date.getMonth()+1).padStart(2, '0'));
				$("#resultDay").html(String(date.getDate()).padStart(2, '0'));
	    		$("#resultDiv").html("등록된 일정이 없습니다.");
	    	}
    	});
	};
	
	
	// 날짜 선택 시, 해당하는 일정 출력
	function datefn(buttonId)
	{
		var year = today.getFullYear();
		var month = String(today.getMonth()+1).padStart(2, '0');
		var day = buttonId.substring(5,7);
		
		$("#resultMonth").html(month);
		$("#resultDay").html(day);
		
		var info = "gu_code=<%=guest.getGuCode()%>&sch_date="+year+"-"+month+"-"+day;
	    $.ajax(
	    {
	    	type:"GET"
	    	, url:"searchschedule.do"
	    	, data:info
	    	, dataType :"json"
	    	, success:function(jsonObj)
	    	{
    			var out = "";
    			
	    		for (var idx=0; idx<jsonObj.length; idx++)
	    		{
	    			var sch_code = jsonObj[idx].sch_code;
	    			var sch_name = jsonObj[idx].sch_name;
	    			var sch_content = jsonObj[idx].sch_content;
	    			var sch_date = jsonObj[idx].sch_date;
	    			
    				if(year==sch_date.substring(0,4)&&month==sch_date.substring(5,7)&&(day==sch_date.substring(8,10)))
    				{
    					out += "<div class='guestSchedule'>";
    					out += "<button type='button' class='schedule_modifyBtn' data-bs-toggle='modal' data-bs-target='#modifySchedule'>";
    					out += "<div class='schName'>";
    					out += "<span>" + sch_name + "</span>";
    					out += "</div>"; 
    					out += "<div class='schContent'>"+sch_content+"</div>";
    					out += "</button>";
    					out += "</div>";
    				}
					
					$("#resultDiv").html(out);
					
					$("#schCodeHidden").val(sch_code);
					
					$("#datepicker2").val(sch_date.substring(0,10));
					$("#upSch_name").val(sch_name);
					$("#upSch_content").val(sch_content);
					
	    		}
	    	}
	    	, error:function(e)
	    	{
	    		$("#resultDiv").html("등록된 일정이 없습니다.");
	    	}
    	});
		
	}
	
	// 일정 추가 모달에 사용되는 datepicker1
	$(function()
	{
        $('#datepicker1').datepicker();
     });
	// 일정 추가 모달에 사용되는 datepicker2
	$(function()
	{
        $('#datepicker2').datepicker();
     });
 
	
	// 일정 삭제 버튼 클릭시 수행
 	function deleteSchedule() 
	{
        var schCode = $("#schCodeHidden").val();
        var deleteUrl = "guestscheduledelete.do?gu_code=<%=guest.getGuCode() %>";
        
        $("#scheduleModifyForm").attr("action", deleteUrl);
        $("#scheduleModifyForm").submit();
    }
	
 	// 일정 수정 버튼 클릭시 수행
 	function updateSchedule() 
 	{
 		var schCode = $("#schCodeHidden").val();
        var updateUrl = "guestscheduleupdate.do?gu_code=<%=guest.getGuCode()%>";
        
        $("#scheduleModifyForm").attr("action", updateUrl);
        $("#scheduleModifyForm").submit();
        
    }
 
</script>
</head>

<body onload="createCalendar();">

<header>
	<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
</header>

<section>
	<div id="content">
		<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
		
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
					            			<button type="button" class="addBtn" data-bs-toggle="modal" data-bs-target="#addSchedule">등록</button>
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
						      		
						      		<div class="modal-body" id="schmodify_modal_body">
						        		
						        		<table>
						        			<tr>
						        				<td>
						        					<span id="descrption">일자</span>
						        				</td>
						        				<td>
						        					<input type="date" id="datepicker1" name="sch_date" required="required">
						        				</td>
						        			</tr>
						        			<tr>
						        				<td>일정명</td>
						        				<td><input type="text" name="sch_name" required="required"></td>
						        			</tr>
						        			<tr>
						        				<td>내용</td>
						        				<td><input type="text" name="sch_content" required="required"></td>
						        			</tr>
						        		
						        		</table>
						        		
						        		<span id="wrongPw" style="display: none; flex-direction: column; align-items: center;"><span style="color: red;">비밀번호가 일치하지 않습니다.</span>다시 입력해주세요. </span>
							      	</div>
								      	
							      	<div class="modal-footer">
							        	<button type="button" class="btn btn-secondary" id="upGuInfoClose" data-bs-dismiss="modal">취소</button>
							        	<button type="submit" class="btn" style="background-color: #94be2c; color: #ffffff;">등록</button>
							      	</div>
						    	</div>
						    	</form>
						 	 </div>
						</div>
						<!-- 일정 등록 모달 end---------------------------------------------------------------------->
					</div>
				</div>
				
				<div class="guestSchedule_div">
					<span>📆<span id="resultMonth"></span>월 <span id="resultDay"></span>일</span>
					
					<div id="resultDiv"></div>
						
					<!-- 일정 수정 및 삭제 모달 ----------------------------------------------------------->
					<div class="modal fade" id="modifySchedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					 	<div class="modal-dialog modal-dialog-centered">
					 		<form method="POST" id="scheduleModifyForm">
			        		<input type="hidden" id="schCodeHidden" name="sch_code" value="" />
				        		
						    	<div class="modal-content" style="height: 300px;">
						      		<div class="modal-header">
						        		<h1 class="modal-title fs-5" id="staticBackdropLabel">일정 수정 및 삭제</h1>
					        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      		</div>
						      		
						      		<div class="modal-body" style="height: 120px; display: flex; flex-direction: column; justify-content: space-around;">
						        		<table>
						        			<tr>
						        				<td>
						        					<span id="descrption">일자</span>
						        				</td>
						        				<td>
						        					<input type="date" id="datepicker2" name="sch_date" required="required">
						        				</td>
						        			</tr>
						        			<tr>
						        				<td>일정명</td>
						        				<td><input type="text" id="upSch_name" name="sch_name" required="required" value=""></td>
						        			</tr>
						        			<tr>
						        				<td>내용</td>
						        				<td><input type="text" id="upSch_content" name="sch_content" required="required" value=""></td>
						        			</tr>
						        		</table>
							      	</div>
								      	
							      	<div class="modal-footer">
							        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="deleteSchedule()">삭제</button>
							        	<button type="button" class="btn" style="background-color: #94be2c; color: #ffffff;" onclick="updateSchedule()">수정</button>
							      	</div>
						    	</div>
				    		</form>
				 	 	</div>
					</div>
					<!-- 일정 수정 및 삭제 모달 end---------------------------------------------------------------------->
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