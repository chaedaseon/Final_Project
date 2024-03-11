<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String adCode = (String)session.getAttribute("adCode");
	String guCode = (String)session.getAttribute("guCode");
	String hoCode = (String)session.getAttribute("hoCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyGroupList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sliderStyle.css">
<link rel="stylesheet" type="text/css" href="css/studyGroupPageStyle.css">
<script type="text/javascript">

	$(document).ready(function() 
	{
		$(".groupJoin_button").click(function() 
		{
		    // 그룹 가입 버튼(모집글 내용)이 속한 댓글 요소의 값을 가져오기
		    var grCode = $(this).closest("li").find("input[name=grCode]").val();
		    var grGuCode = $(this).closest("li").find("input[name=guCode]").val();
		    var grComment = $(this).closest("li").find("input[name=grComment]").val();
		    var grLeader = $(this).closest("li").find("input[name=grLeader]").val();
		    var age = $(this).closest("li").find("input[name=age]").val();
		    var grName = $(this).closest("li").find("input[name=grName]").val();
		    var grCount = $(this).closest("li").find("input[name=grCount]").val();
		    var grSubject = $(this).closest("li").find("input[name=grSubject]").val();
		    var gender = $(this).closest("li").find("input[name=gender]").val();
		    // 현재 사용자의 guCode 값 가져오기
		    var ssessionGuCode = $("#ssessionGuCode").val();
		    
		    if (ssessionGuCode != grGuCode) {
		        // 모달에 rpCode 저장 및 모달 열기
		        $("#groupJoinModal").modal("show");
		        $("input[name=grComment]").val(grComment);
		        $("#grComment span").text(grComment);
		        $("input[name=grLeader]").val(grLeader);
		        $("#grLeader span").text(grLeader);
		        $("input[name=age]").val(age);
		        $("#age span").text(age);
		        $("input[name=grName]").val(grName);
		        $("#grName span").text(grName);
		        $("input[name=grCount]").val(grCount);
		        $("#grCount span").text(grCount);
		        $("input[name=grSubject]").val(grSubject);
		        $("#grSubject span").text(grSubject);
		        $("input[name=gender]").val(gender);
		        $("#gender span").text(gender);
		    } 
		    else if(ssessionGuCode == grGuCode)
		    {
		        alert("본인이 개설한 그룹입니다.");
		        return;
		    }
		});
	});

</script>
</head>
<body>
	<header>
		<c:import url="/Menu.jsp"></c:import>
	</header>
<input type="hidden" id="ssessionGuCode" value="<%=guCode%>"/>
	<section>
		<c:import url="/SideMenu.jsp"></c:import>
		<div id="content">
			<div class="category_bar">
				<c:import url="/imageSlide.jsp"></c:import>
				
			<!-- content div 시작 부분 -->	
			<div class="content_div">
				<div class="board_title">
					<span><a href="boardgrouplist.do" style="color: #94bc32;">스터디그룹</a></span>
					<c:import url="/CategoryBar_group.jsp"></c:import>
				</div>
				<button type="button" class="btn" id="write_button" onclick="location.href='groupopeninsertform.do'">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
					  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
					</svg>
					모집글작성
				</button>
				
					<div class="row row-cols-lg-4 row-cols-md-3 row-cols-2 row-cols-1 text-center justify-content-center px-xl-6 aos-init aos-animate" id="groupRegList_box">
						<c:forEach var="group" items="${list }">
						<ul>
							<li>
							<div class="col my-4" id="groupReg_one">
								<div class="card">
									<input type="hidden" name="grCode" value="${group.grCode }"/>
									<input type="hidden" name="guCode" value="${group.guCode }"/>
									<input type="hidden" name="grLeader" value="${group.grLeader }"/>
						      		<input type="hidden" name="age" value="${group.age }"/>
						      		<input type="hidden" name="grSubject" value="${group.grSubject }"/>
						      		<input type="hidden" name="grName" value="${group.grName }"/>
						      		<input type="hidden" name="grCount" value="${group.grCount }"/>
						      		<input type="hidden" name="grComment" value="${group.grComment }"/>
						      		<input type="hidden" name="gender" value="${group.gender }"/>
									<div class="card-header bg-transparent">${group.grName }
										<c:choose>
											<c:when test="${group.dDay == 0}">
												<span class="d-day">D-DAY 마감임박</span>
											</c:when>
											<c:when test="${group.dDay > 0}">
												<span class="d-day">D-${group.dDay }</span>
											</c:when>
											<c:when test="${group.dDay < 0}">
												<span class="d-day">모집 종료</span>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</div>
				  					<div class="card-body">
				    				<!-- <h5 class="card-title">Light card title</h5> -->
				    					<p class="card-text"><a type="button" class="groupJoin_button" data-bs-target="#groupJoinModal">${group.grComment }</a></p>
				  					</div>
				    				<div class="card-bottom">
				    					<span id="count"><img src="images/people.png">5 / ${group.grCount } 명</span>
				    					<span id="grNum">No. ${group.no}</span>
				    				</div>
								</div>
							</div>
							</li>
						</ul>	
						</c:forEach>
						<!-- 가입 요청 모달 영역 -->
						<form action="groupjoin.do" method="post">
						<div class="modal fade" id="groupJoinModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered">
						    <div class="modal-content">
						      <div class="modal-header">그룹에 가입하기
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						      
						      <div id="grLeader">그룹장 : <span></span></div>
						      <div id="grName">그룹명 : <span></span></div>
						      <div id="age">연령대 : <span></span></div>
						      <div id="gender">성별 : <span></span></div>
						      <div id="grCount">모집 인원 : <span></span>명</div>
						      <div id="grSubject">활동 분류 : <span></span></div>
						      <div id="grComment">모집 내용 : <br><span></span></div>
						      <input type="hidden" name="grCode">
						      <input type="hidden" name="guCode" value="<%=guCode%>">
						      <input type="hidden" name="grLeader" />
						      <input type="hidden" name="age" />
						      <input type="hidden" name="grName" />
						      <input type="hidden" name="grCount" />
						      <input type="hidden" name="grSubject" />
						      <input type="hidden" name="grComment" />
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
						        <button type="submit" class="btn btn-primary" id="scrapSubmit" >가입하기</button>
						      </div>
						    </div>
						  </div>
						</div>
						</form>
					</div><!-- 그룹 모집글 영역 end -->
									
				<div class="search_div">
					<div class="category_search">
						<select>
							<option>번호</option>
							<option>제목</option>
							<option>작성자</option>
						</select> 
						<input type="text" class="search_input">
						<button type="button" class="search_btn">Search</button>
					</div>
				</div>
				<c:choose>
				<c:when test="${urlparam == 'boardstudygroupnew'}">
					<c:choose>
						<c:when test="${count > 12 }">
							<nav aria-label="Page navigation example paging" class="paging">
							<ul class="pagination">
							<c:if test="${vNum!=1 }">
								<li class="page-item"><a class="page-link" href="boardgroupnew.do?vNum=${vNum-1}">Previous</a></li>
								<li class="page-item"><a class="page-link" href="boardgroupnew.do?vNum=1">&lt;</a></li>
							</c:if>
								<c:forEach var="pageNum" items="${page }">
									<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"></c:if>
									href="boardgroupnew.do?vNum=${pageNum }">					
									${pageNum }
									</a></li>
								</c:forEach>
								<c:if test="${vNum!=lastNum }">
									<li class="page-item"><a class="page-link" href="boardgroupnew.do?vNum=${lastNum}">&gt;</a></li>
									<li class="page-item"><a class="page-link" href="boardgroupnew.do?vNum=${vNum+1 }">Next</a></li>
								</c:if>
							</ul>
							</nav>
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
				<c:choose>
					<c:when test="${count > 12 }">
						<nav aria-label="Page navigation example paging" class="paging">
						<ul class="pagination">
						<c:if test="${vNum!=1 }">
							<li class="page-item"><a class="page-link" href="boardgrouplist.do?vNum=${vNum-1 }">Previous</a></li>
							<li class="page-item"><a class="page-link" href="boardgrouplist.do?vNum=1">&lt;</a></li>
						</c:if>
							<c:forEach var="pageNum" items="${page }">
								<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"></c:if>
								href="boardgrouplist.do?vNum=${pageNum }">					
								${pageNum }
								</a></li>
							</c:forEach>
							<c:if test="${vNum!=lastNum }">
								<li class="page-item"><a class="page-link" href="boardgrouplist.do?vNum=${lastNum}">&gt;</a></li>
								<li class="page-item"><a class="page-link" href="boardgrouplist.do?vNum=${vNum+1 }">Next</a></li>
							</c:if>
						</ul>
						</nav>
					</c:when>
					<c:otherwise>
					
					</c:otherwise>
				</c:choose>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
		</div>
	</section>
	
	<footer>
		<c:import url="/Footer.jsp"></c:import>
	</footer>

</body>
</html>