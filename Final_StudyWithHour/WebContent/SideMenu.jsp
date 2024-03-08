<%@page import="com.test.mvc.AdminDAO"%>
<%@page import="com.test.mvc.AdminDTO"%>
<%@page import="com.test.mvc.HostDTO"%>
<%@page import="com.test.mvc.HostDAO"%>
<%@page import="com.test.mvc.GuestDAO"%>
<%@page import="com.test.mvc.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 관리자 세션 받아오기
	String adCode = (String)session.getAttribute("adCode");
	AdminDAO adminDao = new AdminDAO();
	adminDao.connection();
	AdminDTO admin = adminDao.sessionAdmin(adCode);
	
	// 게스트 세션 받아오기
	String guCode = (String)session.getAttribute("guCode");
	GuestDAO guestDao = new GuestDAO();
	guestDao.connection();
	GuestDTO guest = guestDao.sessionGuest(guCode);
	
	// 호스트 세션 받아오기
	String hoCode = (String)session.getAttribute("hoCode");
	HostDAO hostDao = new HostDAO();
	hostDao.connection();
	HostDTO host = hostDao.sessionHost(hoCode);
	
%>
<script>



</script>

<div class="sideMenu-area">
	<div class ="sideMenu-content">
		<!-- 게스트 로그인 -->
		<% if(guCode != null)
		{%>
		
		<div class="profile-area">
			<div class="card-area">
				<div class="image-area">
					<img src="images/woman.png" class="image-file">
				</div>
				<div class="text-area">
					<p><span class="name"><%=guest.getGuName() %> 님</span><br>
					<span class="nickname"><%=guest.getGuNick() %></span></p>
				</div>
			</div>
		</div>
		
    	<ul class="list-unstyled ps-0">
      		<li class="mb-1">
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" onclick="location.href='guestmypage.do'">
          			<span class="menu_item">마이페이지</span>
        		</button>
      		</li> 
      		<li class="mb-1">
       			<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" onclick="location.href='guestcalendarlist.do?gu_code=<%=guCode%>'">
         				<span class="menu_item">마이캘린더</span>
       			</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" onclick="location.href='friendlist.do?guCode=<%=guCode%>'">
          			<span class="menu_item">이웃관리</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" data-bs-toggle="collapse" data-bs-target="#group-collapse" aria-expanded="false">
          			<span class="menu_item">스터디그룹 관리</span>
        		</button>
        		<div class="collapse" id="group-collapse">
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small sub_title">
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">가입내역</span></a></li>
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">즐겨찾기</span></a></li>
          			</ul>
        		</div>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" data-bs-toggle="collapse" data-bs-target="#board-collapse" aria-expanded="false">
          			<span class="menu_item">게시글 관리</span>
        		</button>
        		<div class="collapse" id="board-collapse">
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small sub_title">
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">작성 글</span></a></li>
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">작성 댓글</span></a></li>
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">스크랩</span></a></li>
          			</ul>
        		</div>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" data-bs-toggle="collapse" data-bs-target="#redCard-collapse" aria-expanded="false">
          			<span class="menu_item">신고 관리</span>
        		</button>
        		<div class="collapse" id="redCard-collapse">
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small sub_title">
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">신고 접수 내역</span></a></li>
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">신고 당한 내역</span></a></li>
          			</ul>
        		</div>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" data-bs-toggle="collapse" data-bs-target="#panelty-collapse" aria-expanded="false">
          			<span class="menu_item">패널티 관리</span>
        		</button>
        		<div class="collapse" id="panelty-collapse">
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small sub_title">
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">개인 패널티</span></a></li>
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">그룹 패널티</span></a></li>
          			</ul>
        		</div>
      		</li>
      	</ul>
      	
      	
      	<%}
		/* 호스트 로그인한 경우 */
     	else if (hoCode != null)	
     	{ %>
     	
     	<div class="profile-area">
			<div class="card-area">
				<div class="image-area">
					<img src="images/woman.png" class="image-file">
				</div>
				<div class="text-area">
					<p><span class="name"><%=host.getHoName() %> 님</span><br>
				</div>
			</div>
		</div>
     	
    	<ul class="list-unstyled ps-0">
      		<li class="mb-1">
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" data-bs-toggle="collapse" data-bs-target="#myPage-collapse" aria-expanded="false">
          			<span class="menu_item">마이페이지</span>
        		</button>
        		<div class="collapse" id="myPage-collapse">
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded sub_menu"><span class="subMenu_item">정보수정</span></a></li>
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded sub_menu"><span class="subMenu_item">회원탈퇴</span></a></li>
          			</ul>
        		</div>
      		</li> 
      		<li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
                     <span class="menu_item" onclick="location.href='cafelist.do?hoCode=<%=host.getHoCode()%>'">스터디카페 관리</span>
                </button>
            </li>
            <li class="mb-1">   
              <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#friend-collapse" aria-expanded="false">
                   <span class="menu_item" onclick="location.href='cafereservelist.do?hoCode=<%=host.getHoCode()%>'">예약 관리</span>
              </button>
            </li>
            <li class="mb-1">   
              <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#group-collapse" aria-expanded="false">
                   <span class="menu_item" onclick="location.href='cafereviewlist.do?hoCode=<%=host.getHoCode()%>'">리뷰 확인</span>
              </button>
            </li>
            <li class="mb-1">   
              <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#redCard-collapse" aria-expanded="false">
                   <span class="menu_item" onclick="location.href='hostredlist.do?hoCode=<%=host.getHoCode()%>'">신고 관리</span>
              </button>
            </li>
            <li class="mb-1">   
              <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#redCard-collapse" aria-expanded="false">
                   <span class="menu_item" onclick="location.href='hoststatuslist.do?hoCode=<%=host.getHoCode()%>'">통계 관리</span>
              </button>
            </li>
      	</ul>
      	<%}
		
		/* 관리자 로그인한 경우 */
     	else if (adCode != null)	
     	{%>
     	<div class="profile-area">
			<div class="card-area">
				<div class="image-area">
					<img src="images/woman.png" class="image-file">
				</div>
				<div class="text-area">
					<p><span class="name"><%=admin.getAdNick() %> 님</span><br>
				</div>
			</div>
		</div>
     	
    	<ul class="list-unstyled ps-0">
      		<li class="mb-1">
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" data-bs-toggle="collapse" data-bs-target="#myPage-collapse" aria-expanded="false">
          			<span class="menu_item">관리자 계정 관리</span>
        		</button>
      		</li> 
      		<li class="mb-1">
       			<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
         				<span class="menu_item">회원 리스트</span>
       			</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#friend-collapse" aria-expanded="false">
          			<span class="menu_item">스터디카페 관리</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#group-collapse" aria-expanded="false">
          			<span class="menu_item">스터디그룹 확인</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#notice-collapse" aria-expanded="false">
          			<span class="menu_item">공지사항 관리</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#redCard-collapse" aria-expanded="false">
          			<span class="menu_item">신고 관리</span>
        		</button>
      		</li>
      	</ul>
      	<% }%>
   	</div>
</div>
