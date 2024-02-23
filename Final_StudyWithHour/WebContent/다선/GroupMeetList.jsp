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
<title>MeetingList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestMainStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<header>
		<jsp:include page="/Menu.jsp" />
	</header>
	
	<section>
	
		<div id="content">
			<jsp:include page="/SideMenu.jsp" /> 
			
			<div class="rightContent_div">
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
        		<h1 class="h3">모임 내역 관리</h1>
        			<div class="btn-toolbar mb-2 mb-md-0">
        			<select>
	        			<option class="btn btn-sm dropdown-toggle d-flex align-items-center gap-1" >
	            			목록 선택
	          			</option>

          			</select>
        			</div>
      			</div>
				<div>
					<table class="table">
						<tr>
							<th>No</th>
							<th>일정명</th>
							<th>날짜 및 시간</th>
							<th>작성자</th>
							<th>참석자 유/무</th>
							<th>더보기</th>
						</tr>
						<tr>
							<td>1</td>
							<td>영어회화 1차</td>		<!-- 일정명 클릭 시 해당 일정 캘린더로 이동 -->
							<td>2024-02-10 13:00 ~ 15:00</td>
							<td>홍길동</td>
							<td>유</td>
							<td>
								<input type="button" class="btn" value="수정">
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>영어회화 1차</td>
							<td>2024-02-10 13:00 ~ 15:00</td>
							<td>홍길동</td>
							<td>유</td>
							<td>
								<input type="button" class="btn" value="수정">
							</td>
						</tr>
						<tr>
							<td>3</td>
							<td>영어회화 1차</td>
							<td>2024-02-10 13:00 ~ 15:00</td>
							<td>홍길동</td>
							<td>유</td>
							<td>
								<input type="button" class="btn" value="수정">
							</td>
						</tr>
						<tr>
							<td>4</td>
							<td>영어회화 1차</td>
							<td>2024-02-10 13:00 ~ 15:00</td>
							<td>홍길동</td>
							<td>유</td>
							<td>
								<input type="button" class="btn" value="수정">
							</td>
						</tr>
						<tr>
							<td>5</td>
							<td>영어회화 1차</td>
							<td>2024-02-10 13:00 ~ 15:00</td>
							<td>홍길동</td>
							<td>유</td>
							<td>
								<input type="button" class="btn" value="수정">
							</td>
						</tr>
						<tr>
							<td>6</td>
							<td>영어회화 1차</td>
							<td>2024-02-10 13:00 ~ 15:00</td>
							<td>홍길동</td>
							<td>유</td>
							<td>
								<input type="button" class="btn" value="수정">
							</td>
						</tr>
						<tr>
							<td>7</td>
							<td>영어회화 1차</td>
							<td>2024-02-10 13:00 ~ 15:00</td>
							<td>홍길동</td>
							<td>유</td>
							<td>
								<input type="button" class="btn" value="수정">
							</td>
						</tr>
					</table>
				</div>
			</div>
			</div>
		
		
		 
	</section>
	
	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>
</body>
</html>