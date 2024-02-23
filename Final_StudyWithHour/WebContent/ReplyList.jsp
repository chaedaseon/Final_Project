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
<title>ReplyList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/articleListStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<header>
		<c:import url="Menu.jsp"></c:import>
	</header>
	
	<section>
	
		<div id="content">
			<c:import url="SideMenu.jsp"></c:import>
		
			<div class="rightContent_div">
				<div class="article_title">
					<span><span>작성 댓글</span> 관리</span>
				</div>
				
				<div style="float: right; margin: 20px 0;">
					<select class="article_sorting">
						<option selected="selected">게시판 유형</option>
						<option value="1">자유게시판</option>
						<option value="2">공부팁</option>
						<option value="2">질문</option>
						<option value="2">중고책방</option>
					</select>		
				</div>
				
				<div class="article_list">
					<table>
						<tr class="spacer"></tr>
						<tr>
							<th>No</th>
							<th>게시판</th>
							<th>본문 제목</th>
							<th>작성 댓글</th>
							<th>작성 일자</th>
						</tr>
						<tr class="spacer"></tr>
						<tr>
							<td>1</td>
							<td>자유게시판</td>
							<td>정처기 1주일의 기적 노립니다,,^^,,,</td>
							<td>저두요,,,^^ 우리 모두 화이팅,,,^^</td>
							<td>2024.02.21</td>
						</tr>
						<tr>
							<td>2</td>
							<td>자유게시판</td>
							<td>정처기 1주일의 기적 노립니다,,^^,,,</td>
							<td>저두요,,,^^ 우리 모두 화이팅,,,^^</td>
							<td>2024.02.21</td>
						</tr>
						<tr>
							<td>3</td>
							<td>중고책방</td>
							<td>정처기 1주일의 기적 노립니다,,^^,,,</td>
							<td>저두요,,,^^ 우리 모두 화이팅,,,^^</td>
							<td>2024.02.21</td>
						</tr>
						<tr>
							<td>4</td>
							<td>질문</td>
							<td>정처기 1주일의 기적 노립니다,,^^,,,</td>
							<td>저두요,,,^^ 우리 모두 화이팅,,,^^</td>
							<td>2024.02.21</td>
						</tr>
						<tr>
							<td>5</td>
							<td>공부팁</td>
							<td>정처기 1주일의 기적 노립니다,,^^,,,</td>
							<td>저두요,,,^^ 우리 모두 화이팅,,,^^</td>
							<td>2024.02.21</td>
						</tr>
						<tr>
							<td>6</td>
							<td>자유게시판</td>
							<td>정처기 1주일의 기적 노립니다,,^^,,,</td>
							<td>저두요,,,^^ 우리 모두 화이팅,,,^^</td>
							<td>2024.02.21</td>
						</tr>
						<tr>
							<td>7</td>
							<td>자유게시판</td>
							<td>정처기 1주일의 기적 노립니다,,^^,,,</td>
							<td>저두요,,,^^ 우리 모두 화이팅,,,^^</td>
							<td>2024.02.21</td>
						</tr>
						<tr>
							<td>8</td>
							<td>자유게시판</td>
							<td>정처기 1주일의 기적 노립니다,,^^,,,</td>
							<td>저두요,,,^^ 우리 모두 화이팅,,,^^</td>
							<td>2024.02.21</td>
						</tr>
						<tr>
							<td>9</td>
							<td>자유게시판</td>
							<td>정처기 1주일의 기적 노립니다,,^^,,,</td>
							<td>저두요,,,^^ 우리 모두 화이팅,,,^^</td>
							<td>2024.02.21</td>
						</tr>
						<tr>
							<td>10</td>
							<td>자유게시판</td>
							<td>정처기 1주일의 기적 노립니다,,^^,,,</td>
							<td>저두요,,,^^ 우리 모두 화이팅,,,^^</td>
							<td>2024.02.21</td>
						</tr>
						<tr class="spacer"></tr>
					</table>
				</div>
				
				<nav aria-label="Page navigation example paging" class="paging">
				  	<ul class="pagination">
					    <li class="page-item disabled">
					    	<a class="page-link">◁</a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"><a class="page-link" href="#">4</a></li>
					    <li class="page-item"><a class="page-link" href="#">5</a></li>
					    <li class="page-item">
					    	<a class="page-link" href="#">▷</a>
					    </li>
				  	</ul>
				</nav>
			</div>
		</div>
		 
	</section>
	
	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>

</body>
</html>