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
<title>관리자 - 호스트 신고컨텐츠.jsp</title>
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
		var hrCode = document.getElementById('hrCode').value;
		var ok = document.getElementById('redcode1');
		var no = document.getElementById('redcode2');
		
		var processForm = document.getElementById('hostReportProcess');
		
		if (ok.checked==false && no.checked==false)
		{
			alert("신고 결과를 선택하세요");
		}
		else
		{
			if (ok.checked==true)
			{
				
				document.getElementById('redCode').value = '1';
				 processForm.submit();
			}
			else
			{
				
				document.getElementById('redCode').value = '2';
				 processForm.submit();
			}
		}
		
	}
	
	function list(currPageNo, range, searchType, keyword) 
	{

		var url = "adminreporthostlist.do";
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
					<span><span>신고글 번호</span> ${code }</span>
				</div>





					<div class="info_div">
						<table class="table ">
							<tbody>
								<tr>
									<th>신고자</th>
									<td>${hostUser }</td>
									<th>예약 번호</th>
									<td>${report.rpCode }</td>
									<th>신고 대상</th>
									<td>
										${studycafeName }
									</td>
								</tr>

							</tbody>
						</table>
					</div>
					<c:choose>
						<c:when test="${rtype=='306' }">
							<!-- 리뷰 내용 신고일 경우  -->	
							<div class="info_div">
							<table class="table ">
								<tbody>
										<tr>
											<th>스터디카페 이름</th>
											<td>${studycafeName } / 이후 스터디카페 게시판과 연결(스터디카페 코드 : ${studycafeCode })</td>
										</tr>
										<tr>
											<th>스터디그룹 이름 </th>
											<td><a href="adminstudygroupinfo.do?grCode=${report.reported }">${groupName }</a></td>
										</tr>
		
									<tr>
										<th>리뷰 내용</th>
										<td>${reviewContent }</td>
									</tr>

								</tbody>
							</table>
							</div>				
						</c:when>
						<c:otherwise>
							<!--  이용 내역 신고일 경우 -->
							<div class=" info_div">
								<table class="table ">
									<tbody>
										
										<tr>
											<th>스터디카페 이름</th>
											<td>${studycafeName } </td>
										</tr>
										<tr>
											<th>스터디그룹 이름 </th>
											<td><a href="adminstudygroupinfo.do?grCode=${report.reported }">${groupName }</a></td>
										</tr>
		
										<tr>
											<th>파일 첨부 </th>
											<td><a href="#">-</a></td>
										</tr>
									</tbody>
								</table>
							</div>						
						</c:otherwise>
					</c:choose>

					<div class="info_div">
						<table class="table ">
							<tbody>
								<tr>
									<th>신고 일자</th>
									<td>${report.rpDate }</td>
									<th>신고 사유</th>
									<td>
									<c:choose>
										<c:when test="${report.rpReason=='301' }">기물파손</c:when>
										<c:when test="${report.rpReason=='302' }">면학 분위기 훼손</c:when>
										<c:when test="${report.rpReason=='303' }">퇴실시간 미엄수</c:when>
										<c:when test="${report.rpReason=='304' }">스터디룸 내 음주/흡연</c:when>
										<c:when test="${report.rpReason=='305' }">노쇼</c:when>
										<c:when test="${report.rpReason=='306' }">악의적인 후기</c:when>
									</c:choose>
									</td>
								</tr>
								<c:if test="${report.redcode!=null }">
								<tr>
									<th>처리 일자</th>
									<td>${report.rdDate }</td>
									<th>처리 결과</th>
									<td>
										<c:choose>
											<c:when test="${report.redcode=='1' }">승인</c:when>
											<c:when test="${report.redcode=='2' }">미승인</c:when>
										</c:choose>
										
									</td>
								</tr>
								
								</c:if>


							</tbody>
						</table>
					</div>
	

					<br>
					<div class="list-foot">
						<div class="row justify-content-center">
							<div class="col-2 list-page">
							<c:if test="${report.redcode==null }">
							
							<button type="button" class="btn notice_btn" data-bs-toggle="modal" data-bs-target="#ReportProcess" >
				                    	처리
	                	  	</button>
							
							
							</c:if>
								<button type="button" class="btn notice_btn" 
								onclick="list('${currPageNo}', '${range}', '${searchType}', '${keyword}')">목록</button>
							</div>
							</div>
						</div>

					</div>
					
					<!-- list-foot -->
	               	
	               	<!-- 비활성화 모달 영역 -->
	                  <div class="modal fade  " id="ReportProcess" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered">
	                      <div class="modal-content">
	                        <div class="modal-header">
	                          <h1 class="modal-title fs-5" id="staticBackdropLabel">신고 처리</h1>
	                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                        </div>
	                        <div class="modal-body" style="display: flex; justify-content: center;">
	                        	
	                        	
						    <div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="redcode" id="redcode1">
							  <label class="form-check-label" for="redcode1">
							    승인
							  </label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="redcode" id="redcode2">
							  <label class="form-check-label" for="redcode2">
							    반려
							  </label>
							</div>
							<!-- 호스트 신고는 필요 없음
	                        <div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  <label class="form-check-label" for="flexCheckDefault">
							    허위 신고 
							  </label>
							</div>  
	                         -->  
	                          
	                        </div>
	                        <div class="modal-footer sorting_div">
	                        <form id="hostReportProcess"  action="adminreporthostprocess.do" method="post">
	                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
	                          <input type="text" style="display: none;" id="hrCode" name="hrCode" value="${code }">
	                          <input type="text" style="display: none;" id="redCode" name="redCode" >
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