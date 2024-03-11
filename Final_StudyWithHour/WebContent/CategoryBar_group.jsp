<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav" id="category_nav">
		      		<li class="nav-item" id="category_element">
						<a class="nav-link"
						 href="boardgroupnew.do">신규개설</a>
					</li>
					<li class="nav-item" id="category_element">
						<a class="nav-link"
						 href="#">추가모집</a>
					</li>
					<li class="nav-item" id="category_element">
						<a class="nav-link"
						 href="#">모집기간종료</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
