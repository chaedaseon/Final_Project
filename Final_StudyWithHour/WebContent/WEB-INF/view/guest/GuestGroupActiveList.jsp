<%@page import="com.study.mvc.model.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 게스트 세션 받아오기
	GuestDTO guest = (GuestDTO) session.getAttribute("guest");
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestGroupActiveList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
	
		<div id="content">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
		
			<div class="rightContent_div">
				<div class="page_title" style="margin-bottom: 30px;">
					<span><span> 활동 중인</span> 그룹</span>
				</div>
				
				<div>
					<c:if test="${empty groupActiveList }">
						<div>활동 중인 그룹이 존재하지 않습니다.</div>
				</c:if>
				
					<c:forEach var="groupActiveList" items="${groupActiveList }">
					<div class="group_list" onclick="location.href='grouppagemain.do?gu_code=<%=guest.getGuCode()%>&gr_code=${groupActiveList.grCode }'">
						<div class="group_name">
							${groupActiveList.grName }
						</div>
						<div class="group_info1">
							<div class="group_info2">
								<div class="group_category">
									카테고리 : ${groupActiveList.categoryList }
								</div>
								<div class="group_people">
									인원 수 : ${groupActiveList.grCount }
								</div>
								<div class="group_join_date">
									가입일 : ${groupActiveList.gjDate.substring(0,10) }
								</div>
							</div>
							<div>
								<div class="group_location">
									지역 : ${groupActiveList.lsList }
								</div>
								<div class="group_age">
									연령 : ${groupActiveList.ageRange }
								</div>
								<div class="group_gender">
									성별 : ${groupActiveList.genderRange }
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					
				</div>	
				
			</div>
		</div>
		 
	</section>
	
	<footer>
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>