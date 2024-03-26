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
						 href="boardcommunitysearchcategory.do?bsCode=3&vNum=1">자유게시판</a>
					</li>
		      		<li class="nav-item" id="category_element">
						<a class="nav-link"
						 href="boardcommunitysearchcategory.do?bsCode=1&vNum=1">공부팁</a>
					</li>
					<li class="nav-item" id="category_element">
						<a class="nav-link"
						 href="boardcommunitysearchcategory.do?bsCode=2&vNum=1">고민 상담</a>
					</li>
					<li class="nav-item" id="category_element">
						<a class="nav-link"
						 href="boardcommunitysearchcategory.do?bsCode=4&vNum=1">질문 게시판</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
