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
<title>그룹 - 일정 관리(캘린더)</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/groupPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">

 	var today = new Date(); // 오늘 날짜
	var date = new Date();
 	
 	var guCode = ${guCode};
 	var grCode = ${grCode};


	// 모임일때만 참석자 선택 목록 노출
	$(document).ready(function()
	{
		$(".atttype").change(function()
		{
			var together = document.getElementById("together");
		 	if(together.checked)
			{
				$('.attMember').css('display','block');
				
				$.ajax({
				    url: 'groupselectattmember.do',
				    method: 'post',
				    data : {grCode : grCode, guCode : guCode },
				    dataType : 'json',
				    success: function (jsonObj) 
				    {
				    	
				    	var out = "";
				    	
				    	for (var idx=0; idx<jsonObj.length; idx++)
			    		{
			    			// gschCode, gschName, gschDate, startHour , endHour , content, location, leadMember, attCk, gschType 
			    			var gjCode = jsonObj[idx].gjCode;
			    			var guNick = jsonObj[idx].guNick;
							
								out += "<div class='form-check form-check-inline'>";
								out += "<input class='form-check-input member' type='checkbox' name='member' id='member"+ idx +"' value='" + gjCode + "'>";
								out += "<label class='form-check-label' for='member"+ idx +"'>" + guNick +"</label>";
								out += "</div>"; 
			    		}
		    			$("#attMemberList").html(out);
				    },
				    error:function(e) 
				    {
				    	alert(e.responseText);
				    }
				});
				
			}
			else
			{
				$('.attMember').css('display','none');
			} 
		});
		
		// 시간 종일 선택
		$(".timeselect").change(function()
		{
			var all = document.getElementById("all");
		 	if(all.checked)
			{
				$(".startHour").attr("disabled",true);
				$(".endHour").attr("disabled",true);
			}
			else
			{
				$(".startHour").attr("disabled",null);
				$(".endHour").attr("disabled",null);
			} 
		});
		
		
		// 일정 상세보기
		$("#detailSchedule").onload(function()
		{
			alert("클릭 테스트");
		})
		
	});
		
	
	//이전 달을 today에 값을 저장
	function beforeMonth() 
	{ 
	    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	 	$("#resultDiv").html(" ");
	    build(); //만들기
	}

	//다음 달을 today에 저장
	function nextMonth()  
	{
	    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	 	$("#resultDiv").html(" ");
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
	        cell.innerHTML = "<div class='top-date'><button class='dateBtn' onclick='datefn(this.id)' id='date_" + String(i).padStart(2,'0') + "'><div class='i'>" + i + "</div></button></div>";
	        cell.className = "div_date"
	        cnt = cnt + 1;
	        if (cnt % 7 == 1)		//일요일 계산 
	        {
	        	cell.innerHTML = "<div class='top-date'><button class='dateBtn' onclick='datefn(this.id)' style='color: #ff8282' id='date_" + String(i).padStart(2,'0') + "'><div class='i'>" + i + "</div></a></div>";
	            cell.className = "div_date"
	        }
	        if (cnt % 7 == 0) 		// 1주일이 7일 이므로 토요일 계산
	        { 
	            cell.innerHTML = "<div class='top-date'><button class='dateBtn' onclick='datefn(this.id)' style='color: #62b0ff' id='date_" + String(i).padStart(2,'0') + "'><div class='i'>" + i + "</div></a></div>";
	            cell.className = "div_date"
	            	
	            row = calendar.insertRow();// 줄 추가
	        }
	    }
		var info = "grCode="+grCode;
	    $.ajax(
	    {
	    	type:"POST"
	    	, url:"groupschedulelist.do"
	    	, data: {grCode : grCode}
	    	, dataType :"json"
	    	, success:function(jsonObj)
	    	{
	    		for (var idx=0; idx<jsonObj.length; idx++)
	    		{
	    			/* gschCode, gschName, gschDate, startHour , endHour , content, location, leadMember, attCk, gschType */
	    			var gschCode = jsonObj[idx].gschCode;
	    			var gschName = jsonObj[idx].gschName;
	    			var gschDate = jsonObj[idx].gschDate;
	    			var startHour = jsonObj[idx].startHour;
	    			var endHour = jsonObj[idx].endHour;
	    			var content = jsonObj[idx].content;
	    			var location = jsonObj[idx].location;
	    			var leadMember = jsonObj[idx].leadMember;
	    			var attCk = jsonObj[idx].attCk;
	    			var memberListNickName = jsonObj[idx].memberListNickName;
	    			var gschType = jsonObj[idx].gschType;
					
	   
	    			for(var i=1; i<lastDate.getDate(); i++)
	    			{
	    				
	    				var year = today.getFullYear();
	    				var month = String(today.getMonth()+1).padStart(2, '0');
	    				var day = String(i).padStart(2,'0');
	    				
	    				
	    				
	    				if(year==gschDate.substring(0,4) && month==gschDate.substring(5,7) && day==gschDate.substring(8,10))
	    				{
	    					var cell = document.getElementById("date_" + gschDate.substring(8, 10)); // 각 날짜에 해당하는 셀 가져오기
	   						cell.innerHTML += "<div class='sch_name'>" + gschName.substring(0,6) + "</div>";
	   						if((String(today.getDate()).padStart(2, '0'))== i)
	   						{
	   							var out = "";
								out += "<div class='guestSchedule'>";
								out += "<button type='button' class='schedule_modifyBtn' data-bs-toggle='modal' data-bs-target='#detailSchedule'>";
								out += "<div class='schName'>";
								out += "<span>" + gschName + "</span>";
								out += "</div>"; 
								out += "<div class='schContent'>" + content +"</div>";
								out += "</button>";
								out += "</div>";
								
				    			$("#resultDiv").append(out);
				    			
								$("#datepicker2").val(gschDate.substring(0,10));
								$("#gschDate").html(gschDate);
								$("#gschName").html(gschName);
								$("#startHour").html(startHour);
								$("#endHour").html(endHour);
								$("#location").html(location);
								$("#gschcontent").html(content);
								$("#gschType").html(gschType);
								$("#gschCode").val(gschCode)
								$("#attCk").val(attCk)
								
								if (attCk=="1")
								{
									$("#memberck").text("참석자");
									$("#memberList").html(memberListNickName);
								}
								else
								{
									$("#memberck").html(" ");
									$("#memberList").html(" ");
								}
	   						}
	   						
	    				}
	    			} 
	    		}
	    		// 페이지가 처음 로드될 때에는 오늘 날짜 출력
	    		
	    		$("#resultMonth").html(String(today.getMonth()+1).padStart(2, '0'));
				$("#resultDay").html(String(today.getDate()).padStart(2, '0'));
				
	    	}
	    	, error:function(e)
	    	{
	    		$("#resultDiv").html(" ");
	    		$("#resultMonth").html(String(today.getMonth()+1).padStart(2, '0'));
				$("#resultDay").html(String(today.getDate()).padStart(2, '0'));
	    		$("#resultDiv").html("등록된 일정이 없습니다.");
	    	}
    	}); 
	}//-- build()


	// 날짜 선택 시, 해당하는 일정 출력
 	function datefn(buttonId)
	{
		var year = today.getFullYear();
		var month = String(today.getMonth()+1).padStart(2, '0');
		var day = buttonId.substring(5,7);
		
		var info = "guCode=" + guCode +"&gschDate="+year+"-"+month+"-"+day;
		var gschDate = year+"-"+month+"-"+day;
	    $.ajax(
	    {
	    	type:"POST"
	    	, url:"groupsearchschedule.do"
	    	, data:{grCode : grCode, gschDate : gschDate }
	    	, dataType :"json"
	    	, success:function(jsonObj)
	    	{
    			var out = "";
	    		for (var idx=0; idx<jsonObj.length; idx++)
	    		{
	    			//gschCode, gschName, gschDate, startHour , endHour , content, location, leadMember, attCk, gschType 
	    			var gschCode = jsonObj[idx].gschCode;
	    			var gschName = jsonObj[idx].gschName;
	    			var gschDate = jsonObj[idx].gschDate;
	    			var startHour = jsonObj[idx].startHour;
	    			var endHour = jsonObj[idx].endHour;
	    			var content = jsonObj[idx].content;
	    			var location = jsonObj[idx].location;
	    			var leadMember = jsonObj[idx].leadMember;
	    			var attCk = jsonObj[idx].attCk;
	    			var memberListNickName = jsonObj[idx].memberListNickName;
	    			var gschType = jsonObj[idx].gschType;
	    			
	    			
    				if(year==gschDate.substring(0,4)&&month==gschDate.substring(5,7)&&(day==gschDate.substring(8,10)))
    				{
    					out += "<div class='guestSchedule'>";
    					out += "<button type='button' class='schedule_modifyBtn' data-bs-toggle='modal' data-bs-target='#detailSchedule'>";
    					out += "<div class='schName'>";
    					out += "<span>" + gschName + "</span>";
    					out += "</div>"; 
    					out += "<div class='schContent'>"+content+"</div>";
    					out += "</button>";
    					out += "</div>";
    				}
					$("#resultDiv").html(out);
					$("#resultMonth").html(month);
					$("#resultDay").html(day);
					$("#schCodeHidden").val(gschCode);
					$("#datepicker2").val(gschDate.substring(0,10));
					$("#gschDate").html(gschDate);
					$("#gschName").html(gschName);
					$("#startHour").html(startHour);
					$("#endHour").html(endHour);
					$("#location").html(location);
					$("#gschcontent").html(content);
					$("#gschType").html(gschType);
					$("#gschCode").val(gschCode)
					$("#attCk").val(attCk)
					
					if(${gjCode}==leadMember && attCk!='3')
					{
					$("#delCk").html("<button type='submit' class='btn' id='groupScheduleAdd' onclick='gschDel()'>삭제</button> ");
						
					}
					
					if (attCk=="1")
					{
						$("#memberck").html("참석자");
						$("#memberList").html(memberListNickName);
					}
					else
					{
						$("memberck").html(" ");
						$("#memberList").html(" ");
					}
					$("#upSch_content").val(content);
					
	    		}
	    	}
	    	, error:function(e)
	    	{
	    		$("#resultDiv").html(" ");
				$("#resultMonth").html(month);
				$("#resultDay").html(day);
	    		$("#resultDiv").html("등록된 일정이 없습니다.");
	    	}
    	});
		
	} //end datefn(buttonId)  
	// 일정 추가 모달에 사용되는 datepicker
	$(function()
	{
        $('#datepicker1').datepicker();
     });
	
	$(function()
	{
        $('#datepicker2').datepicker();
     });
 
	
