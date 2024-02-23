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
<title>FreeBoard.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/freeBoardStyle.css">
<link rel="stylesheet" type="text/css" href="css/sliderStyle.css">
</head>
<body>
	<header>
		<c:import url="/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div class="category_bar">
			<c:import url="/imageSlide.jsp"></c:import>
			<c:import url="/CategoryBar.jsp"></c:import>
		<!-- content div 시작 부분 -->	
			<div class="content_div">
				<div class="group_div">
					<div class="sub_title_div">
						<span class="sub_title" id="freeBoard_title"> 자유게시판</span> <a
							href="http://localhost:3306/FinalProject_2/WritePostForm.jsp"><button
								type="button" class="sub_title_btn">
								<img src="images/writepost.png" class="count_icon"> 글쓰기
							</button></a>
					</div>
			<!-- 여기가 리스트 구문 시작 -->
					<div class="group_list">
						<div class="group_item">
							<div class="group_title">
								<span class="post_title">같이 영어 공부 하실분~</span> <span
									class="fire_date">작성일 : 24.01.01</span>
							</div>
							<div class="group_info">
								<span class="count"> <img src="images/people.png"
									class="count_icon"> 게스트7
								</span> <span class="count"> <img src="images/viewCount.png"
									class="count_icon"> 44444
								</span> <span class="count"> <img src="images/comment.png"
									class="count_icon"> 44444
								</span> <span class="count"> <a href="" class="scrap_button"><img
										src="images/scrap.png" class="count_icon"> 스크랩 </a>
								</span> <span class="count"> <a
									href="http://localhost:3306/FinalProject/Report.jsp"
									class="report_button"> <img src="images/siren.png"
										class="count_icon"> 신고하기
								</a>
								</span> <span class="count" id="posting_number"> 번호 :
									123456789123 </span>
							</div>
						</div>
						<div class="group_item">
							<div class="group_title">
								<span class="post_title">같이 수학 공부 하실분~</span> <span
									class="fire_date">작성일 : 24.01.01</span>
							</div>
							<div class="group_info">
								<span class="count"> <img src="images/people.png"
									class="count_icon"> 게스트7
								</span> <span class="count"> <img src="images/viewCount.png"
									class="count_icon"> 44444
								</span> <span class="count"> <img src="images/comment.png"
									class="count_icon"> 44444
								</span> <span class="count"> <a href="" class="scrap_button"><img
										src="images/scrap.png" class="count_icon"> 스크랩 </a>
								</span> <span class="count"> <a
									href="http://localhost:3306/FinalProject/Report.jsp"
									class="report_button"> <img src="images/siren.png"
										class="count_icon"> 신고하기
								</a>
								</span> <span class="count" id="posting_number"> 번호 :
									123456789123 </span>
							</div>
						</div>
						<div class="group_item">
							<div class="group_title">
								<span class="post_title">같이 자격증 공부 하실분~</span> <span
									class="fire_date">작성일 : 24.01.01</span>
							</div>
							<div class="group_info">
								<span class="count"> <img src="images/people.png"
									class="count_icon"> 게스트7
								</span> <span class="count"> <img src="images/viewCount.png"
									class="count_icon"> 44444
								</span> <span class="count"> <img src="images/comment.png"
									class="count_icon"> 44444
								</span> <span class="count"> <a href="" class="scrap_button"><img
										src="images/scrap.png" class="count_icon"> 스크랩 </a>
								</span> <span class="count"> <a
									href="http://localhost:3306/FinalProject/Report.jsp"
									class="report_button"> <img src="images/siren.png"
										class="count_icon"> 신고하기
								</a>
								</span> <span class="count" id="posting_number"> 번호 :
									123456789123 </span>
							</div>
						</div>
						<div class="group_item">
							<div class="group_title">
								<span class="post_title">문제 정답좀 알려주세요</span> <span
									class="fire_date">작성일 : 24.01.01</span>
							</div>
							<div class="group_info">
								<span class="count"> <img src="images/people.png"
									class="count_icon"> 게스트7
								</span> <span class="count"> <img src="images/viewCount.png"
									class="count_icon"> 44444
								</span> <span class="count"> <img src="images/comment.png"
									class="count_icon"> 44444
								</span> <span class="count"> <a href="" class="scrap_button"><img
										src="images/scrap.png" class="count_icon"> 스크랩 </a>
								</span> <span class="count"> <a
									href="http://localhost:3306/FinalProject/Report.jsp"
									class="report_button"> <img src="images/siren.png"
										class="count_icon"> 신고하기
								</a>
								</span> <span class="count" id="posting_number"> 번호 :
									123456789123 </span>
							</div>
						</div>
						<div class="group_item">
							<div class="group_title">
								<span class="post_title">자유게시판 글목록</span> <span
									class="fire_date">작성일 : 24.01.01</span>
							</div>
							<div class="group_info">
								<span class="count"> <img src="images/people.png"
									class="count_icon"> 게스트7
								</span> <span class="count"> <img src="images/viewCount.png"
									class="count_icon"> 44444
								</span> <span class="count"> <img src="images/comment.png"
									class="count_icon"> 44444
								</span> <span class="count"> <a href="" class="scrap_button"><img
										src="images/scrap.png" class="count_icon"> 스크랩 </a>
								</span> <span class="count"> <a
									href="http://localhost:3306/FinalProject/Report.jsp"
									class="report_button"> <img src="images/siren.png"
										class="count_icon"> 신고하기
								</a>
								</span> <span class="count" id="posting_number"> 번호 :
									123456789123 </span>
							</div>
						</div>
					</div>

				</div>
			</div>
			</div>
				
		
		</div>
		<div class="paging-numbers">
			<nav class="paging">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">&lt;</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>
		<div class="bottom_searchBar">
			<select name="search_type" id="search_type">
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">작성자</option>
			</select>		
			<input class="form-control me-2" type="search" aria-label="Search" style="width: 200px;">
			<button class="btn search_btn" type="submit">Search</button>
		</div>
	</section>
	
	<footer>
		<c:import url="/Footer.jsp"></c:import>
	</footer>

</body>
</html>