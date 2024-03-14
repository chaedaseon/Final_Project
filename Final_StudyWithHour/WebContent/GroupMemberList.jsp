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
<title>GroupMemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/groupPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
/* 
	// '-' 를 눌러 인원을 줄일 경우
	function delCount()
	{
		var member = document.getElementById("addMem").innerText;
		if (member > 0)
			document.getElementById("addMem").innerHTML = parseInt(member) - 1;
		//alert(member);
	}
	
	// '+' 를 눌러 인원을 늘릴 경우
	function addCount()
	{
		var member = document.getElementById("addMem").innerText;
		if (member < ${addMemberCount})
			document.getElementById("addMem").innerHTML = parseInt(member) + 1;
	}
 */	
	function sendIt()
	{
	 	var form = document.getElementById("addMemberForm");
		form.submit();
	}
	

</script>
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
				<span><span>그룹원</span> 정보 (${memberCount }명)</span>
			</div>
			
			<!-- 그룹원정보 영역 ---------------------------------------------------------------------------->
			<div class="mb-4"></div>
			<div class="content_div" style="display: inline-flex; flex-direction: row; flex-wrap: wrap;">
			<c:forEach var="member" items="${member }">
				<div class="col-3" style="margin: 0 35px"> 
					<div style="border: 3px solid #94be2c85; border-radius: 10px; text-align: center; margin-bottom: 20px;">
					<%-- 그룹원정보 클릭 시 해당 그룹원 프로필카드로 이동 --%>
					<a href="#">
					<div style="display: grid; justify-items: center;">
						<div class="image-area">
							<img src="images/woman.png" class="image-file" style="width: 150px; height: 150px;">
						</div>
						<div style="margin-top: 10px;"></div>
						<div style="border-radius: 10px; background-color: #5b5b5bbd; color: #fff; font-weightbold; width: 100px;">
							<c:choose>
							<c:when test="${member.ld_state eq '그룹장' }">
								👑${member.ld_state }
							</c:when>
							<c:otherwise>
								${member.ld_state }
							</c:otherwise>
							</c:choose>
						</div>						
						<div style="margin-top: 10px;"></div>
						<div style=" display: flex; align-items: center;">
							<p>
								<span>${member.gu_name } [${member.gu_nick }]</span><br>
								<span>${member.gender }/${member.age }</span><br>
								<span>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search-heart" viewBox="0 0 16 16">
									  <path d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018"/>
									  <path d="M13 6.5a6.47 6.47 0 0 1-1.258 3.844q.06.044.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11"/>
									</svg>
									${member.category_list }
								</span><br>
								<span>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
									  <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
									  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
									</svg>
									${fn:substring(member.gj_date,0,11) }
								</span><br>
							</p>
						</div>
					</div>
					</a>
					</div>			
				</div>
			</c:forEach>
		</div>
			<c:choose>
			<c:when test="${addMemberCount != 0 }">
				<a href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				<div style="border: 3px solid #94be2c85; border-radius: 10px; height: 60px; width: 80%; text-align: center; margin-left: 83px; padding: 15px;">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#94be2c" class="bi bi-plus-lg" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2"/>
					</svg>
				</div>
				</a>
			</c:when>
			<c:otherwise>
				<div style="text-align: center; height: 60px; width: 80%; margin-left: 83px; padding: 15px;">
					<h4>해당 그룹은 정원 마감으로 인해 추가 모집이 불가합니다.</h4>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div>				
	

 <!-- 그룹원 추가모집 모달 영역 ------------------------------------------------------------------------------>
 <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content">
       <div class="modal-header">
         <h1 class="modal-title fs-5" id="staticBackdropLabel">그룹원 추가모집</h1>
         	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		       </div>
				<div style="height: 100px; display: flex; align-items: center; justify-content: space-around; flex-direction: column;">
		        <div>
		        	그룹원을 추가모집 하시겠습니까?
		        </div>
	       		<div>
			  	<form action="groupmemberinsert.do?gr_code=1" method="post" id="addMemberForm">
		       		<label><input type="radio" name="period_code" value="1" style="font-size: 20px;">상시모집</label>
		       		<label><input type="radio" name="period_code" value="2" style="font-size: 20px;">기간모집</label>
			    </form>
	       		</div>
		       	</div>
		       <div class="modal-footer">
         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
         <button type="button" class="btn btn-primary" onclick="sendIt()">Yes</button>
       </div>
     </div>
   </div>
 </div>
 
 
	</section>
	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>

</body>
</html>