<%-- 		
	// 일정 수정 버튼 클릭시 수행
 	function deleteSchedule() 
	{
        var schCode = $("#schCodeHidden").val();
        var deleteUrl = "guestscheduledelete.do?gu_code=<%=guest.getGuCode() %>&sch_code=" + schCode;
        
        $("#scheduleModifyForm").attr("action", deleteUrl);
        $("#scheduleModifyForm").submit();
    }
	
 	function updateSchedule() 
 	{
 		var schCode = $("#schCodeHidden").val();
        var updateUrl = "guestscheduleupdate.do?gu_code=<%=guest.getGuCode()%>";
        
        $("#scheduleModifyForm").attr("action", updateUrl);
        $("#scheduleModifyForm").submit();
        
    }
 --%>
	function gschAdd()
	{
		var gschForm = document.getElementById("gschForm");
		var together = document.getElementById("together");
		
		
		if(together.checked)
		{
			var checks = document.getElementsByName("member");
			var count = 0;
			
			for (var i=0; i < checks.length; i++) 
			{ 
				
				if (checks[i].checked) 
				{ 
					count += 1; 
				} 
			
			}
			if(count == 0)
			{
				alert("참석자를 선택해주세요");
				return;
			}
			
		}
		
		
		if(!gschForm.gschDate.value)
		{
			alert('날짜를 선택해주세요.');
			return;
		}
		if(!gschForm.gschName.value)
		{
			alert('일정 이름을 입력해주세요.');
			return;
		}
		if(!gschForm.location.value)
		{
			alert('장소를 입력해주세요.');
			return;
		}
		if(!gschForm.contents.value)
		{
			alert('일정 내용을 입력해주세요.');
			return;
		}
	
		
		
		if(together.checked)
		{
			var url = "groupscheduleinsertwith.do";
	        $("#gschForm").attr("action", url);
	        $("#gschForm").submit();
	
		}
		else
		{
			var url2 = "groupscheduleinsert.do";
	        $("#gschForm").attr("action", url2);
	        $("#gschForm").submit();
		}

	}
