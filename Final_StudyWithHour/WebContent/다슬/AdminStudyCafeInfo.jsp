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
							<div class="col-2 list_name">스터디카페 번호</div>
							<div class="col-1 head-number">8</div>
						</div>


					</div>
				<div class="admin-box shadow-sm">
					<!-- list_head -->
						<table class="table ">
							<tbody>
								<tr>
									<th>스터디카페 이름</th>
									<td>스터디카페 이름 000000000</td>
									<th>호스트</th>
									<td>asdfsd12314k</td>
									<th>스터디룸</th>
									<td>3개</td>
								</tr>
								<tr>
									<th>주소</th>
									<td colspan="5">서울시 강남구 00000 00000 00000 00000 000000000
										0000</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>000-0000-0000</td>
									<th>운영 시간</th>
									<td colspan="3">09:00 ~ 23:00</td>
								</tr>
								<tr>
									<th>편의시설</th>
									<td colspan="5">~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
								</tr>
								<tr>
									<th>주변시설</th>
									<td colspan="5">~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
								</tr>
								<tr>
									<th>유의사항</th>
									<td colspan="5">~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
								</tr>
								<tr>
									<th>환불규정</th>
									<td colspan="5">~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
								</tr>
								<tr>
									<th>사업자 등록번호</th>
									<td>..../jpg</td>
								</tr>
							</tbody>
						</table>
				</div><!-- admin-box  -->		
					<div class="list_head">
						<div class="row  justify-content-start text-center">
							<div class="col-2 list_name">스터디룸</div>
						</div>
					</div>
				<div class="admin-box shadow-sm">
						<table class="table ">
							<tbody>
								<tr>
									<th>A룸</th>
									<td colspan="5">인원 : 5명 , 가격 : 시간당 3000원</td>
								</tr>
								<tr>
									<th>B룸</th>
									<td colspan="5">인원 : 6명 , 가격 : 시간당 3000원</td>
								</tr>
								<tr>
									<th>C룸</th>
									<td colspan="5">인원 : 4명 , 가격 : 시간당 3000원</td>
								</tr>

							</tbody>
						</table>
						</div><!-- admin-box -->
						
						
				<div class="admin-box shadow-sm">
						<table class="table ">
							<tbody>
								<tr>
									<th>신청 일자</th>
									<td>2020-02-02</td>
									<th>승인 일자</th>
									<td>2020-02-03</td>
									<th>승인 담당</th>
									<td>관리자2</td>
								</tr>
								<tr>
									<th>제휴 종료</th>
									<td>9999-02-02</td>
								</tr>

							</tbody>
						</table>
						</div><!-- admin-box -->
						
					<div class="list_head">
						<div class="row  justify-content-start text-center">
							<div class="col-2 list_name">승인 처리</div>(승인 요청시에만 노출)
						</div>
					</div>
				<div class="row admin-box shadow-sm">
							<div class="col-2">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="inlineRadioOptions" id="inlineRadio1" value="option1">
									<label class="form-check-label" for="inlineRadio1">승인</label>
								</div>
							</div>
							<div class="col-2">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2">
									<label class="form-check-label" for="inlineRadio2">보류</label>
								</div>
							</div>

						</div><!-- admin-box -->
					


					<div class="list-foot">
						<!-- 검색 영역 -->
						<div class="row justify-content-center">
							<div class="col-4 list-page">
								<button type="button" class="btn btn-custom">수정/승인</button>
								<button type="button" class="btn btn-custom">비활성화</button>
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