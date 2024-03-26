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
<title>관리자 페이지 - 관리자 회원 목록</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adminPageStyle.css">

<script type="text/javascript">

function adminCreate()
{
	$('#err').text("");
	var adPw = document.getElementById("adPw").value;
	var pwLength= adPw.length;
	
	var createForm = document.getElementById('createForm');
	
	var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	
	if(pwLength<8 || pwLength>16)
	{
		$('#err').text('비밀번호 길이가 맞지 않습니다. (8~16자)');
	}
	else if(false === reg.test(adPw)) 
	{
		$('#err').text('숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
	}
	else
	{
		createForm.submit();
	}

	
}

function strongPassword (str) 
{
	  return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
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
					<span><span>관리자</span> 계정 관리</span>
				</div>
				
				<div class="sorting_div">
						<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#adminCreate" >
			                    계정 추가
			            </button>
				</div>
				
				<div class="list">
					<table class="list_table">
						<tr class="spacer"></tr>
						<tr>
							<th>관리자 코드</th>
							<th>닉네임</th>
							<th>등록 일자</th>
							<th>비활성화 일자</th>
							<th>상태</th>
						</tr>
						<tr class="spacer"></tr>
					<c:forEach var="admin" items="${list }" varStatus="status">
						<tr>
							<td>${admin.adCode }</td>
							<td><a href="#" >${admin.adNick }</a></td>
							<td>${admin.adDate}</td>
							<td>
								<c:choose>
									<c:when test="${admin.adUndate != null}"> ${admin.adUndate }</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${admin.adUndate != null}"><button type="submit" class="btn btn-custom" disabled>비활성화</button></c:when>
									<c:otherwise>
										<button type="button" class="btn btn-custom" data-bs-toggle="modal" data-bs-target="#adminState${status.index }" >
				                    	활성화
				                	  	</button>
				                	  
									</c:otherwise>
								</c:choose>
	
							</td>
						</tr>			
		               	<!-- 비활성화 모달 영역 -->
	                  <div class="modal fade" id="adminState${status.index }" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered">
	                      <div class="modal-content">
	                        <div class="modal-header">
	                          <h1 class="modal-title fs-5" id="staticBackdropLabel">확인</h1>
	                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                        </div>
	                        <div class="modal-body">
	                        	${admin.adCode }
	                          계정을 비활성화 하시겠습니까?<br>비활성화 이후 해당 계정은 사용할 수 없습니다.
	                        </div>
	                        <div class="modal-footer">
	                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
	                          <form action="adminadminstate.do?adCode=${admin.adCode}" method="get">
	                          <input type="text" style="display: none;" name="adCodeUnreg" value="${admin.adCode}">
	                          <button type="submit" class="btn notice_btn">Yes</button>
	                          </form>
	                        </div>
	                      </div>
	                    </div>
	                  </div><!-- 비활성화 모달 영역 끝 -->
						
						
					</c:forEach>

						<tr class="spacer"></tr>
					</table>
				</div>
				
				
				<!-- 게시물이 10개 이하일 경우 페이징 부분 출력되지 않음 -->
				<c:choose>
					<c:when test="${count > 10 }">
					
						<nav aria-label="Page navigation example paging" class="paging">
						<ul class="pagination">
						<c:if test="${vNum!=1 }">
							<li class="page-item"><a class="page-link" href="adminadminlist.do?vNum=${vNum-1 }">Previous</a></li>
							<li class="page-item"><a class="page-link" href="adminadminlist.do?vNum=${vNum-1 }">&lt;</a></li>
						</c:if>
							<c:forEach var="pageNum" items="${page }">
								<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"> style="font-weight:bold;" </c:if>
								href="adminadminlist.do?vNum=${pageNum }">					
								${pageNum }
								</a></li>
								
								
							</c:forEach>
							<c:if test="${vNum!=lastNum }">
								<li class="page-item"><a class="page-link" href="adminadminlist.do?vNum=${vNum+1 }">&gt;</a></li>
								<li class="page-item"><a class="page-link" href="adminadminlist.do?vNum=${vNum+1 }">Next</a></li>

							</c:if>
						</ul>
						</nav>
						
					
					</c:when>
					<c:otherwise>
					
					
					</c:otherwise>
				
				</c:choose>

    	      	<!-- 계정 생성 모달 영역 -->
                  <div class="modal fade" id="adminCreate" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h1 class="modal-title fs-5" id="staticBackdropLabel">확인</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form id="createForm" action="adminadmininsert.do" method="POST">
                        <div class="modal-body">
                        	아이디  <input type="text"  class="form-control" id="adId" name="adId" value="${nextId }" readonly="readonly"><br>
                        	비밀번호  <input type="password"  class="form-control" id="adPw" name="adPw"><br>
                        	<span class="err" id="err"></span>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                          <button type="button" class="btn notice_btn"  onclick="adminCreate()">Yes</button>
                        </div>
                        </form>
                      </div>
                    </div>
                  </div><!-- 계정 생성 모달 영역 끝 -->		
	
			</div><!-- rightContent_div -->
		</div><!-- content -->
	</section>
	
	<footer>
		<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>