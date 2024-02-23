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
<title>Template.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adminPage.css">
</head>
<body>
	<header>
		<c:import url="Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<c:import url="SideMenu.jsp"></c:import>
			
			<div class="rightContent_div">
				
				
	
				
								<div class="list_head">
					<div class="row  justify-content-start text-center">
						<div class="col-2 list_name">스터디그룹 번호</div>
						<div class="col-1 head-number">8</div>
					</div>
				</div>
				<!-- list_head -->
				
								<div class="admin-box shadow-sm">
				
						<table class="table ">
							<tbody>
								<tr>
									<th>스터디그룹 이름</th>
									<td>스터디그룹 000000000</td>
									<th>그룹장</th>
									<td>닉네임12123</td>
									<th>유효 패널티</th>
									<td>1개</td>
								</tr>
							</tbody>
						</table>
				
				</div><!-- admin-box  -->	
				
								<div class="admin-box shadow-sm">
				
						<table class="table ">
							<tbody>								
								<tr>
									<th>최대 인원</th>
									<td > 8</td>
									<th>현재 인원</th>
									<td > 5</td>
									<th>지역</th>
									<td >대분류 소분류</td>
								</tr>
								<tr>
									<th>성별제한</th>
									<td>무관</td>
									<th>나이 제한</th>
									<td >유사연령대</td>
									<th>비밀번호</th>
									<td >(비공개그룹 한정)</td>
								</tr>
								<tr>
									<th>카테고리</th>
									<td>자격증</td>
									<th>세부 키워드</th>
									<td colspan="3">한국사 자격증  대비</td>
								</tr>
								<tr>
									<th>한마디</th>
									<td colspan="5">~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
								</tr>
							</tbody>
						</table>
				
				</div><!-- admin-box  -->	

				
				<div class="list_head">
					<div class="row  justify-content-start text-center">
						<div class="col-2 list_name">스터디원</div>
					</div>
				</div>
				<!-- list_head -->

				<div class="admin-box shadow-sm">
				
					<div class="row justify-content-start">
						<div class="col-2 ">
							<button type="button" class="btn btn-leader">그룹장 닉네임</button>
						</div>
						<div class="col-2 ">
							<button type="button" class="btn btn-member">그룹원 닉네임</button>
						</div>
						<div class="col-2 ">
							<button type="button" class="btn btn-member">그룹원 닉네임</button>
						</div>
						<div class="col-2 ">
							<button type="button" class="btn btn-member">그룹원 닉네임</button>
						</div>
						<div class="col-2 ">
							<button type="button" class="btn btn-member">그룹원 닉네임</button>
						</div>
					</div>
				
				</div><!-- admin-box  -->	
				<div class="list_head">
					<div class="row  justify-content-start text-center">
						<div class="col-2 list_name"> 이력</div>
					</div>
				</div>
				<!-- list_head -->
				<div class="admin-box shadow-sm">
				
						<table class="table ">
							<tbody>								
								<tr>
									<th>9999-99-99</th>
									<td >000000님 그룹 탈퇴</td>
								</tr>
								<tr>
									<th>9999-99-99</th>
									<td >그룹원 재모집(상시)</td>
								</tr>
								<tr>
									<th>9999-99-99</th>
									<td >000000님 그룹 가입</td>
								</tr>
								<tr>
									<th>9999-99-99</th>
									<td >그룹장 변경 (000 → 0000)</td>
								</tr>
							</tbody>
						</table>
				
				</div><!-- admin-box  -->	

				<div class="admin-box shadow-sm">
				
						<table class="table ">
							<tbody>								
								<tr>
									<th>개설 요청</th>
									<td > 9999-99-99 </td>
									<th>개설 확정</th>
									<td > 9999-99-99 </td>
								</tr>
								<tr>
									<th>해체 일자</th>
									<td > 9999-99-99 </td>
									<th>해체 사유</th>
									<td > 00000000 </td>
								</tr>
							</tbody>
						</table>
				
				</div><!-- admin-box  -->	

			<br>
			<div class="list-foot">
				<div class="row justify-content-center">
					<div class="col-2 list-page ">
						<button type="button" class="btn btn-custom">목록으로</button>
						<BR>
					</div>
				</div>

			</div>
			<!-- list-foot -->
				
				
			</div><!-- rightContent_div -->
		
		</div><!-- content -->
	</section>
	
	<footer>
		<c:import url="Footer.jsp"></c:import>
	</footer>

</body>
</html>