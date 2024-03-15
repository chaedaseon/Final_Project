<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String gr_code = request.getParameter("grCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 - 메인</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/groupPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
//이전 버튼
function fn_prev(currPageNo, range, pageSize) 
{

	var currPageNo = (range - 1) * pageSize;
	var range = range - 1;

	var url = "groupticketlist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	location.href = url;

}

//페이지 번호 클릭

function fn_pagination(currPageNo, range) 
{

	var url = "groupticketlist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	location.href = url;	

}
//다음 버튼 이벤트
function fn_next(currPageNo, range, pageSize) 
{

	var currPageNo = (range * pageSize) + 1;
	var range = parseInt(range) + 1;	

	var url = "groupticketlist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
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
				<div class="content_div">
				
					<div class="page_title">
					<span><span>그룹 메인</span> 페이지</span>
					</div>
				
					<div class="sorting_div">

					</div>
				
				<div class="col-12 gap-3 " >
					<div class="group-main ">
						<div class="col-8 card group-main-calendar" >
						
							<div class="card-header bg-transparent">그룹 캘린더<span class="d-day">+</span></div>
			  					<div class="card-body">
									
									캘린더 영역
									
		  						</div>
						</div>
						<div class="col-4">
							<div class="card" >
								<div class="card-header bg-transparent">D-DAY<span class="d-day">+</span></div>
				  					<div class="card-body">
										일정 이름... <br>
										<div class="gsch-dday">
											d-11
										</div>
									
			  						</div>
							</div>
							<div class="card" >
								<div class="card-header bg-transparent">그룹원<span class="d-day">+</span></div>
				  					<div class="card-body">
										<div class="row">
											<div class="col-4">누구누구1</div>
											<div class="col-4">누구누구2</div>
											<div class="col-4">누구누구3</div>
											<div class="col-4">누구누구4</div>
											<div class="col-4">누구누구5</div>
											<div class="col-4">누구누구6</div>
										</div>
				  					</div>
							</div>
						</div>
				
				</div>
				
				<div class="col-12 " >
					<div class="group-main ">
						<div class="col-8 " >
						
							<div class="card">
								<div class="card-header bg-transparent">최근 게시물<span class="d-day">+</span></div>
				  					<div class="card-body">
				    				<!-- <h5 class="card-title">Light card title</h5> -->
				    					<p class="card-text">토익 800점 이상을 목표하시는 분들 함께해요! 홍대에서 주 2일 만나서 스터디 예정입니다.</p>
				    					<p class="card-text">토익 800점 이상을 목표하시는 분들 함께해요! 홍대에서 주 2일 만나서 스터디 예정입니다.</p>
				    					<p class="card-text">토익 800점 이상을 목표하시는 분들 함께해요! 홍대에서 주 2일 만나서 스터디 예정입니다.</p>
				    					<p class="card-text">토익 800점 이상을 목표하시는 분들 함께해요! 홍대에서 주 2일 만나서 스터디 예정입니다.</p>
				  					</div>
							</div>
						</div>
				
						<div class="col-4 " >
							
							<div class="card">
								<div class="card-header bg-transparent">알림<span class="d-day"></span></div>
			  					<div class="card-body">
			    					<p class="card-text">00가입</p>
			    					<p class="card-text">그룹장 변경(0000님)</p>
			    					<p class="card-text">그룹장 변경(0000님)</p>
			    					<p class="card-text">그룹장 변경(0000님)</p>
			  					</div>
							</div>
						</div>
				</div>
				
				<div class="col-12 " >
					<div class="group-main ">
						<div class="col-11"> &nbsp;</div>
						<div class="col-1 " >
							<button type="button" class="btn notice_btn" data-bs-toggle="modal" data-bs-target="#ReportProcess" >
								탈퇴
	                	  	</button>	
						</div>
					</div>
				</div>
				
				
               	<!-- 그룹 탈퇴 모달 영역 -->
                  <div class="modal fade  " id="ReportProcess" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h1 class="modal-title fs-5" id="staticBackdropLabel">그룹 탈퇴</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                        
                    	정말 탈퇴하시겠습니까? <br> 탈퇴한 그룹은 다시 가입할 수 없습니다. 
                          
                        </div>
                        <div class="modal-footer sorting_div">
                        <form id="allBBSReportProcess"  action="adminreportallbbsprocess.do" method="post">
                          <button type="button" class="btn " data-bs-dismiss="modal">No</button>
                          <input type="text" style="display: none;" id="code" name="code" value="${guCode }">

                          <button type="button" class="btn notice_btn" id="processBtn" onclick="process()">Yes</button>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div><!-- 그룹 탈퇴 모달 끝 -->							
				
				
				</div>
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