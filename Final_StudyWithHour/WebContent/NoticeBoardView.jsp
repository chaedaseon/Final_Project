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
<title>NoticeBoardView.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/gusetRedStyle.css">
<link rel="stylesheet" type="text/css" href="css/sliderStyle.css">
<link rel="stylesheet" type="text/css" href="css/postViewStyle.css">
</head>
<body>
	<header>
		<c:import url="/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div class="category_bar">
			<!-- content div 시작 부분 -->
				<div class="content_div">
					<c:forEach var="view" items="${list}">
					<div id="category">
						<h3>
							공지사항
						</h3>
					</div>
					<div id="title"><h5>${view.ntTitle}</h5>
						<span class="count" id="posting_number"> No. ${view.ntCode}</span>
					</div>
					<div id="post_info">
						<a id="user_id">${view.ntWriter}</a>
						<p id="posting_date">&nbsp;|&nbsp; ${view.ntDate}</p>
						<div class="detail_info">
							<span class="count"> 
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
								  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
								  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
								</svg>
							${view.ntView }
							</span>
						</div>
					</div>
				<div class="content_main" id="content_main">
					${view.ntContent }
				<div class="board_btn">
					<button type="submit" class="btn" id="modify_button">수정</button>
					<!-- 버튼 눌러서 모달창 띄우기 -->
					<button type="button" class="btn" id="delete_button" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">삭제</button>
			
					<!-- 모달 영역 -->
					<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-body">
					        정말로 삭제하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary">Understood</button>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
				</div>
				</c:forEach>
			<div class="button_box">
				<button onclick="history.back()" class="btn">목록으로</button>
			</div>
			
				
			</div>
		</div>		
	</div>		
	</section>
	
	<footer>
		<c:import url="/Footer.jsp"></c:import>
	</footer>

</body>
</html>