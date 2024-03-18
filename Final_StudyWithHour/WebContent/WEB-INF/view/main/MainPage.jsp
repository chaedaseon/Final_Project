<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String adCode = (String)session.getAttribute("adCode");
	String guCode = (String)session.getAttribute("guCode");
	String hoCode = (String)session.getAttribute("hoCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>StudyWithHour :: 우리 함께 공부해요</title> -->
<title>MainPage.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/mainPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>

	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div class="content_div">
			
				<!-- 배너 영역 start -->
				<div id="carouselExampleIndicators" class="carousel slide" style="border-radius: 5px;">
					<div class="carousel-indicators">
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				  	</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
					    	<img src="images/sample_banner1.png" class="d-block" alt="...">
					    </div>
					    <div class="carousel-item">
					      	<img src="images/sample_banner2.png" class="d-block" alt="...">
					    </div>
					    <div class="carousel-item">
					      	<img src="images/sample_banner3.png" class="d-block" alt="...">
					    </div>
					    
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					</button>
				</div><!-- 배너 영역 end -->
				
				
				<!-- 그룹 모집글 영역 start -->
				<div class="col-12" style="padding: 40px;">
					<div class="col-12 subject-title"><a href="#">⏰ 모집중인 스터디그룹을 확인해보세요!</a><a href="#" style="font-size: 16px;">더보기</a></div>
					<div class="latest-list">
						<div class="card">
							<div class="card-header bg-transparent">광개토익왕<span class="d-day">D-1</span></div>
		  					<div class="card-body">
		    				<!-- <h5 class="card-title">Light card title</h5> -->
		    					<p class="card-text">토익 800점 이상을 목표하시는 분들 함께해요! 홍대에서 주 2일 만나서 스터디 예정입니다.</p>
		  					</div>
		    				<div class="count"><img src="images/people.png">5 / 8 명</div>
						</div>
					 
						<div class="card">
							<div class="card-header bg-transparent">광개토익왕<span class="d-day">D-1</span></div>
		  					<div class="card-body">
		    					<p class="card-text">토익 800점 이상을 목표하시는 분들 함께해요! 홍대에서 주 2일 만나서 스터디 예정입니다.</p>
		  					</div>
		    				<div class="count" style="margin-right: 0px;"><img src="images/people.png">5 / 8 명</div>
						</div>
						
						<div class="card">
							<div class="card-header bg-transparent">광개토익왕<span class="d-day">D-1</span></div>
		  					<div class="card-body">
		    					<p class="card-text">토익 800점 이상을 목표하시는 분들 함께해요! 홍대에서 주 2일 만나서 스터디 예정입니다.</p>
		  					</div>
		    				<div class="count" style="margin-right: 0px;"><img src="images/people.png">5 / 8 명</div>
						</div>
						
						<div class="card" style="max-width: 18rem; border-radius: 15px;">
							<div class="card-header bg-transparent">광개토익왕<span class="d-day">D-1</span></div>
		  					<div class="card-body">
		    					<p class="card-text">토익 800점 이상을 목표하시는 분들 함께해요! 홍대에서 주 2일 만나서 스터디 예정입니다.</p>
		  					</div>
		    				<div class="count" style="margin-right: 0px;"><img src="images/people.png">5 / 8 명</div>
						</div>
					</div>

					<div class="latest-list">
						<div class="card" style="max-width: 18rem; border-radius: 15px;">
							<div class="card-header bg-transparent">광개토익왕<span class="d-day">D-1</span></div>
		  					<div class="card-body">
		    				<!-- <h5 class="card-title">Light card title</h5> -->
		    					<p class="card-text">토익 800점 이상을 목표하시는 분들 함께해요! 홍대에서 주 2일 만나서 스터디 예정입니다.</p>
		  					</div>
		    				<div class="count" style="margin-right: 0px;"><img src="images/people.png">5 / 8 명</div>
						</div>
						
						<div class="card" style="max-width: 18rem; border-radius: 15px;">
							<div class="card-header bg-transparent">광개토익왕<span class="d-day">D-1</span></div>
		  					<div class="card-body">
		    				<!-- <h5 class="card-title">Light card title</h5> -->
		    					<p class="card-text">토익 800점 이상을 목표하시는 분들 함께해요! 홍대에서 주 2일 만나서 스터디 예정입니다.</p>
		  					</div>
		    				<div class="count" style="margin-right: 0px;"><img src="images/people.png">5 / 8 명</div>
						</div>
						
						<div class="card" style="max-width: 18rem; border-radius: 15px;">
							<div class="card-header bg-transparent">광개토익왕<span class="d-day">D-1</span></div>
		  					<div class="card-body">
		    				<!-- <h5 class="card-title">Light card title</h5> -->
		    					<p class="card-text">토익 800점 이상을 목표하시는 분들 함께해요! 홍대에서 주 2일 만나서 스터디 예정입니다.</p>
		  					</div>
		    				<div class="count" style="margin-right: 0px;"><img src="images/people.png">5 / 8 명</div>
						</div>
						
						<div class="card" style="max-width: 18rem; border-radius: 15px;">
							<div class="card-header bg-transparent">광개토익왕<span class="d-day">D-1</span></div>
		  					<div class="card-body">
		    				<!-- <h5 class="card-title">Light card title</h5> -->
		    					<p class="card-text">토익 800점 이상을 목표하시는 분들 함께해요! 홍대에서 주 2일 만나서 스터디 예정입니다.</p>
		  					</div>
		    				<div class="count" style="margin-right: 0px;"><img src="images/people.png">5 / 8 명</div>
						</div>
					</div>
				</div><!-- 그룹 모집글 영역 end -->
				
				
				<div class="col-12" style="display: flex; flex-direction: row; flex-wrap: wrap;">
					<!-- 인기글 영역 start -->
					<div class="col-4" style="padding: 40px;">
						<div class="subject-title">🔥 인기 있는 게시글</div>
						<div class="list-div">
							<ul class="list-item">
								<li>
									<div class="item-info">
										<div class="board-category">
											<span>✨공부팁</span>
										</div>
											<div class="reaction">
												<span>⭐13</span>
												<span>
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chat-square-dots" viewBox="0 0 16 16">
														<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
													  	<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
													</svg> 
												</span>
											</div>
										</div>
									<div class="item-title">
										<a href="#">정보처리기사 필기 팁!</a>
									</div>
									<div class="write-info">
										<div class="writer">
											<span>동그리동동</span>
										</div>
										<div class="write-date">
											<span>2024.02.16</span>
										</div>
									</div>
								</li>
							</ul>
							
							<ul class="list-item">
								<li>
									<div class="item-info">
										<div class="board-category">
											<span>✨공부팁</span>
										</div>
											<div class="reaction">
												<span>⭐13</span>
												<span>
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chat-square-dots" viewBox="0 0 16 16">
														<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
													  	<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
													</svg> 9
												</span>
											</div>
										</div>
									<div class="item-title">
										<a href="#">정보처리기사 필기 팁!</a>
									</div>
									<div class="write-info">
										<div class="writer">
											<span>동그리동동</span>
										</div>
										<div class="write-date">
											<span>2024.02.16</span>
										</div>
									</div>
								</li>
							</ul>
							
							<ul class="list-item">
								<li>
									<div class="item-info">
										<div class="board-category">
											<span>✨공부팁</span>
										</div>
											<div class="reaction">
												<span>⭐13</span>
												<span>
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chat-square-dots" viewBox="0 0 16 16">
														<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
													  	<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
													</svg> 9
												</span>
											</div>
										</div>
									<div class="item-title">
										<a href="#">정보처리기사 필기 팁!</a>
									</div>
									<div class="write-info">
										<div class="writer">
											<span>동그리동동</span>
										</div>
										<div class="write-date">
											<span>2024.02.16</span>
										</div>
									</div>
								</li>
							</ul>
							
							<ul class="list-item">
								<li>
									<div class="item-info">
										<div class="board-category">
											<span>✨공부팁</span>
										</div>
											<div class="reaction">
												<span>⭐13</span>
												<span>
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chat-square-dots" viewBox="0 0 16 16">
														<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
													  	<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
													</svg> 9
												</span>
											</div>
										</div>
									<div class="item-title">
										<a href="#">정보처리기사 필기 팁!</a>
									</div>
									<div class="write-info">
										<div class="writer">
											<span>동그리동동</span>
										</div>
										<div class="write-date">
											<span>2024.02.16</span>
										</div>
									</div>
								</li>
							</ul>						
						</div>
					</div><!-- 인기글 영역 end -->
					
					<!-- 최근 게시글 영역 start -->
					<div class="col-4" style="padding: 40px;">
						<div class="subject-title">🔥 최근 게시글</div>
						<div class="list-div">
							<ul class="list-item">
								<li>
									<div class="item-info">
										<div class="board-category">
											<span>✨공부팁</span>
										</div>
											<div class="reaction">
												<span>⭐13</span>
												<span>
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chat-square-dots" viewBox="0 0 16 16">
														<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
													  	<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
													</svg> 9
												</span>
											</div>
										</div>
									<div class="item-title">
										<a href="#">정보처리기사 필기 팁!</a>
									</div>
									<div class="write-info">
										<div class="writer">
											<span>동그리동동</span>
										</div>
										<div class="write-date">
											<span>2024.02.16</span>
										</div>
									</div>
								</li>
							</ul>
							
							<ul class="list-item">
								<li>
									<div class="item-info">
										<div class="board-category">
											<span>✨공부팁</span>
										</div>
											<div class="reaction">
												<span>⭐13</span>
												<span>
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chat-square-dots" viewBox="0 0 16 16">
														<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
													  	<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
													</svg> 9
												</span>
											</div>
										</div>
									<div class="item-title">
										<a href="#">정보처리기사 필기 팁!</a>
									</div>
									<div class="write-info">
										<div class="writer">
											<span>동그리동동</span>
										</div>
										<div class="write-date">
											<span>2024.02.16</span>
										</div>
									</div>
								</li>
							</ul>
							
							<ul class="list-item">
								<li>
									<div class="item-info">
										<div class="board-category">
											<span>✨공부팁</span>
										</div>
											<div class="reaction">
												<span>⭐13</span>
												<span>
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chat-square-dots" viewBox="0 0 16 16">
														<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
													  	<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
													</svg> 9
												</span>
											</div>
										</div>
									<div class="item-title">
										<a href="#">정보처리기사 필기 팁!</a>
									</div>
									<div class="write-info">
										<div class="writer">
											<span>동그리동동</span>
										</div>
										<div class="write-date">
											<span>2024.02.16</span>
										</div>
									</div>
								</li>
							</ul>
							
							<ul class="list-item">
								<li>
									<div class="item-info">
										<div class="board-category">
											<span>✨공부팁</span>
										</div>
											<div class="reaction">
												<span>⭐13</span>
												<span>
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chat-square-dots" viewBox="0 0 16 16">
														<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
													  	<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
													</svg> 9
												</span>
											</div>
										</div>
									<div class="item-title">
										<a href="#">정보처리기사 필기 팁!</a>
									</div>
									<div class="write-info">
										<div class="writer">
											<span>동그리동동</span>
										</div>
										<div class="write-date">
											<span>2024.02.16</span>
										</div>
									</div>
								</li>
							</ul>						
						</div>
					</div><!-- 최근 게시글 영역 end -->
					
					<!-- 공지사항 영역 start -->
					<div class="col-4" style="padding: 40px;">
					<div class="subject-title">📢 공지사항<a href="boardnoticelist.do" style="font-size: 16px;">더보기</a></div>
						<div class="">
							<c:forEach var="notice" items="${noticeList }">
								<ul class="list-item" style="border-top: 1px solid #e1e1e1;">
									<li>
										<div class="item-title text-truncate">
											<a href="noticeview.do?ntCode=${notice.ntCode}">${notice.ntTitle }</a>
										</div>
										<div class="write-info">
											<div class="write-date">
												<span>${notice.ntDate }</span>
											</div>
										</div>
									</li>
								</ul>
							</c:forEach>
						</div>
					</div><!-- 공지사항 영역 end -->
				</div>
				
				
				<!-- 스터디카페 영역 start -->
				<div class="col-12" style="display: flex; flex-direction: row; flex-wrap: wrap;">
				
					<!-- 예약 많은 스터디카페 start -->
					<div class="col-4" style="padding: 40px;">
						<div class="subject-title">🏆 예약 많은 스터디카페</div>
						<div>
							<ul class="list-item">
								<li>
									<div class="cafe-title">
										<span style="font-size: 30px;">🥇</span><a href="#">할거하마 워크 & 스터디 홍대점</a>
									</div>
									<div class="cafe-addr">
										<span>서울 마포구 동교로 185 4층</span>
									</div>
								</li>
							</ul>
							
							<ul class="list-item">
								<li>
									<div class="cafe-title">
										<span style="font-size: 30px;">🥈</span><a href="#">토즈 홍대점</a>
									</div>
									<div class="cafe-addr">
										<span>서울 마포구 연남로 13 영상빌딩 3층</span>
									</div>
								</li>
							</ul>
							
							<ul class="list-item">
								<li>
									<div class="cafe-title">
										<span style="font-size: 30px;">🥉</span><a href="#">플랜트스터디카페 송도지식정보단지역</a>
									</div>
									<div class="cafe-addr">
										<span>인천 연수구 인천타워대로54번길 15-3 3층</span>
									</div>
								</li>
							</ul>
							
						</div>
					</div>
				
				
					<!-- 새로 등록된 스터디카페 start -->
					<div class="col-8" style="padding: 40px;">
						<div class="subject-title">✨ 새로 등록된 스터디카페</div>
						
						<div class="" style="display: flex; width: 100%; border-radius: 15px; box-shadow: 5px 5px 5px #d3d3d3; height: 230px;">
							<div style="width: 40%; border-right: 1px solid #e1e1e1; display: flex; align-items: center; justify-content: center">
								<!-- <span style="font-size: 30px; text-align: center;">미바라운지 스터디카페</span> -->
								<img alt="" src="images/studycafe.jpg" style="width: 341.33px; height: 230px; border-top-left-radius: 10px; border-bottom-left-radius: 10px;">
							</div>
							<div style="width: 60%; height:100%; display: flex; align-items: center; justify-content: center; border-bottom-right-radius: 10px; border-top-right-radius: 10px;">
								<div>
									<span style="font-size: 24px;">${newCafe.scName }</span><br>
									📍${newCafe.scAddr1 },${newCafe.scAddr2 }<br>
									📞 ${fn:substring(newCafe.scTel,0,3) }-${fn:substring(newCafe.scTel,3,7) }-${fn:substring(newCafe.scTel,7,11) }<br>
									⏰ ${newCafe.scOpenHour } ~  ${newCafe.scCloseHour }<br>
									✔️ ${newCafe.scConvenient }
								</div>
							</div>
						
						</div>
					</div><!-- 새로 등록된 스터디카페 end-->
					
				</div>
				
			</div>					
		</div>
	</section>
	
	<footer>
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>