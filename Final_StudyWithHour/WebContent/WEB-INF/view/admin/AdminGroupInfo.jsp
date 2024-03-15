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
<title>관리자 페이지 - 스터디그룹 상세정보 조회 </title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adminPageStyle.css">

<script type="text/javascript">


	function list(currPageNo, range, searchType, keyword) 
	{

		var url = "adminstudygrouplist.do";
		url = url + "?currPageNo=" + currPageNo;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;	

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
				
				
	
								
				<div class="page_title">
					<span><span>스터디그룹 번호</span> ${studyGroup.grCode }</span>
				</div>
		
					<div class="info_div">
				
						<table class="table ">
							<tbody>
								<tr>
									<th>스터디그룹 이름</th>
									<td>${studyGroup.grName }</td>
									<th>그룹장</th>
									<td>${leaderId }</td>
									<th>유효 패널티</th>
									<td>${pCount }개</td>
								</tr>
							</tbody>
						</table>
				
				</div><!-- admin-box  -->	
				
				<div class="info_div">
				
						<table class="table ">
							<tbody>								
								<tr>
									<th>최대 인원</th>
									<td >${studyGroup.grCount }</td>
									<th>현재 인원</th>
									<td >${groupCount }</td>
									<th>지역</th>
									<td >${location }</td>
								</tr>
								<tr>
									<th>성별제한</th>
									<td>
									<c:choose>
										<c:when test="${studyGroup.genderCode == '1' }">동일</c:when>
										<c:when test="${studyGroup.genderCode == '2' }">무관</c:when>
									</c:choose>
									</td>
									<th>나이 제한</th>
									<td>
									<c:choose>
										<c:when test="${studyGroup.ageCode == '1' }">유사</c:when>
										<c:when test="${studyGroup.ageCode == '2' }">무관</c:when>
										<c:when test="${studyGroup.ageCode == '3' }">동일</c:when>
									</c:choose>
									</td>
									<th>공개 여부</th>
									<td >
									<c:choose>
										<c:when test="${studyGroup.goCode == '1' }">공개</c:when>
										<c:when test="${studyGroup.goCode == '2' }">비공개</c:when>
									</c:choose>
									</td>
								</tr>
								<tr>
									<th>카테고리</th>
									<td>			
								<c:choose>
									<c:when test="${studyGroup.categoryCode == '1' }">자격증</c:when>
									<c:when test="${studyGroup.categoryCode == '2' }">취업</c:when>
									<c:when test="${studyGroup.categoryCode == '3' }">외국어</c:when>
									<c:when test="${studyGroup.categoryCode == '4' }">면접</c:when>
									<c:when test="${studyGroup.categoryCode == '5' }">취미</c:when>
									<c:when test="${studyGroup.categoryCode == '6' }">학업</c:when>
									<c:when test="${studyGroup.categoryCode == '7' }">자기개발</c:when>
									<c:when test="${studyGroup.categoryCode == '8' }">기타</c:when>
								</c:choose>
									</td>
									<th>세부 키워드</th>
									<td colspan="3">${studyGroup.grSubject }</td>
								</tr>
								<tr>
									<th>한마디</th>
									<td colspan="5">${studyGroup.grComment }</td>
								</tr>
							</tbody>
						</table>
				
				</div><!-- admin-box  -->	

				


				<div class="info_div">
					<table class="table">
						<tr>
							<th colspan="7">스터디원</th>
						</tr>
						<tr>
							<c:forEach var="member" items="${groupMember }"> 
								<td>
									<a href="adminguestinfo.do?guCode=${member.guCode}">${member.guId }</a>
								</td>
							</c:forEach>				
						</tr>
					</table>
				</div>
				
				<!-- list_head -->
				<div class="info_div">
				
						<table class="table ">
							<tbody>	
							<th>이력
							</th>
							<c:forEach var="record" items="${groupRecord }">
								<tr>
									<th>${record.RECORDDATE }</th>
									<td >${record.RECORD}</td>
								</tr>
							
							</c:forEach>						
	
							</tbody>
						</table>
				
				</div><!-- admin-box  -->	

				<div class="info_div">
				
						<table class="table ">
							<tbody>								
								<tr>
									<th>개설 일자</th>
									<td > ${studyGroup.grDate } </td>
								</tr>
								<c:if test="${groupUnreg != null }">
								
								<tr>
									<th>해체 일자</th>
									<td >${groupUnreg.brDate }</td>
									<th>해체 사유</th>
									<td>
									<c:choose>
										<c:when test="${groupUnreg.reasonCode == '501' }">그룹원 부재 (모두 탈퇴)</c:when>
										<c:when test="${groupUnreg.reasonCode == '503' }">강제 해체(패널티 누적)</c:when>
									</c:choose>
									</td>
								</tr>
								
								</c:if>
							</tbody>
						</table>
				
				</div><!-- admin-box  -->	

			<br>
			<div class="list-foot">
				<div class="row justify-content-center">
					<div class="col-2 list-page ">
						<button type="button" class="btn notice_btn" 
								onclick="list('${currPageNo}', '${range}', '${searchType}', '${keyword}')">목록</button>
						<BR>
					</div>
				</div>

			</div>
			<!-- list-foot -->
				
				
			</div><!-- rightContent_div -->
		
		</div><!-- content -->
	</section>
	
	<footer>
		<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>