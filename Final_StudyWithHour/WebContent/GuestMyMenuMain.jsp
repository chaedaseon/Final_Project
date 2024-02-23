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
<title>GuestMyMenuMain.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestMyMenuMainStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	
	/* 사이드바 메뉴 눌렀을 때 선택된 메뉴 색상 변경 */
	$(document).ready(function()
	{
		$(".btn_menu").on("click", function() 
		{
	        $(this).find('span').css('color', '#94be2c');
	    });
	});

</script>


</head>
<body>

<header>
	<c:import url="Menu.jsp"></c:import>

	<%-- <jsp:include page="/Menu.jsp" /> --%>
</header>

<section>
	<div id="content">
		<c:import url="SideMenu.jsp"></c:import>
	
		<%-- <jsp:include page="/SideMenu.jsp" /> --%>
		
			<div class="rightContent_div">
				
				
			</div>
		
		
	</div> 
</section>

<footer>
	<jsp:include page="/Footer.jsp" />
</footer>

</body>
</html>