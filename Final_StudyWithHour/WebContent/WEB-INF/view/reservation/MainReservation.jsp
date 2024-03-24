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
<title>Reservation.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/groupPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
 
 	// 예약 검색 버튼 클릭 시 폼 전송
	function sendIt(form)
	{
		form.submit();
	}
	
 	// 검색내역에 따른 스터디카페 선택 시 폼 전송
	function reserveSubmit(srCode)
	{
		var form = document.getElementById("reserveForm" + srCode);
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
			
			<div class="content_div">
					
				<div class="page_title">
					<span><span>스터디카페</span> 예약</span>
				</div>
				
				<!-- 검색창 영역 -------------------------------------------------------------------->
				<c:choose>
				<c:when test="${empty reserveDate || empty reserveAddr1 || empty reserveAddr2}">
				<div class="select_div" id="reserveSearch">
				<form action="groupreservesearch.do?gjCode=1" method="post">
					<%-- 지역1을 선택 후 지역2 select에 데이터 출력 --%>
					<select	class="selectCafe_bar" name="reserveAddr1" onchange="location.href='locationlist.do?lfList=' +this.value+ '&grCode=1'">
						<c:choose>
							<%-- 만약 선택한 지역1 코드가 null 이면 --%>
							<c:when test="${lfCode == null}">
								<option value="">지역</option>
							<c:forEach var="lf" items="${lfList }">
								<option value="${lf.lfList }">${lf.lfList }</option>
							</c:forEach>
							</c:when>
							<%-- 만약 선택한 지역1 코드가 null 이 아니면 --%>
							<c:otherwise>
							<c:forEach var="lf" items="${lfList }">
								<c:choose>
								<c:when test="${lfCode == lf.lfCode }">
									<option selected="selected" value="${lf.lfList }">${lf.lfList }</option>
								</c:when>
								<c:otherwise>
									<option value="${lf.lfList }">${lf.lfList }</option>
								</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:otherwise>
						</c:choose>
					</select>
					<select	class="selectCafe_bar" name="reserveAddr2">
						<c:forEach var="ls" items="${lsName }">
						<c:choose>
							<c:when test="${reserveAddr2 eq  ls.lsCode}">
								<option selected="selected" value="${ls.lsList }">${ls.lsList }</option>
							</c:when>
							<c:otherwise>
								<option value="${ls.lsList }">${ls.lsList }</option>
							</c:otherwise>
						</c:choose>
						</c:forEach>
					</select>
					<label>
						<input type="date" id="datePicker" class="select_bar" name="reserveDate" id="reserveDate">
					</label>
					<select	class="selectCafe_bar" id="startHour" name="reserveHour1">
						<option>00:00</option>
						<option>01:00</option>
						<option>02:00</option>
						<option>03:00</option>
						<option>04:00</option>
						<option>05:00</option>
						<option>06:00</option>
						<option>07:00</option>
						<option>08:00</option>
						<option>09:00</option>
						<option>10:00</option>
						<option>11:00</option>
						<option>12:00</option>
					</select>
					<select class="selectCafe_bar" id="closeHour" name="reserveHour2">
						<option>06:00</option>
						<option>07:00</option>
						<option>08:00</option>
						<option>09:00</option>
						<option>10:00</option>
						<option>11:00</option>
						<option>12:00</option>
						<option>13:00</option>
						<option>14:00</option>
						<option>15:00</option>
						<option>16:00</option>
						<option>17:00</option>
						<option>18:00</option>
						<option>19:00</option>
						<option>20:00</option>
						<option>21:00</option>
						<option>22:00</option>
						<option>23:00</option>
						<option>24:00</option>
					</select>
					<select name="reserveCount" class="selectCafe_bar">
						<option value="2">2명</option>										
						<option value="3">3명</option>										
						<option value="4">4명</option>										
						<option value="5">5명</option>										
						<option value="6">6명</option>										
						<option value="7">7명</option>										
						<option value="8">8명</option>										
						<option value="9">9명</option>										
						<option value="10">10명</option>										
					</select>
					<select class="selectCafe_bar">
						<c:forEach var="group" items="${group }">
							<option value="${group.grCode }">${group.grName }</option>
						</c:forEach>
					</select>
					<button type="button" class="selectBtn" id="search" onclick="sendIt(this.form)">Search</button>
					</form>
				</div>
				</c:when>
				<c:when test="${not empty reserveDate && not empty reserveAddr1 && not empty reserveAddr2}">
				<div class="select_div" id="listSearch">
					검색정보 : 
					<input type="text" value="${reserveAddr1 },${reserveAddr2 }" class="select_bar" readonly="readonly">
					<input type="text" value="${reserveDate }" class="select_bar" readonly="readonly">
					<input type="text" value="${reserveHour1 }~${reserveHour2 }" class="select_bar" readonly="readonly">
					<input type="text" value="${reserveCount }명" class="select_bar" readonly="readonly">
					<button type="button" class="selectBtn" id="againSearch" onclick="location.href='groupreservesearch.do?gjCode=1'">다시 검색</button>
				</div>
				</c:when>
				</c:choose>
				<div style="margin-bottom: 15px;">
					<span id="count" style="font-weight: bold;">검색결과(${count })</span>
				</div>
				
				<!-- 스터디카페 영역 -------------------------------------------------->
				<div class="space_list">
				<c:choose>
				<c:when test="${count eq 0}">
					<div style="display: flex; align-items: center; justify-content: center; flex-direction: column;">
						<br>
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-question-lg" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M4.475 5.458c-.284 0-.514-.237-.47-.517C4.28 3.24 5.576 2 7.825 2c2.25 0 3.767 1.36 3.767 3.215 0 1.344-.665 2.288-1.79 2.973-1.1.659-1.414 1.118-1.414 2.01v.03a.5.5 0 0 1-.5.5h-.77a.5.5 0 0 1-.5-.495l-.003-.2c-.043-1.221.477-2.001 1.645-2.712 1.03-.632 1.397-1.135 1.397-2.028 0-.979-.758-1.698-1.926-1.698-1.009 0-1.71.529-1.938 1.402-.066.254-.278.461-.54.461h-.777ZM7.496 14c.622 0 1.095-.474 1.095-1.09 0-.618-.473-1.092-1.095-1.092-.606 0-1.087.474-1.087 1.091S6.89 14 7.496 14"/>
						</svg><br>
						<span style="font-size: 20px; font-weight: bold;">검색 결과가 존재하지 않습니다.</span>
					</div>
				</c:when>
				<c:otherwise>
				<c:forEach var="cafe" items="${lists }" varStatus="cf">
					<a href="javascript:reserveSubmit(${cafe.srCode })">
					<div class="space_div">
					<article class="box">
					<div class="inner">
						<div class="imgBox" style="width: 440px;">
							<span class="image">
							<img class="img" src="images/studycafe.jpg" style="width: 100%;">
							</span>
						</div>
					<form action="grouproomreserveform.do?srCode=${cafe.srCode }&gjCode=1" method="post" id="reserveForm${cafe.srCode }">
						<div class="info_area type_border" style="width: 440px; height: 180px; display: inline-grid; align-content: space-between;">
						<h3 class="tit_space">${cafe.scName }_${cafe.srName }</h3>
					<input type="hidden" name="scCode" value="${cafe.scCode}">
					<input type="hidden" name="reserveDate" value="${reserveDate}">
					<input type="hidden" name="reserveAddr1" value="${reserveAddr1}">
					<input type="hidden" name="reserveAddr2" value="${reserveAddr2}">
					<input type="hidden" name="reserveHour1" value="${reserveHour1}">
					<input type="hidden" name="reserveHour2" value="${reserveHour2}">
					<input type="hidden" name="reserveCount" value="${reserveCount}">
					</form>
						<div class="tags">
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
							  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"/>
							  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
							</svg>
							<span class="tag_area_name">${cafe.scAddr1 }</span>
						</div>
							<div class="infoTxt">
							<div class="info_price_hour">
							<strong class="price">${cafe.srPrice }</strong> 
							<span class="txt_unit">원/시간</span></div> 
							<div class="info_number_love">
							<span class="txt_number_maxUser">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
							  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
							</svg><em>최대 ${cafe.srCount }인</em></span> 
							<span class="txt_number_review">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
							  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>
							  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9 9 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.4 10.4 0 0 1-.524 2.318l-.003.011a11 11 0 0 1-.244.637c-.079.186.074.394.273.362a22 22 0 0 0 .693-.125m.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6-3.004 6-7 6a8 8 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a11 11 0 0 0 .398-2"/>
							</svg><em>27</em></span> 
							<span class="txt_number_love">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-heart" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 4.41c1.387-1.425 4.854 1.07 0 4.277C3.146 5.48 6.613 2.986 8 4.412z"/>
							  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z"/>
							</svg><em>109</em></span>
							</div>
							</div>
						</div>
						</div>
					</div>
					</article>
					</div>
					</a>
				</c:forEach>
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