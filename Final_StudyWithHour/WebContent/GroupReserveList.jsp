<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupReserveList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/groupPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	function sendIt()
	{
		var f = document.searchForm;
		
		f.submit();
	}
	
	function reviewInsert(form)
	{
		form.submit();
	}

</script>
</head>
<body>
	<header>
		<c:import url="/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<c:import url="SideMenu.jsp"></c:import>

			<div class="rightContent_div">
				<div class="content_div">
				
				<div class="page_title">
					<span><span>예약 내역</span> 관리</span>
				</div>
				
				<!-- 검색창 영역 ------------------------------------------------------------>
				<div class="select_div">
					<form action="groupreservelist.do?grCode=1" method="post" name="searchForm">
					<select class="select_bar" name="fbState">
					<c:choose>
					<c:when test="${fbState eq 'done' }">
						<option value="fbAll">전체</option>
						<option value="done" selected="selected">이용완료</option>
						<option value="yet">이용예정</option>
						<option value="noshow">노쇼</option>
					</c:when>
					<c:when test="${fbState eq 'yet' }">
						<option value="fbAll">전체</option>
						<option value="done">이용완료</option>
						<option value="yet" selected="selected">이용예정</option>
						<option value="noshow">노쇼</option>
					</c:when>
					<c:when test="${fbState eq 'noshow' }">
						<option value="fbAll">전체</option>
						<option value="done">이용완료</option>
						<option value="yet">이용예정</option>
						<option value="noshow" selected="selected">노쇼</option>
					</c:when>
					<c:otherwise>
						<option value="fbAll" selected="selected">전체</option>
						<option value="done">이용완료</option>
						<option value="yet">이용예정</option>
						<option value="noshow">노쇼</option>
					</c:otherwise>
					</c:choose>
					</select>
					<select class="select_bar" name="reState">
					<c:choose>
					<c:when test="${reState eq 'access' }">
						<option value="reAll">전체</option>
						<option value="access" selected="selected">확정</option>
						<option value="cancel">취소</option>
					</c:when>
					<c:when test="${reState eq 'cancel' }">
						<option value="reAll">전체</option>
						<option value="access">확정</option>
						<option value="cancel" selected="selected">취소</option>
					</c:when>
					<c:otherwise>
						<option value="reAll" selected="selected">전체</option>
						<option value="access">확정</option>
						<option value="cancel">취소</option>
					</c:otherwise>
					</c:choose>
					</select>
					<select name="searchKey" class="select_bar">
						<c:choose>
							<c:when test="${searchKey eq 'cafe' }">
								<option value="resDate">예약일자</option>
								<option value="cafe" selected="selected">스터디카페명</option>
								<option value="room">예약자</option>
							</c:when>
							<c:when test="${searchKey eq 'room' }">
								<option value="resDate">예약일자</option>
								<option value="cafe">스터디카페명</option>
								<option value="room" selected="selected">예약자</option>
							</c:when>
							<c:otherwise><!-- 예약 날짜 캘린더에서 값 받기 -->
								<option value="resDate" selected="selected">예약일자</option>
								<option value="cafe">스터디카페명</option>
								<option value="room">예약자</option>
							</c:otherwise>
						</c:choose>
					</select> 
					<input type="text" class="selectInput" name="searchValue" placeholder="${searchValue }">
					<button type="button" class="selectBtn" onclick="sendIt()">Search</button>
					</form>
				</div>
				
				<!-- 예약 내역 ------------------------------------------------------------>
				<div class="list">
					<table class="list_table">
						<tr class="spacer"></tr>
						<tr>
							<th>No</th>
							<th>스터디카페/스터디룸</th>
							<th>일자</th>
							<th>시간</th>
							<th>예약자</th>
							<th>인원</th>
							<th>금액</th>
							<th>이용상태</th>
							<th>예약상태</th>
						</tr>
						<tr class="spacer"></tr>
						<c:forEach var="list" items="${group }" varStatus="re">
							<tr>
								<td>${list.rNum }</td>
								<td>${list.scName }/${list.srName }</td>
								<td>${fn:substring(list.reStartDate,0,11) }</td>
								<td>${list.reStartHour } ~ ${list.reEndHour }</td>
								<td>${list.guNick }</td>
								<td>${list.reCount }명</td>
								<td>${list.srPrice }원</td>
								<td>
									<c:choose>
									<c:when test="${list.fbState == '이용'}">
										이용완료
									</c:when>
									<c:when test="${list.fbState == '이용완료'}">
										<c:choose>
											<c:when test="${list.rvCode == null }">
												<button type="button" class="reviewBtn" id="review" 
												data-bs-toggle="modal" data-bs-target="#reviewStatic${re.index }">📝리뷰</button> 
	<!-- 리뷰작성 모달 영역 -->
    <div class="modal fade" id="reviewStatic${re.index }" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="reviewStaticLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="reviewStaticLabel">[리뷰 작성] ${list.scName } ${list.srName }</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="groupreviewinsert.do?grCode=${list.grCode }" method="post" id="reviewForm">
          <div class="modal-body" style="text-align: center; line-height: normal; display: flex; justify-content: space-evenly; align-items: center;">
            <span>리뷰</span>
            <input type="hidden" value="${list.fbCode }" name="fbCode" />
            <textarea cols="30" name="rvContent"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-feedback" style="background-color: #94be2c; color: #ffffff;" onclick="reviewInsert(this.form)">제출</button>
            <button type="button" class="btn btn-feedback" aria-label="Close" data-bs-dismiss="modal" style="background-color: #94be2c; color: #ffffff;">취소</button>
          </div>
          </form>
        </div>
      </div>
    </div>
											</c:when>
											<c:otherwise>
												${list.fbState }
											</c:otherwise>
										</c:choose>
									</c:when>										
									<c:otherwise>
										${list.fbState }
									</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
									<c:when test="${list.reState == '확정'}">
										<c:choose>
											<c:when test="${list.fbState == '이용예정' }">
											<button type="button" class="cancelBtn" id="cancel" 
											data-bs-toggle="modal" data-bs-target="#cancelStatic${re.index }">예약취소</button> 
	<!-- 예약 취소 모달 영역 -->
    <div class="modal fade" id="cancelStatic${re.index }" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="cancelStaticLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="cancelStaticLabel">스터디카페 예약취소</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body" style="text-align: center; line-height: normal; display: flex; justify-content: space-evenly; align-items: center;">
            <input type="hidden" name="grCode" value="${list.grCode }"/>
            <span>${list.scName } ${list.srName }<br>예약을 정말 취소하시겠습니까?</span>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-feedback" style="background-color: #94be2c; color: #ffffff;" onclick="location.href='groupreservedelete.do?reCode=${list.reCode}'">Yes</button>
            <button type="button" class="btn btn-feedback" aria-label="Close" data-bs-dismiss="modal" style="background-color: #94be2c; color: #ffffff;">No</button>
          </div>
        </div>
      </div>
    </div>
											</c:when>
											<c:otherwise>
												${list.reState }
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										${list.reState }
									</c:otherwise>
									</c:choose>									
								</td>
							</tr>
						</c:forEach>
						<c:if test="${dataCount <=0 }">
						<tr>
							<td colspan="9" style="text-align: center;">예약내역이 존재하지 않습니다.</td>
						</tr>
						</c:if>
						<tr class="spacer"></tr>
					</table>
				</div>
				
				<!-- 페이징 ------------------------------------------------------------>
				<nav aria-label="Page navigation example paging" class="paging">
					<ul class="pagination">
						<c:if test="${dataCount != 0 }">
							<li class="page-item">${pageIndexList }</li>
						</c:if>
					</ul>
				</nav>
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>
</body>
</html>