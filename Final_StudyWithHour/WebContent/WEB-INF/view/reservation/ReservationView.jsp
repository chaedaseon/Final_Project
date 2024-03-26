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
<title>ReservationView.jsp</title>
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
	function reserveSubmit(scCode)
	{
		var form = document.getElementById("reserveForm" + scCode);
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
				
				<div style="margin-top: 20px;"></div>
				<div class="page_title">
					<span><span>스터디카페</span> 둘러보기</span>
				</div>
				
				<!-- 검색창 영역 -------------------------------------------------------------------->
				<div class="select_div" id="reserveSearch">
				<form action="reservesearch.do" method="post">
					<select	class="selectCafe_bar" name="reserveAddr">
						<option value="">지역 검색</option>
						<c:forEach var="lf" items="${lfList }">
							<c:choose>
							<c:when test="${reserveAddr eq lf.lfList}">
								<option selected="selected" value="${lf.lfList }">${lf.lfList }</option>
							</c:when>
							<c:otherwise>
								<option value="${lf.lfList }">${lf.lfList }</option>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<button type="button" class="selectBtn" id="search" onclick="sendIt(this.form)">Search</button>
				</form>
				</div>
					
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
					<a href="javascript:reserveSubmit(${cafe.scCode })">
					<div class="space_div">
					<article class="box">
					<div class="inner">
						<div class="imgBox" style="width: 440px;">
							<span class="image">
							<img class="img" src="images/studycafe.jpg" style="width: 100%;">
							</span>
						</div>
						<form action="cafesearchform.do?scCode=${cafe.scCode }" method="post" id="reserveForm${cafe.scCode }">
						<div class="info_area type_border" style="width: 440px; height: 180px; display: inline-grid; align-content: space-between;">
						<h3 class="tit_space">${cafe.scName }</h3>
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
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
							  <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"/>
							</svg>
								<span class="txt_unit">${fn:substring(cafe.scTel,0,3) }-${fn:substring(cafe.scTel,3,7) }-${fn:substring(cafe.scTel,7,11) }</span></div> 
							</div>
						</div>
						</div>
						</form>
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