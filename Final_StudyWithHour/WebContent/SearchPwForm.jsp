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
<title>SearchIdForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/searchFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<header>
		<c:import url="Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div class="content_div">
				<div class="search_div">
					<div class="search_description">
						<span style="color: #94bc32; font-weight: bold; font-size: 38px;">비밀번호</span><span style="color: #212529; font-size: 20px;"> 찾기</span>
					</div>	
					
					<div class="underline"></div>
					
					<div class="search_form">
						<table>
							<tr>
								<td class="search_title"><span>이름</span></td>
								<td class="search_input"><input type="text" class="search_text"></td>
							</tr>
							<tr>
								<td class="search_title"><span>아이디</span></td>
								<td class="search_input"><input type="text" class="search_text"></td>
							</tr>
							<tr>
								<td class="search_title"><span>전화번호</span></td>
								<td class="search_input"><input type="tel" class="search_text" style="width: 68px;"> - <input type="tel" class="search_text" style="width: 75px;"> - <input type="tel" class="search_text" style="width: 75px;"></td>
							</tr>
						</table>
					</div>
				
					<div class="underline"></div>
					
					<button type="submit" class="search_btn">비밀번호 찾기</button>
						
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<c:import url="Footer.jsp"></c:import>
	</footer>

</body>
</html>