</script>

</head>
<body onload="build()">

	<header>
		<c:import url="Menu.jsp"></c:import>
	</header>
	
	<section>
	
		<div id="content">
			<c:import url="SideMenu.jsp"></c:import>
			<div class="rightContent_div">
				<div class="content_div">
				
					<div class="page_title">
					<span><span>그룹 일정</span>관리</span>
					</div>
				
					<div class="sorting_div">
					
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
				        		
						    	<div class="modal-content" >
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
	    			<!-- var gschCode = jsonObj[idx].gschCode;
	    			var gschName = jsonObj[idx].gschName;
	    			var gschDate = jsonObj[idx].gschDate;
	    			var startHour = jsonObj[idx].startHour;
	    			var endHour = jsonObj[idx].endHour;
	    			var content = jsonObj[idx].content;
	    			var location = jsonObj[idx].location;
	    			var leadMember = jsonObj[idx].leadMember;
	    			var attCk = jsonObj[idx].attCk; -->
					<!-- 일정 상세 보기 ----------------------------------------------------------->
	                  <div class="modal fade  " id="detailSchedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered">
	                      <div class="modal-content">
	                        <div class="modal-header">
	                          <h1 class="modal-title fs-5" id="staticBackdropLabel"><span id="gschType"></span> 상세 보기</h1>
	                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                        </div>
	                        <div class="modal-body">
						 	
						 	<table>
						 		<tr>
						 			<th> 날짜 </th>
						 			<td><span id="gschDate"></span></td>
						 		</tr>
						 		<tr>
						 			<th> 시간 </th>
						 			<td><span id="startHour"></span> ~ <span id="endHour"></span></td>
						 		</tr>
						 		<tr>
						 			<th> 이름 </th>
						 			<td><span id="gschName"></span></td>
						 		</tr>
						 		<tr>
						 			<th> 장소 </th>
						 			<td><span id="location"></span></td>
						 		</tr>
						 		
						 		<tr>
						 			<th> 모임 내용 </th>
						 			<td><span id="gschcontent"></span></td>
						 		</tr>
							 		<tr>
							 			<th><span id="memberck"></span></th>
							 			<td><span id="memberList"></span></td>
							 		</tr>
						 	</table>
	                        
	                        <div class="modal-footer sorting_div">
	                       <!--    <button type="button" class="btn " data-bs-dismiss="modal">수정</button> -->

                        <form action="groupscheduledelete.do" method="post">
                        	<input type="hidden" id="gschCode" name="gschCode">
                        	<input type="hidden" id="attCk" name="attCk">
	                        <input type="hidden" id="grCode" name="grCode" value="${grCode }">
	                        <input type="hidden" id="guCode" name="guCode" value="${guCode }">
	                        <span id="delCk"></span>
	                          <!-- <button type="submit" class="btn" id="groupScheduleAdd" onclick="gschDel()">삭제</button> -->
                          </form>   
	                          <button type="button" class="btn  notice_btn" data-bs-dismiss="modal">닫기</button>
	                        </div>
	                      </div>
	                    </div>
	                    </div>
	                  </div><!--  모달 영역 끝 -->		
					<!-- 일정 상세 보기  end---------------------------------------------------------------------->
			
				</div>
			</div>					
		</div>
		
		 
	</section>
				<!-- 일정/모임 추가 모달 영역 -->
					<form method="post" id="gschForm">
	                  <div class="modal fade  " id="addSchedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered">
	                      <div class="modal-content">
	                        <div class="modal-header">
	                          <h1 class="modal-title fs-5" id="staticBackdropLabel">일정 / 모임 추가</h1>
	                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                        </div>
	                        <div class="modal-body">
						   	<div class="row ">
						  	  <label for="date-select" class="col-sm-2 col-form-label"> 날짜 : </label>
							  <div class="col-sm-9 ">
							   <input type="date" id="datepicker1" name="gschDate" required="required">
							  </div>
							</div>
							
							<!-- 시작시간 / 끝나는 시간 설정 -->
							<br>
							<div class="row">

						  	  <label for="time-select" class="col-sm-2 col-form-label">시간 : </label>
  							    <div class="col-sm-9">
								  <div class="form-check form-check-inline">
									  <input class="form-check-input timeselect" type="radio" name="timeselect" id="all" checked="checked">
									  <label class="form-check-label" for="all">
									    종일
									  </label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input timeselect" type="radio" name="timeselect" id="notAll">
									  <label class="form-check-label" for="notAll">
									    시간 선택
									  </label>
									</div>
								</div>
							  <div class="col-sm-4 ">
							   <select class="form-select startHour " aria-label="time-select" id="startHour" name="startHour" disabled="disabled">
									  <option value="00:00" selected >00:00</option>
									  <option value="01:00">01:00</option>
									  <option value="02:00">02:00</option>
									  <option value="03:00">03:00</option>
									  <option value="04:00">04:00</option>
									  <option value="05:00">05:00</option>
									  <option value="06:00">06:00</option>
									  <option value="07:00">07:00</option>
									  <option value="08:00">08:00</option>
									  <option value="09:00">09:00</option>
									  <option value="10:00">10:00</option>
									  <option value="11:00">11:00</option>
									  <option value="12:00">12:00</option>
									  <option value="13:00">13:00</option>
									  <option value="14:00">14:00</option>
									  <option value="15:00">15:00</option>
									  <option value="16:00">16:00</option>
									  <option value="17:00">17:00</option>
									  <option value="18:00">18:00</option>
									  <option value="19:00">19:00</option>
									  <option value="20:00">20:00</option>
									  <option value="21:00">21:00</option>
									  <option value="22:00">22:00</option>
									  <option value="23:00">23:00</option>
									  <option value="24:00">24:00</option>
									</select> 
							  </div>
							  <label for="time-select" class="col-sm-1 col-form-label">~</label>
							  <div class="col-sm-4">
		 						   <select class="form-select endHour" aria-label="time-select" id="endHour" name="endHour" disabled="disabled">
									  <option value="00:00">00:00</option>
									  <option value="01:00">01:00</option>
									  <option value="02:00">02:00</option>
									  <option value="03:00">03:00</option>
									  <option value="04:00">04:00</option>
									  <option value="05:00">05:00</option>
									  <option value="06:00">06:00</option>
									  <option value="07:00">07:00</option>
									  <option value="08:00">08:00</option>
									  <option value="09:00">09:00</option>
									  <option value="10:00">10:00</option>
									  <option value="11:00">11:00</option>
									  <option value="12:00">12:00</option>
									  <option value="13:00">13:00</option>
									  <option value="14:00">14:00</option>
									  <option value="15:00">15:00</option>
									  <option value="16:00">16:00</option>
									  <option value="17:00">17:00</option>
									  <option value="18:00">18:00</option>
									  <option value="19:00">19:00</option>
									  <option value="20:00">20:00</option>
									  <option value="21:00">21:00</option>
									  <option value="22:00">22:00</option>
									  <option value="23:00">23:00</option>
									  <option value="24:00" selected>24:00</option>
									</select> 
							  </div>
							</div>
							
							<!-- 장소 -->
							<br>
							
							<div class="row ">

				  	  		<label for="location-select" class="col-sm-2 col-form-label">이름 : </label>
							    <div class="col-sm-9">
								   <input type="text" class="form-control form-control-sm" aria-label="location-select" id="gschName" name="gschName">
								</div>
							</div>
							
							<!-- 장소 -->
							<br>
							
							<div class="row ">

				  	  		<label for="location-select" class="col-sm-2 col-form-label">장소 : </label>
							    <div class="col-sm-9">
								   <input type="text" class="form-control form-control-sm" aria-label="location-select" id="location" name="location">
								</div>
							</div>
							
							<!-- 유형 (일정 / 모임) -->
							<br>
							
							<div class="row ">

				  	  		<label for="schedule-type" class="col-sm-2 col-form-label">유형 : </label>
							    <div class="col-sm-9">
									<div class="form-check form-check-inline">
									  <input class="form-check-input atttype" type="radio" name="attCk" id="alone" checked="checked" value="2">
									  <label class="form-check-label" for="alone" >
									    일정
									  </label>
									</div>
								  <div class="form-check form-check-inline">
									  <input class="form-check-input atttype" type="radio" name="attCk" id="together" value="1">
									  <label class="form-check-label" for="together">
									    모임
									  </label>
									</div>
								</div>
							</div>
							
							<!-- 참석자 -->
							
							<div class="row attMember">

				  	  		<label class="col-sm-2 col-form-label">참석자 : </label>
							    <div class="col-sm-9" id="attMemberList">
							    
								</div>
							</div>
							
						  <!-- 일정 내용 -->
							<br>
							
							<div class="row ">

				  	  		<label for="location-select" class="col-sm-2 col-form-label">내용 : </label>
							    <div class="col-sm-9" id="contentDiv">
								   <input type="text" class="form-control form-control-sm " aria-label="location-select" id="contents" name="content">
								</div>
							</div>
	                        
	                        <input type="hidden" id="grCode" name="grCode" value="${grCode }">
	                        <input type="hidden" id="guCode" name="guCode" value="${guCode }">
	                           
	                        <div class="modal-footer sorting_div">
	                          <button type="button" class="btn " data-bs-dismiss="modal">No</button>

	                          <button type="button" class="btn notice_btn" id="groupScheduleAdd" onclick="gschAdd()">Yes</button>
	                        </div>
	                      </div>
	                    </div>
	                    </div>
	                  </div><!--  모달 영역 끝 -->			
                      </form>
	   
	 <footer>
		<jsp:include page="/Footer.jsp" />
	</footer>

</body>
</html>