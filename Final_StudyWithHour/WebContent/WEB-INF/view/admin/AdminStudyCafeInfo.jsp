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
<title>관리자 페이지 - 스터디카페 정보</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adminPageStyle.css">

<script type="text/javascript">

	function process()
	{
		var ok = document.getElementById('adchcode1');
		var no = document.getElementById('adchcode2');
		
		var processForm = document.getElementById('studyCafeCK');
		
		if (ok.checked==false && no.checked==false)
		{
			alert("승인 결과를 선택하세요");
		}
		else
		{
			if (ok.checked==true)
			{
				
				document.getElementById('check').value = '1';
				processForm.submit();
			}
			else
			{
				
				document.getElementById('check').value = '2';
				 processForm.submit();
			}
		}
		
	}

	function list(currPageNo, range, searchType, keyword) 
	{

		var url = "adminstudycafelist.do";
		url = url + "?currPageNo=" + currPageNo;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;	

	}

</script>
</head>


<body>
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
			
			<div class="rightContent_div">
				

				<div class="page_title">
					<span><span>스터디카페 번호</span> ${studyCafe.scCode }</span>
				</div>				
					
				<div class="info_div">
						<table class="table ">
							<tbody>
								<tr>
									<th>스터디카페 이름</th>
									<td>${studyCafe.scName }</td>
									<th>호스트</th>
									<td>${studyCafe.hoId }</td>
									<th>스터디룸</th>
									<td>${studyRoomCount }개</td>
								</tr>
								<tr>
									<th>주소</th>
									<td colspan="5">
									${studyCafe.scAddr1 } ${studyCafe.scAddr2 }
									</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${studyCafe.scTel }</td>
									<th>운영 시간</th>
									<td colspan="3">${studyCafe.scOpenhour } ~ ${studyCafe.scClosehour }</td>
								</tr>
								<tr>
									<th>편의시설</th>
									<td colspan="5">${studyCafe.scConvenient }</td>
								</tr>
								<tr>
									<th>주변시설</th>
									<td colspan="5">${studyCafe.scSurround }</td>
								</tr>
								<tr>
									<th>유의사항</th>
									<td colspan="5">${studyCafe.scCaution }</td>
								</tr>
								<tr>
									<th>상세설명</th>
									<td colspan="5">${studyCafe.scDetail }</td>
								</tr>
								<tr>
									<th>사업자 등록번호</th>
									<td colspan="5">${studyCafe.scResnumber }</td>
								</tr>
							</tbody>
						</table>
				</div>	
	

				<div class="info_div">
						<table class="table ">
							<tbody>
							<c:forEach var="room" items="${studyRoomList }">
								<tr>
									<th>${room.srName }</th>
									<td colspan="5">인원 : ${room.srCount }명 , 가격 : 시간당 ${room.srPrice }원</td>
								</tr>
							</c:forEach>

							</tbody>
						</table>
						</div><!-- info_div -->
						
				
				<div class="info_div">
						<table class="table ">
							<tbody>
								<tr>
									<th>신청 일자</th>
									<td>${studyCafe.scDate }</td>
									<th>제휴종료 일자</th>
									<td>
										<c:choose>
											<c:when test="${cafeUnregDate != null}">${cafeUnregDate }</c:when>
											<c:otherwise>-</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<th>승인 일자</th>
									<td>
										<c:if test="${studyCafe.adPerdate == null }"> -</c:if> 
										<c:if test="${studyCafe.adPerdate != null }">${studyCafe.adPerdate}</c:if> 
									</td>
									<th>승인 담당</th>
									<td>
										<c:if test="${studyCafe.adPerdate == null }"> -</c:if> 
										<c:if test="${studyCafe.adPerdate != null }">${studyCafe.adNick}</c:if>
									</td>
								</tr>

							</tbody>
						</table>
						</div><!-- admin-box -->
						


					<div class="list-foot">
						<div class="row justify-content-center">
							<div class="col-2 list-page">
							<c:if test="${studyCafe.adChcode=='2' }">
							<button type="button" class="btn notice_btn" data-bs-toggle="modal" data-bs-target="#adminCheck" >
				                    	처리
	                	  	</button>
							</c:if>
								<button type="button" class="btn notice_btn" 
								onclick="list('${currPageNo}', '${range}', '${searchType}', '${keyword}')">목록</button>
							</div>
						</div>

					</div>
					<!-- list-foot -->
					
					
	               	<!-- 비활성화 모달 영역 -->
	                  <div class="modal fade  " id="adminCheck" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered">
	                      <div class="modal-content">
	                        <div class="modal-header">
	                          <h1 class="modal-title fs-5" id="staticBackdropLabel">승인 처리</h1>
	                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                        </div>
	                        <div class="modal-body" style="display: flex; justify-content: center;">
		                        	
		                        	
							    <div class="form-check form-check-inline">
								  <input class="form-check-input" type="radio" name="adchcode" id="adchcode1">
								  <label class="form-check-label" for="adchcode1">
								    승인
								  </label>
								</div>
								<div class="form-check form-check-inline">
								  <input class="form-check-input" type="radio" name="adchcode" id="adchcode2">
								  <label class="form-check-label" for="adchcode1">
								    반려
								  </label>
								</div>

	                          
	                        </div>
	                        <div class="modal-footer sorting_div">
	                        <form id="studyCafeCK"  action="studycafecheck.do" method="post">
	                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
	                          <input type="text" style="display: none;" id="scCode" name="scCode" value="${studyCafe.scCode }">
	                          <input type="text" style="display: none;" id="check" name="check" >
	                          <input type="text" style="display: none;" id="adCode" name="adCode" value="${adCode}" >
	                          <input type="text" style="display: none;" id="currPageNo" name="currPageNo" value="${currPageNo}" >
	                          <input type="text" style="display: none;" id="range" name="range" value="${range}" >
	                          <input type="text" style="display: none;" id="searchType" name="searchType" value="${searchType}" >
	                          <input type="text" style="display: none;" id="keyword" name="keyword" value="${keyword}" >
	                          <button type="button" class="btn notice_btn" id="processBtn" onclick="process()">Yes</button></form>
	                        </div>
	                      </div>
	                    </div>
	                  </div><!-- 비활성화 모달 영역 끝 -->						
				
				
				
				
			</div><!-- rightContent_div -->
		
		</div><!-- content -->
	</section>
	
	<footer>
		<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>