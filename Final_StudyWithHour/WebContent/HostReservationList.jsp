<%@page import="com.test.mvc.HostDTO"%>
<%@page import="com.test.mvc.HostDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.test.mvc.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 호스트 세션 받아오기
	String hoCode = (String)session.getAttribute("hoCode");
	HostDAO hostDao = new HostDAO();
	HostDTO host = hostDao.sessionHost(hoCode);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HostReservationList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/hostPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	function redInsert()
	{
		//alert("확인");
		var redForm = document.redForm;
		redForm.submit();
	}
	
	function sendIt()
	{
		var f = document.searchForm;
		
		f.submit();		
	}

 	/*
	function fbChange(fbForm)
	{
		fbForm.submit();
	}
	
	function reChange(reForm)
	{
		reForm.submit();
	}
	*/

</script>
</head>
<body>
	<header>
		<c:import url="Menu.jsp"></c:import>
	</header>

	<section>

		<div id="content">
			<c:import url="SideMenu.jsp"></c:import>

			<div class="rightContent_div">
				<div class="content_div">
				
				<div class="page_title">
					<span><span>예약 내역</span> 관리</span>
				</div>
				<div class="select_div">
					<form action="cafereservelist.do?hoCode=<%=host.getHoCode()%>" method="post" name="searchForm">
					<%-- <form action="cafereservelist.do?hoCode=<%=host.getHoCode()%>" method="post" id="fbStateForm"> --%>
					<select class="select_bar" name="fbState">
						<c:choose>
						<c:when test="${fbState eq 'done' }">
							<option value="fbAll">전체</option>
							<option value="done" selected="selected">이용완료</option>
							<option value="yet">이용예정</option>
							<option value="noshow">노쇼</option>
						</c:when>
						<c:when test="${fbState eq 'yet' }">
							<option value="fbAll">전체</option>
							<option value="done">이용완료</option>
							<option value="yet" selected="selected">이용예정</option>
							<option value="noshow">노쇼</option>
						</c:when>
						<c:when test="${fbState eq 'noshow' }">
							<option value="fbAll">전체</option>
							<option value="done">이용완료</option>
							<option value="yet">이용예정</option>
							<option value="noshow" selected="selected">노쇼</option>
						</c:when>
						<c:otherwise>
							<option value="fbAll" selected="selected">전체</option>
							<option value="done">이용완료</option>
							<option value="yet">이용예정</option>
							<option value="noshow">노쇼</option>
						</c:otherwise>
						</c:choose>
					</select>
					<%-- <form action="cafereservelist.do?hoCode=<%=host.getHoCode()%>" method="post" id="reStateForm"> --%>
					<select class="select_bar" name="reState">
					<c:choose>
					<c:when test="${reState eq 'access' }">
						<option value="reAll">전체</option>
						<option value="access" selected="selected">확정</option>
						<option value="cancel">취소</option>
					</c:when>
					<c:when test="${reState eq 'cancel' }">
						<option value="reAll">전체</option>
						<option value="access">확정</option>
						<option value="cancel" selected="selected">취소</option>
					</c:when>
					<c:otherwise>
						<option value="reAll" selected="selected">전체</option>
						<option value="access">확정</option>
						<option value="cancel">취소</option>
					</c:otherwise>
					</c:choose>
					</select>
					<%-- <form action="cafereservelist.do?hoCode=<%=host.getHoCode()%>" method="post" name="searchForm"> --%>
					<select name="searchKey" class="select_bar">
						<c:choose>
							<c:when test="${searchKey eq 'cafe' }">
								<option value="resDate">예약일자</option>
								<option value="cafe" selected="selected">스터디카페명</option>
								<option value="room">스터디룸</option>
							</c:when>
							<c:when test="${searchKey eq 'room' }">
								<option value="resDate">예약일자</option>
								<option value="cafe">스터디카페명</option>
								<option value="room" selected="selected">스터디룸</option>
							</c:when>
							<c:otherwise><!-- 예약 날짜 캘린더에서 값 받기 -->
								<option value="resDate" selected="selected">예약일자</option>
								<option value="cafe">스터디카페명</option>
								<option value="room">스터디룸</option>
							</c:otherwise>
						</c:choose>
					</select> 
					<input type="text" class="selectInput" name="searchValue" placeholder="${searchValue }">
					<button type="button" class="selectBtn" onclick="sendIt()">Search</button>
					</form>
				</div>
				
				
				<div class="list">
					<table class="list_table">
						<tr class="spacer"></tr>
						<tr>
							<th>No</th>
							<th>스터디카페</th>
							<th>스터디룸</th>
							<th>예약일자 및 시간</th>
							<th>예약 상태</th>
							<th>이용 상태</th>
							<th>신고</th>
						</tr>
						<tr class="spacer"></tr>
						<c:forEach var="reserve" items="${reserve }" varStatus="vs">
						<tr>
							<td><a href="${articleUrl }&reCode=${reserve.reCode}">${reserve.rNum}</a></td>
							<td>${reserve.scName }</td>
							<td>${reserve.srName }</td>
							<td>${fn:substring(reserve.reStartDate,0,10) } / ${reserve.reStartHour } ~ ${reserve.reEndHour }</td>
							<c:choose>
								<c:when test="${countCancel > 0}">
									<td>취소</td>
								</c:when>
								<c:otherwise>
									<td>확정</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${reserve.fbState == '이용'}">
									<td>
									<!-- 버튼 눌러서 모달창 띄우기 -->
							        <button type="button" class="listBtn" id="feedback" value="${reserve.reCode }" 
							        data-bs-toggle="modal" data-bs-target="#staticBackdrop${vs.index }">피드백등록</button>
									</td>
								</c:when>
								<c:otherwise>
									<td>${reserve.fbState}</td>						
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${reserve.hrCode > 0}">
									<td>신고완료</td>
							    </c:when>
							    <c:otherwise>
							    <c:choose>
									<c:when test="${reserve.fbCode != null}">
							    	<td>
										<button type="button" class="redBtn" id="red" value="${reserve.fbCode }" 
										data-bs-toggle="modal" data-bs-target="#redStatic${vs.index }">🚨</button> 
										<%-- <button type="button" class="redBtn" id="red" value="${reserve.fbCode }" onclick="location.href='hostredinsertform.do?reCode=${reserve.reCode}'">🚨</button> --%>
								    </td>
		
								    </c:when>
								    <c:otherwise>
								    <td>
										<button type="button" class="redDoneBtn" disabled="disabled">🚨</button>
								    </td>
								    </c:otherwise>
								</c:choose>
								</c:otherwise>	
						    </c:choose>
						</tr>
	<!-- 모달 영역 -->
    <div class="modal fade" id="staticBackdrop${vs.index }" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="staticBackdropLabel">피드백 입력</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body" style="text-align: center;">
            <span>이용내역에 대한 피드백을 선택해주세요.</span>
            <input type="hidden" id="reCode" value="${reserve.reCode }">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-feedback" style="background-color: #94be2c; color: #ffffff;" onclick="location.href='hostfeedbackinsert.do?feed=2&reCode=${reserve.reCode }'">이용완료</button>
            <button type="button" class="btn btn-feedback" style="background-color: #94be2c; color: #ffffff;" onclick="location.href='hostfeedbackinsert.do?feed=1&reCode=${reserve.reCode }'">노쇼</button>
          </div>
        </div>
      </div>
    </div>
	<!-- 모달 영역 -->
    <div class="modal fade" id="redStatic${vs.index }" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="redStaticLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="redStaticLabel">신고</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="hostredinsert.do?code=${reserve.scCode }" method="post" id="redForm">
          <div class="modal-body" style="text-align: center; line-height: normal;">
          	<input type="hidden" id="fbCode" value="${reserve.fbCode }">
            <span>신고사유 : </span>
            <select id="reason" name="reason">
            <c:forEach var="reason" items="${reason }">
            	<option value="${reason.reasonCode }">${reason.reason }</option>
            </c:forEach>
            </select>
            <div style="margin-top: 10px"></div>
            <input type="file" name="file" id="file" style="margin-left: 110px;"> 
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-feedback" style="background-color: #94be2c; color: #ffffff;" onclick="redInsert()">제출</button>
            <button type="button" class="btn btn-feedback" aria-label="Close" data-bs-dismiss="modal" style="background-color: #94be2c; color: #ffffff;">취소</button>
          </div>
          </form>
        </div>
      </div>
    </div>			
    					</c:forEach>
						<c:if test="${dataCount <= 0 }">
    						<tr>
							<td colspan="7" style="text-align: center;">예약내역이 존재하지 않습니다.</td>
							</tr>
						</c:if>
						<tr class="spacer"></tr>
					</table>
				</div>
								
				<nav aria-label="Page navigation example paging" class="paging">
					<ul class="pagination">
						<c:if test="${dataCount != 0 }">
							<li class="page-item">${pageIndexList }</li>
						</c:if>
					</ul>
				</nav>
				</div>
			</div>
		</div>
		
	</section>

	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>
</body>
</html>