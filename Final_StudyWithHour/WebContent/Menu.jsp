<%@page import="com.test.mvc.HostDTO"%>
<%@page import="com.test.mvc.GuestDTO"%>
<%@page import="com.test.mvc.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 관리자 / 게스트 / 호스트 코드 및 세션
	String adCode = (String)session.getAttribute("adCode");
	GuestDTO guest = (GuestDTO) session.getAttribute("guest");
	String guCode = (String)session.getAttribute("guCode");
	HostDTO host = (HostDTO) session.getAttribute("host");
	String hoCode = (String)session.getAttribute("hoCode");
%>

<!-- 상단 메뉴바 start -->
<nav class="py-2 bg-body-tertiary border-bottom top-area" style="box-shadow: 0px 1px 0px 0px #e1e1e1;">
	<div class="d-flex flex-wrap top-menu">
	    <div>
			<a href="MainPage.jsp" class="align-items-center link-body-emphasis text-decoration-none">
		       	<span class="fs-4 logo_text">STUDY WITH <span style="color: #5b5b5b;">H</span>OUR</span>
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
		           			<li><a class="dropdown-item" href="boardgrouplist.do">스터디그룹 모집</a></li>
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
		           			<li><a class="dropdown-item" href="boardnoticelist.do">공지사항</a></li>
		           			<li><a class="dropdown-item" href="boardcommunitylist.do">커뮤니티</a></li>
		           			<li><a class="dropdown-item" href="boardusedbooklist.do">중고책방</a></li>
			            </ul>
		      		</li>
		     	</ul>
	     	</div><!-- 메뉴 end-->
	     	
	     	<!--  저장된 세션이 있을 경우 (→ 게스트 회원) -->
	     	<% if (guCode != null && adCode == null && hoCode == null) 	
	     	{%>
	     		<div class="dropdown text-end login-area">
		          <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
		            <img src="images/woman.png" alt="mdo" width="32" height="32" class="rounded-circle">
		          </a>
		          <ul class="dropdown-menu text-small">
		            <li><a class="dropdown-item" href="guestmypage.do">마이메뉴</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="logout.do">Logout</a></li>
		          </ul>
		        </div>
	     	<%}
	     	// 저장된 세션이 있을 경우 (→ 호스트 회원)
	     	if (hoCode != null && guCode == null && adCode == null)
	     	{%>
	     		<div class="dropdown text-end login-area">
		          <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
		            <img src="images/woman.png" alt="mdo" width="32" height="32" class="rounded-circle">
		          </a>
		          <ul class="dropdown-menu text-small">
		            <li><a class="dropdown-item" href="cafelist.do">마이메뉴</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="logout.do">Logout</a></li>
		          </ul>
		        </div>
	     	<%}
	     	// 저장된 세션이 있을 경우 (→ 관리자 회원)
	     	if (adCode != null && guCode == null && hoCode == null)
	     	{%>
	     		<div class="dropdown text-end login-area">
		          <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
		            <img src="images/woman.png" alt="mdo" width="32" height="32" class="rounded-circle">
		          </a>
		          <ul class="dropdown-menu text-small">
		            <li><a class="dropdown-item" href="adminadminlist.do">관리자메뉴</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="logout.do">Logout</a></li>
		          </ul>
		        </div>
		    <%}
	     	// 저장된 세션이 없을 경우 (→ 비회원)
	     	if(hoCode == null && guCode == null && adCode == null)	
	     	{ %>					
		        <div class="login-area">
			     	<ul class="nav">
				        <li class="nav-item"><a href="loginform.do" class="nav-link link-body-emphasis px-2">Login</a></li>
				        <li class="nav-item"><a href="jointype.do" class="nav-link link-body-emphasis px-2">Sign up</a></li>
				    </ul>
		    	</div>
		    <%}%>
	    </div>
	</div>
</nav>
<!-- 상단 메뉴바 end -->
