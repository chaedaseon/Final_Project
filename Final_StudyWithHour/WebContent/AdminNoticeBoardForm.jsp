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
<title>관리자 페이지 - 공지사항 등록</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adminPageStyle.css">
</head>
<body>
	<header>
		<c:import url="Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<c:import url="SideMenu.jsp"></c:import>
			
			<div class="rightContent_div">
				
	
	
				<div class="page_title">
					<span><span>공지사항</span> 등록</span>
				</div>

					<form action="adminnoticeinsert.do" method="post">

						<div class="info_div">
							<table class="table ">
								<tbody>
									<tr>
										<th colspan="1">작성자</th>
										<td colspan="7">
										<input
											class="form-control form-control-sm form-text" type="text"
											id="adCode" name="adCode" value="${adCode }" readonly="readonly"></td>
									</tr>
									<tr>
										<th colspan="1">제목</th>
										<td colspan="7"><input
											class="form-control form-control-sm form-text" type="text"
											id="ntTitle" name="ntTitle"></td>
									</tr>
									<tr>
										<th colspan="8">내용</th>
									</tr>
									<tr>
										<td colspan="8"><textarea class="form-control form-text " id="ntContent" name="ntContent"
												rows="6"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
	

						<br>
						<div class="list-foot">
							<div class="row justify-content-center">
								<div class="col-3 list-page">
									<button type="submit" class="btn btn-custom" >등록</button>
									<button type="reset" class="btn btn-custom">취소</button>
								</div>
							</div>

						</div>
					</form>
					<!-- list-foot -->
		
				
				
			</div><!-- rightContent_div -->
		
		</div><!-- content -->
	</section>
	
	<footer>
		<c:import url="Footer.jsp"></c:import>
	</footer>

</body>
</html>