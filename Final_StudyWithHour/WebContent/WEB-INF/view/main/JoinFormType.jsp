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
<title>JoinFormType.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/joinPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
			
		<div id="content">
			<div class="content_div" style="height: 400px;">
				<div class="join_type">
					<div class="title_description">
						회원 가입 <span style="color: #93be2c;">유형</span>을 선택해주세요
					</div>
					
					<div class="type">
						<div class="type_selection">
							<div class="button_description">
								스터디그룹 활동 및 스터디카페<br>
								<span style="color: #93be2c;">이용</span>을 원하시나요?
							</div>
							
							<div>
								<button type="button" class="type_button" onclick="location.href='join.do?type=1'">게스트</button>
							</div>
						</div>
						<div class="type_selection">
							<div class="button_description">
								보유 스터디카페<br>
								<span style="color: #93be2c;">등록</span>을 원하시나요?
							</div>
							<div>
								<button type="button" class="type_button" onclick="location.href='join.do?type=2'">호스트</button>
							</div>
							
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