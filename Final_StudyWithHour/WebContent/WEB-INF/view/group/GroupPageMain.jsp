<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String gr_code = request.getParameter("grCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 - 메인</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/groupPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
// 달력 생성 함수 (페이지 로드되면 실행)
	function build()
	{
		
	 	var today = new Date(); // 오늘 날짜
		var date = new Date();
	 	
	 	var guCode = ${guCode};
	 	var grCode = ${grCode};
		
		
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
	        cell.innerHTML = "<div class='top-date' ><button class='dateBtn' onclick='datefn(this.id)' id='date_" + String(i).padStart(2,'0') + "'><div class='i'>" + i + "</div></button></div>";
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
	    			// gschCode, gschName, gschDate, startHour , endHour , content, location, leadMember, attCk, gschType
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
	    	, error:function(request, status, error){

	    		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	}
		}); 
	}//-- build()
</script>

</head>
<body onLoad="build()">

	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
	
		<div id="content">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
			<div class="rightContent_div">
				<div class="content_div">
				
					<div class="page_title">
					<span><span>${groupName }</span> 페이지</span>
					</div>
				
					<div class="sorting_div">

					</div>
				
				<div class="col-12 gap-3 " >
					<div class="group-main ">
						<div class="col-8 card group-main-calendar" >
						
							<div class="card-header bg-transparent">그룹 캘린더</div>
			  					<div class="card-body">
									
									<!-- 캘린더 영역 -->
							<div>	
						<table id="calendar" style="margin-top: 35px;">
							<tr>
					            <td colspan="7">
					            	<div style="display: flex; justify-content: center; position: relative">
						            	<div>
							            	<span id="yearMonth"></span>
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
							<!-- 캘린더 영역 끝 -->	
									
		  						</div>
						</div>
						<div class="col-4" id="grmain-right">
						<%-- 	<div class="card" >
								<div class="card-header bg-transparent">D-DAY</div>
				  					<div class="card-body">
										일정 이름... <br>
										<select id="dday">
											<c:forEach var="dday" items="${ddayList }">
											<option value="dday.gschCode"> 
											
											</c:forEach>
										</select>
										<div class="gsch-dday">
											d-11
										</div>
									
			  						</div>
							</div> --%>
							<div class="card" >
								<div class="card-header bg-transparent">그룹원</div>
				  					<div class="card-body">
										<div class="row">
											<div class="col-4">👑 ${leaderNick }</div>
											<c:forEach var="member" items="${memberNick }">
											<div class="col-4">${member }</div>
											
											</c:forEach>
										</div>
				  					</div>
							</div>
							
							<div class="card">
								<div class="card-header bg-transparent">최근 게시물</div>
			  					<div class="card-body">
			  					<c:forEach var="board" items="${boardList }">
			    					<p class="card-text">${board.gbTitle }</p>
			  						
			  					</c:forEach>
			  					</div>
							</div>
							
							<div class="card">
								<div class="card-header bg-transparent">알림</div>
			  					<div class="card-body">
			  					<c:forEach var="record" items="${recordList }">
			    					<p class="card-text">(${record.RECORDDATE}) ${record.RECORD }</p>
			  						
			  					</c:forEach>
			  					</div>
							</div>
							
						
						</div>
				
				</div>
		<%-- 		
 			 	<div class="col-12 " >
					<div class="group-main ">
						<div class="col-12 " >
						
							<div class="card">
								<div class="card-header bg-transparent">최근 게시물</div>
				  					<div class="card-body">
				    				<!-- <h5 class="card-title">Light card title</h5> -->
				    				<table>
					    				<c:forEach var="board" items="${boardList }">
					    				<tr>
					    					<td><a href="#">${board.gbTitle }</a></td>
					    					<td>${board.gbDate }</td>
					    					<td>${board.gbWriter }</td>
					    				</tr>
					    				</c:forEach> 
				    				</table>
			  					</div>
							</div>
						</div> 
			 --%>	
					<%-- 	<div class="col-4 " >
							
							<div class="card">
								<div class="card-header bg-transparent">알림</div>
			  					<div class="card-body">
			  					<c:forEach var="record" items="${recordList }">
			    					<p class="card-text">(${record.RECORDDATE}) ${record.RECORD }</p>
			  						
			  					</c:forEach>
			  					</div>
							</div>--%>
						</div> 
				</div>
				
				<div class="col-12 " >
					<div class="group-main ">
						<div class="col-11"> &nbsp;</div>
						<div class="col-1 " >
							<button type="button" class="btn notice_btn" data-bs-toggle="modal" data-bs-target="#ReportProcess" >
								탈퇴
	                	  	</button>	
						</div>
					</div>
				</div>
				
				
               	<!-- 그룹 탈퇴 모달 영역 -->
                  <div class="modal fade  " id="ReportProcess" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h1 class="modal-title fs-5" id="staticBackdropLabel">그룹 탈퇴</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form id="groupUnreg"  action="groupunregprocess.do" method="post">
                        <div class="modal-body">
                        
                    	정말 탈퇴하시겠습니까? <br> 탈퇴한 그룹은 다시 가입할 수 없습니다. 
                    	<br><br>
                    	탈퇴 사유 : 
                    	<select id="reason" name="reason">
                    		<option value="401">목적 달성</option>
                    		<option value="402">생각했던 활동 내용과 다름</option>
                    		<option value="403">개인사정</option>
                    		<option value="405">다른 그룹을 가입하기 위해서</option>
                    		<option value="406">그룹원과 맞지않음</option>
                    	</select>
                          
                        </div>
                        <div class="modal-footer sorting_div">
                          <button type="button" class="btn " data-bs-dismiss="modal">No</button>
                          <input type="text" style="display: none;" id="guCode" name="guCode" value="${guCode }">
                          <input type="text" style="display: none;" id="grCode" name="grCode" value="${grCode }">
                          <button type="submit" class="btn notice_btn" id="processBtn">Yes</button>
                        </div>
                          </form>
                      </div>
                    </div>
                  </div><!-- 그룹 탈퇴 모달 끝 -->							
				
				
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