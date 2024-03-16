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
<title>관리자 - 전체게시판 신고컨텐츠.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adminPageStyle.css">

<script type="text/javascript">

	// 반려 상태일때만 허위신고 체크할 수 있게 처리
	$(document).ready(function()
	{
		$(".redcode").change(function()
		{
			
			var redcode2 = document.getElementById("redcode2");
			
		 	if(redcode2.checked)
			{
				$("#falseReport").prop("disabled",null);
			}
			else
			{
				$("#falseReport").attr("disabled", true);
			} 
		});
		
	});



	function process()
	{
		var code = document.getElementById('code').value;
		var ok = document.getElementById('redcode1');
		var no = document.getElementById('redcode2');
		
		var processForm = document.getElementById('allBBSReportProcess');
		
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
				
				if($("#falseReport").is(":checked"))
				{
					document.getElementById('lie').value = '1';
				}
				else
				{
					document.getElementById('lie').value = '0';
				}
				
				
				
				processForm.submit();
				
			}
		}
		
	}

	function list(currPageNo, range, searchType, keyword) 
	{

		var url = "adminreportallbbslist.do";
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
					<span><span>
						<c:choose>
							<c:when test="${rtype=='1' }">게시물</c:when>						
							<c:when test="${rtype=='2' }">댓글</c:when>						
							<c:otherwise>대댓글</c:otherwise>						
						</c:choose>
						신고글 번호	
					</span> ${code }</span>
				</div>
				



					<div class="info_div shadow-sm">
						<table class="table ">
							<tbody>
								<tr>
									<th>신고자</th>
									<td>${reportUser } </td>
									<th>
										<c:choose>
											<c:when test="${rtype=='1' }">게시물</c:when>						
											<c:when test="${rtype=='2' }">댓글</c:when>						
											<c:otherwise>대댓글</c:otherwise>						
										</c:choose>
									번호</th>
									<td>${report.rpCode }</td>
									<th>작성자</th>
									<td>
									<a href="adminguestinfo.do?guCode=${report.reported }"> ${reportedUser }
									</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<c:choose>
						<c:when test="${rtype=='1' }">
							<div class=" shadow-sm">
								<table class="table ">
									<tbody>
										<tr>
											<th>신고게시물 제목 </th>
											<td><a href="#">${report.rpContent }</a></td>
										</tr>
		
									</tbody>
								</table>
							</div>
						</c:when>
					
						<c:otherwise>
							<div class=" shadow-sm">
							<table class="table ">
								<tbody>
									<tr>
										<th>신고게시물 제목</th>
										<td><a href="boardview.do?boCode=${boardCode }">${boardTitle }</a></td>
									</tr>
									<tr>
										<th>신고게시물 댓글</th>
										<td>${report.rpContent }</td>
									</tr>
	
								</tbody>
							</table>
						</div>				
						
						
						</c:otherwise>
					</c:choose>

					<div class="shadow-sm">
						<table class="table ">
							<tbody>
								<tr>
									<th>신고 일자</th>
									<td>${report.rpDate }</td>
									<th>신고 사유</th>
									<td>
									<c:choose>
										<c:when test="${report.rpReason=='201' }">스팸, 홍보 도배글</c:when>
										<c:when test="${report.rpReason=='202' }">음란물</c:when>
										<c:when test="${report.rpReason=='203' }">불법정보 포함</c:when>
										<c:when test="${report.rpReason=='204' }">청소년에게 유해한 내용</c:when>
										<c:when test="${report.rpReason=='205' }">욕설/생명경시/혐오/차별적 표현</c:when>
										<c:when test="${report.rpReason=='206' }">개인정보 노출 게시물</c:when>
										<c:when test="${report.rpReason=='207' }">불쾌한 표현</c:when>
										<c:when test="${report.rpReason=='208' }">카테고리와 맞지 않는 글</c:when>
										<c:when test="${report.rpReason=='209' }">만남 유도</c:when>
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
							  <input class="form-check-input redcode" type="radio" name="redcode" id="redcode1">
							  <label class="form-check-label" for="redcode1">
							    승인
							  </label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input redcode" type="radio" name="redcode" id="redcode2">
							  <label class="form-check-label" for="redcode2">
							    반려
							  </label>
							</div>
							
	                        <div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox" id="falseReport" disabled="disabled">
							  <label class="form-check-label" for="falseReport">
							    허위 신고 
							  </label>
							</div>  
	                        
	                          
	                        </div>
	                        <div class="modal-footer sorting_div">
	                        <form id="allBBSReportProcess"  action="adminreportallbbsprocess.do" method="post">
	                          <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">No</button>
	                          <input type="text" style="display: none;" id="code" name="code" value="${code }">
	                          <input type="text" style="display: none;" id="reported" name="reported" value="${report.reported }">
	                          <input type="text" style="display: none;" id="rtype" name="rtype" value="${rtype }">
	                          <input type="text" style="display: none;" id="redCode" name="redCode" >
	                          <input type="text" style="display: none;" id="lie" name="lie" >
	                   		  <input type="text" style="display: none;" id="currPageNo" name="currPageNo" value="${currPageNo}" >
	                          <input type="text" style="display: none;" id="range" name="range" value="${range}" >
	                          <input type="text" style="display: none;" id="searchType" name="searchType" value="${searchType}" >
	                          <input type="text" style="display: none;" id="keyword" name="keyword" value="${keyword}" >
	                          <button type="button" class="btn notice_btn" id="processBtn" onclick="process()">Yes</button>
	                          </form>
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