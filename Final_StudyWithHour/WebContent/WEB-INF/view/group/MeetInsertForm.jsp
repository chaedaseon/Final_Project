<%@page import="com.study.mvc.model.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	GuestDTO guest = (GuestDTO)session.getAttribute("guest");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MeetInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript"src="http://code.jquery.com/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	
	// 불참자(있음/없음) 선택 시 불참자 등록 버튼 활성화여부 확인
	$(function (){
		 
		$('input[type="radio"][id="unAtt"]').on('click', function(){
	             $('#attState').css('display','none');
	             $('#regUnatt').css('display','flex');
		  });
		 
	});
	
	// 불참자 등록 시 폼 전송
	function sendIt(form)
	{
		form.submit();
	}
	
	// 등록 버튼 선택 시 폼 전송
	function sendMeet(form)
	{
		form.submit();
	}

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
				<div class="register_div">
					<div class="register_description">
						<span style="color: #94bc32; font-weight: bold; font-size: 38px;">
							모임기록
						</span>
					</div>	
					
					<div class="underline"></div>
					
					<div class="register_form">
					<c:choose>
					<c:when test="${meet.meetState eq '있음' }">
						<table>
							<tr>
								<td class="register_title">
									<span>모임날짜</span>
								</td> 
								<td class="register_input" colspan="2">
									<span>${fn:substring(meet.gschDate,0,11) }</span>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>모임장소</span>
								</td> 
								<td class="register_input" colspan="2">
									<span>${meet.gschLocation }</span>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>모임명</span>
								</td> 
								<td class="register_input" colspan="2">
									<span>${meet.gschName }</span>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>내용</span>
								</td> 
								<td class="register_input" colspan="2">
									<span style="white-space: pre-line;">${meet.gschContent }</span>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>모임상세기록</span>
								</td> 
								<td class="register_input" colspan="2">
									<span>${meetContent }</span>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>불참자</span>
								</td> 
								<td class="register_input" colspan="2">
									<c:forEach var="mem" items="${unattMem }">
										<span>${mem.member }</span>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>참석자</span>
								</td> 
								<td class="register_input" colspan="2">
									<c:forEach var="mem" items="${attMem }">
										<span>${mem.member }</span>
									</c:forEach>
								</td>
							</tr>
						</table>
					</div>
				
					<div class="underline"></div>
					
					<button type="reset" class="signUp signUp-del" onclick="location.href='groupmeetlist.do?gu_code=<%=guest.getGuCode()%>&gr_code=${grCode }'">목 록</button>
					</c:when>
					<c:otherwise>
					<form action="groupmeetinsert.do?gschCode=${meet.gschCode }&gu_code=<%=guest.getGuCode()%>&gr_code=${grCode }" method="post" id="meetAddForm">
						<table class="meetRegister">
							<tr>
								<td class="register_title">
									<span>모임날짜</span>
								</td> 
								<td class="register_input" colspan="2">
									<input type="text" class="register_text" name="meetDate" value="${fn:substring(meet.gschDate,0,11) }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>모임장소</span>
								</td> 
								<td class="register_input" colspan="2">
									<input type="text" class="register_text" name="meetLocation" value="${meet.gschLocation }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>모임명</span>
								</td> 
								<td class="register_input" colspan="2">
									<input type="text" class="register_text" name="meetName" value="${meet.gschName }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>내용</span>
								</td> 
								<td class="register_input" colspan="2">
									<input type="text" class="register_text" name="meetContent" value="${meet.gschContent }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>모임상세기록</span>
								</td> 
								<td class="register_input" colspan="2">
									<textarea class="register_text regform-control" name="meetDetail"></textarea>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>불참자 유/무</span>
								</td> 
								<td class="register_input" colspan="2" id="attState">
									<label><input type="radio" name="att" id="unAtt">있음</label>
									<label><input type="radio" name="att">없음</label>
								</td>
								<td class="register_input" colspan="2" id="regUnatt" style="display: none; align-items: center; ">
									<button type="button" style="width: 100px;" data-bs-toggle="modal" data-bs-target="#meetInsert">불참자 등록</button>
								</td>
							</tr>
						</table>
					</div>
				
					<div class="underline"></div>
					
					<button type="reset" class="signUp signUp-del" onclick="location.href='groupmeetlist.do?gu_code=<%=guest.getGuCode()%>&gr_code=${grCode }'">취 소</button>
					<button type="button" class="signUp" onclick="sendMeet(form)">등 록</button>
				</form>
					</c:otherwise>
					</c:choose>
				</div>
				
	<!-- 불참자 등록 모달 영역 -->
    <div class="modal fade" id="meetInsert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="meetInsertLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
         <h1 class="modal-title fs-5" id="meetInsertLabel">불참자 등록</h1>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       </div>
       	<form action="groupunattmemberinsert.do?gu_code=<%=guest.getGuCode()%>&gr_code=${grCode }&gschCode=${meet.gschCode }" method="post">
          <div class="modal-body" style="text-align: center; display: flex; justify-content: space-evenly;">
            <select name="attlCode" class="regInput">
            	<c:forEach var="mem" items="${preattMem }">
            		<option value="${mem.attlCode }">${mem.member }</option>
            	</c:forEach>
			</select>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
            <button type="button" class="btn btn-primary" onclick="sendIt(form)">Yes</button>
          </div>
         </form>
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