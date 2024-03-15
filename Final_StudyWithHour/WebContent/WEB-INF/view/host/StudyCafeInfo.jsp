<%@page import="com.study.mvc.model.HostDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 호스트 세션 받아오기
	HostDTO host = (HostDTO) session.getAttribute("host");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCafeInfo.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/hostPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>

			<div class="rightContent_div">
				<div class="regInfo_div">
				<div class="page_title">
					<span><span>상세정보</span></span>
				</div>
				<div class="sorting_div"></div>
					
				<!---------------------- 스터디카페 내역 start ---------------------->
				<%-- 관리자의 카페 승인이 완료된 경우 --%>
				<c:choose>
				<c:when test="${cafe.adPerDate != null }">
					<h4>등록정보</h4>
					<table class="register_table">
						<tr class="spacer"></tr>
						<tr>
							<td>등록일자</td>
							<c:set var="scDate" value="${cafe.scDate }"/>
							<td>${fn:substring(scDate, 0, 11)}</td>
						</tr>
						<tr>
							<c:set var="perDate" value="${cafe.adPerDate }"/>
							<td>승인일자</td>
							<td>${fn:substring(perDate, 0, 11)}</td>
						</tr>
						<tr class="spacer"></tr>
						<tr>
							<td>상호명</td>
							<td>${cafe.scName }</td>
						</tr>
						<tr>
							<td>								
								<c:set var="tel" value="${cafe.scTel }"/>
								<c:set var="resNum" value="${cafe.scResnumber }"/>
								사업자등록번호
							</td>
							<td>${fn:substring(resNum, 0, 3)} - ${fn:substring(resNum, 3, 5)} - ${fn:substring(resNum, 5, 11)}</td>
						</tr>
						<tr> 
							<td>주소</td>
							<td>${cafe.scAddr1 }, ${cafe.scAddr2 }</td>
						</tr>
						<tr> 
							<td>운영시간</td>
							<td>${cafe.scOpenHour } ~ ${cafe.scCloseHour }</td>
						</tr>
						<c:choose>
							<c:when test="${fn:length(tel) == 11}">
							<tr>
								<td>전화번호</td>							
								<td>${fn:substring(tel, 0, 3)} - ${fn:substring(tel, 3, 7)} - ${fn:substring(tel, 7, 11)}</td>
							</tr>
							</c:when>
							<c:when test="${fn:length(tel) == 10}">
							<tr>
								<td>전화번호</td>							
								<td>${fn:substring(tel, 0, 2)} - ${fn:substring(tel, 2, 6)} - ${fn:substring(tel, 6, 10)}</td>							
							</tr>
							</c:when>
							<c:when test="${fn:length(tel) == 9}">
							<tr>
								<td>전화번호</td>							
								<td>${fn:substring(tel, 0, 2)} - ${fn:substring(tel, 2, 5)} - ${fn:substring(tel, 5, 9)}</td>							
							</tr>
							</c:when>
						</c:choose>
						<tr>
							<td>편의시설</td>
							<td>
							<c:forEach var="i" begin="0" end="${fn:length(cafe.scConvenient)}" step="1">
								${fn:split(cafe.scConvenient,',')[i]}
							</c:forEach>
							</td>							
						</tr>
						<tr>
							<td>주변시설</td>
							<td>
							<c:forEach var="i" begin="0" end="${fn:length(cafe.scSurround)}" step="1">
								${fn:split(cafe.scSurround,',')[i]}
							</c:forEach>
							</td>							
						</tr>
						<tr>
							<td>유의사항</td>
							<td>${cafe.scCaution }</td>
						</tr>
						<tr>
							<td>상세설명</td>
							<td>${cafe.scDetail }</td>
						</tr>
						<tr class="spacer"></tr>
					</table>
					<div style="display: flex; justify-content: flex-end;">
						<button type="button" class="signUp" onclick="location.href='cafeupdateform.do?scCode=${cafe.scCode}'">수정</button>
						<!-- 버튼 눌러서 모달창 띄우기 -->
				        <button type="button" class="signUp signUp-del" id="cafeDelete" value="${cafe.scCode }" 
				        data-bs-toggle="modal" data-bs-target="#staticBackdrop">비활성화</button>												
					</div>
					<!---------------------- 스터디카페 내역 end ---------------------->
					
					<!---------------------- 스터디룸 내역 start ---------------------->
					<div style="display: flex; align-items: center; margin-top: 50px;">
						<h4>스터디룸내역</h4>
					</div>
					<div class="overflow">	
					<form action="caferoominsert.do?scCode=${cafe.scCode }" method="post" >
					<table class="overflow_table">
						<tr class="spacer"></tr>
						<tr>
							<td>NO</td>
							<td>스터디룸명</td>
							<td>최대인원</td>
							<td>가격</td>
							<td>수정</td>
							<td>비활성화</td>
						</tr>
						<c:forEach var="rm" items="${room }" varStatus="r">
						<tr>
							<td>${rm.rNum }</td>
							<td>${rm.srName }</td>
							<td>${rm.srCount }명</td>
							<td>${rm.srPrice }원</td>
							<td>
								<button type="button" class="tableBtn" data-bs-toggle="modal" data-bs-target="#updateRoom${r.index}" value="${rm.srCode }">수정</button>
							</td>
							<td>
								<button type="button" class="tableBtn" data-bs-toggle="modal" data-bs-target="#deleteRoom${r.index}" value="${rm.srCode }">비활성화</button>
							</td>
						</tr>
						
		<!-- 스터디룸 수정 모달 영역 ------------------------------------------------------------------------->
        <div class="modal fade" id="updateRoom${r.index}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="updateRoomLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
	       <form action="caferoomupdate.do?scCode=${cafe.scCode}" method="post">
            <div class="modal-content">
              <div class="modal-header">
	            <h1 class="modal-title fs-5" id="updateRoomLabel">스터디룸 수정</h1>
	            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	          </div>
              <div class="modal-body" style="text-align: center; display: flex; justify-content: space-evenly;">
                <input type="text" class="regInput" name="updateName"placeholder="${rm.srName }">
                <input type="hidden" name="updateCode" value="${rm.srCode }">
                <select name="updateCount" class="regInput">
               		<c:forEach var="c" begin="2" end="10" step="1">
               			<c:choose>
	               			<c:when test="${c eq rm.srCount }">
			                <option selected="selected" value="${c}">${c}명</option>
			                </c:when>
			                <c:otherwise>
			                <option value="${c}">${c}명</option>
			                </c:otherwise>
		                </c:choose>
	                </c:forEach>
				</select>
				<input type="text" class="regInput" name="updatePrice" placeholder="${rm.srPrice }원">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <button type="submit" class="btn btn-primary">Yes</button>
              </div>
            </div>
	       </form>
          </div>
        </div>
        
		<!-- 스터디룸 비활성화 모달 영역 -------------------------------------------------------->
        <div class="modal fade" id="deleteRoom${r.index}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="deleteRoomLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
	            <h1 class="modal-title fs-5" id="deleteRoomLabel">스터디룸 비활성화</h1>
	            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	          </div>
              <div class="modal-body" style="text-align: center; display: flex; justify-content: space-evenly;">
              <input type="hidden" name="deleteCode" value="${rm.srCode }">
              	<span>비활성화 철회는 불가합니다. 계속 진행하시겠습니까?</span>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary" onclick="location.href='caferoomdelete.do?scCode=${cafe.scCode}&srCode=${rm.srCode }'">Yes</button>
              </div>
            </div>
          </div>
        </div>
						</c:forEach>
						<tr>
							<td>추가등록</td>
							<td>
								<input type="text" class="regInput" name="roomName">
							</td>
							<td>
								<select name="srCount" class="regInput">
										<option value="2">2명</option>										
										<option value="3">3명</option>										
										<option value="4">4명</option>										
										<option value="5">5명</option>										
										<option value="6">6명</option>										
										<option value="7">7명</option>										
										<option value="8">8명</option>										
										<option value="9">9명</option>										
										<option value="10">10명</option>										
								</select>
							</td>
							<td>
								<input type="text" class="regInput" name="price">원
							</td>
							<td colspan="2" style="text-align: center;">
								<button type="submit" class="tableBtn" style="height: 30px;">등록</button>
							</td>
						</tr>
						<tr class="spacer"></tr>
					</table>
					</form>
					</div>					
					<!---------------------- 스터디룸 내역 end ---------------------->
					
					<!---------------------- 리뷰내역 start ---------------------->								
					<div style="display: flex; align-items: center; justify-content: space-between; margin-top: 50px;">
						<h4>리뷰내역 <span style="color: #94bc32">${count }</span>개</h4>
						<a href="cafereviewlist.do?scCode=${cafe.scCode }">더보기</a>
					</div>									
						<table class="register_table">
							<tr class="spacer"></tr>
					<c:choose>
						<c:when test="${count > 0 }">
						<c:forEach var="review" items="${review }">
							<tr>
								<td>👤${review.guNick } [${review.grName}]</td>
								<td style="text-align: right;">${review.rvDate }</td>
							</tr>
							<tr>
								<td colspan="2">└ ${review.rvContent }</td>
							</tr>												
						</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="2" style="text-align: center;">리뷰내역이 존재하지 않습니다.</td>
							</tr>												
						</c:otherwise>
						</c:choose>
							<tr class="spacer"></tr>
						</table>
					<div style="display: flex; justify-content: flex-end;">
						<button type="button" class="signUp" onclick="location.href='cafelist.do?hoCode=<%=host.getHoCode()%>'">목 록</button>					
					</div>
				</c:when>
				<%-- 관리자의 카페 승인 대기중인 경우 --%>
				<c:otherwise>
					<h4>등록정보</h4>
					<table class="register_table">
						<tr class="spacer"></tr>
						<tr>
							<td>등록일자</td>
							<c:set var="scDate" value="${cafe.scDate }"/>
							<td>${fn:substring(scDate, 0, 11)}</td>
						</tr>
						<tr>
							<td>승인일자</td>
							<td>-</td>
						</tr>
						<tr class="spacer"></tr>
						<tr>
							<td>상호명</td>
							<td>${cafe.scName }</td>
						</tr>
						<tr>
							<td>								
								<c:set var="resNum" value="${cafe.scResnumber }"/>
								사업자등록번호
							</td>
							<td>${fn:substring(resNum, 0, 3)} - ${fn:substring(resNum, 3, 5)} - ${fn:substring(resNum, 5, 11)}</td>
						</tr>
						<tr> 
							<td>주소</td>
							<td>${cafe.scAddr1 }, ${cafe.scAddr2 }</td>
						</tr>
						<tr> 
							<td>운영시간</td>
							<td>${cafe.scOpenHour } ~ ${cafe.scCloseHour }</td>
						</tr>
						<c:set var="tel" value="${cafe.scTel }"/>
						<c:choose>
							<c:when test="${fn:length(tel) == 11}">
							<tr>
								<td>전화번호</td>							
								<td>${fn:substring(tel, 0, 3)} - ${fn:substring(tel, 3, 7)} - ${fn:substring(tel, 7, 11)}</td>
							</tr>
							</c:when>
							<c:when test="${fn:length(tel) == 10}">
							<tr>
								<td>전화번호</td>							
								<td>${fn:substring(tel, 0, 2)} - ${fn:substring(tel, 2, 6)} - ${fn:substring(tel, 6, 10)}</td>							
							</tr>
							</c:when>
							<c:when test="${fn:length(tel) == 9}">
							<tr>
								<td>전화번호</td>							
								<td>${fn:substring(tel, 0, 2)} - ${fn:substring(tel, 2, 5)} - ${fn:substring(tel, 5, 9)}</td>							
							</tr>
							</c:when>
						<c:otherwise>
							<td>전화번호</td>
							<td> - </td>
						</c:otherwise>
						</c:choose>
						<tr>
							<td>편의시설</td>
							<td>
							<c:forEach var="i" begin="0" end="${fn:length(cafe.scConvenient)}" step="1">
								${fn:split(cafe.scConvenient,',')[i]}
							</c:forEach>
							</td>							
						</tr>
						<tr>
							<td>주변시설</td>
							<td>
							<c:forEach var="i" begin="0" end="${fn:length(cafe.scSurround)}" step="1">
								${fn:split(cafe.scSurround,',')[i]}
							</c:forEach>
							</td>							
						</tr>
						<tr>
							<td>유의사항</td>
							<td>${cafe.scCaution }</td>
						</tr>
						<tr>
							<td>상세설명</td>
							<td>${cafe.scDetail }</td>
						</tr>
						<tr class="spacer"></tr>
					</table>
					<div style="display: flex; justify-content: flex-end;">
						<button type="button" class="signUp" onclick="location.href='cafelist.do?hoCode=<%=host.getHoCode()%>'">목 록</button>					
					</div>
						
				</c:otherwise>
				</c:choose>									

				</div>
			</div>
		</div>
		  
 <!-- 스터디카페 비활성화 모달 영역 -->
 <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content">
       <div class="modal-header" style="border: none;">
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       </div>
       <div class="modal-body" style="text-align: center;">
         비활성화 철회는 불가합니다. 계속 진행하시겠습니까?
       </div>
       <div class="modal-footer" style="border: none;">
         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
         <button type="button" class="btn btn-primary" onclick="location.href='cafedelete.do?scCode=${cafe.scCode}&hoCode=<%=host.getHoCode()%>'">Yes</button>
       </div>
     </div>
   </div>
 </div>

	</section>

	<footer>
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>
</body>
</html>