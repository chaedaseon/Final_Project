<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!-- 상단 메뉴바 start -->
<nav class="py-2 bg-body-tertiary border-bottom top-area">
	<div class="d-flex flex-wrap top-menu">
	    <div>
			<a href="MainPage.jsp" class="align-items-center link-body-emphasis text-decoration-none">
		       	<span class="fs-4">STUDY WITH <span style="color: #5b5b5b;">H</span>OUR</span>
		   	</a>
	   	</div>
	   	
	   	<!-- 메뉴랑 로그인 묶어주는 div -->
	   	<div class="nav-menu"> 
	   		<!-- 메뉴 start-->
	    	<div class="menu-area">
		   		<ul class="nav me-auto">
			    	<li class="nav-item">
			    		<a href="MainPage.jsp" class="nav-link link-body-emphasis px-2 active" aria-current="page">Home</a>
		    		</li>
			        <li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		          			스터디그룹
		        		</a>
		       			<ul class="dropdown-menu">
		           			<li><a class="dropdown-item" href="#">스터디그룹 모집</a></li>
				            <li><a class="dropdown-item" href="#">명예의 전당</a></li>
			            </ul>
		     		</li>
		     		<li class="nav-item dropdown">
		      			<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		          			스터디카페
		        		</a>
		         		<ul class="dropdown-menu">
		           			<li><a class="dropdown-item" href="#">스터디카페 둘러보기</a></li>
		           			<li><a class="dropdown-item" href="#">예약하기</a></li>
			            </ul>
		      		</li>
		      		<li class="nav-item dropdown">
		        		<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		          			커뮤니티
		        		</a>
		         		<ul class="dropdown-menu">
		           			<li><a class="dropdown-item" href="#">공지사항</a></li>
		           			<li><a class="dropdown-item" href="#">커뮤니티</a></li>
			            </ul>
		      		</li>
		     	</ul>
	     	</div><!-- 메뉴 end-->
	     	
	     	<!-- 프로필 카드 (로그인 했을 때) -->
			<!-- 
	     	<div class="dropdown text-end login-area">
	          <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	            <img src="images/woman.png" alt="mdo" width="32" height="32" class="rounded-circle">
	          </a>
	          <ul class="dropdown-menu text-small">
	            <li><a class="dropdown-item" href="#">마이 메뉴</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="#">로그아웃</a></li>
	          </ul>
	        </div>
 -->
	     	
	     	<!-- 로그인 메뉴 (비회원일때) -->
	     
	     	<div class="login-area">
		     	<ul class="nav">
			        <li class="nav-item"><a href="#" class="nav-link link-body-emphasis px-2">Login</a></li>
			        <li class="nav-item"><a href="JoinForm.jsp" class="nav-link link-body-emphasis px-2">Sign up</a></li>
			    </ul>
		    </div>
		    
	    </div>
	</div>
</nav>
<!-- 상단 메뉴바 end -->
