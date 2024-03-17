<%@page import="com.study.mvc.model.GuestDTO"%>
<%@page import="com.study.mvc.model.HostDTO"%>
<%@page import="com.study.mvc.model.AdminDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 관리자 세션 받아오기
	AdminDTO admin = (AdminDTO) session.getAttribute("admin");
	String adCode = (String)session.getAttribute("adCode");
	 
	// 게스트 세션 받아오기
	GuestDTO guest = (GuestDTO) session.getAttribute("guest");
	String guCode = (String)session.getAttribute("guCode");

	// 호스트 세션 받아오기
	HostDTO host = (HostDTO) session.getAttribute("host");
	String hoCode = (String)session.getAttribute("hoCode");
	
	// grCode 받아오기
	String grCode = request.getParameter("gr_code"); 
%>

<div class="sideMenu-area">
	<div class ="sideMenu-content">
	
		<!-- 그룹 페이지 진입 -->
		<% if(guCode != null && grCode != null) 
		{%>
		<div class="profile-area">
			<div class="card-area">
				<div class="image-area">
					<img src="images/woman.png" class="image-file">
				</div>
				<div class="text-area">
					<p><span class="name">그룹이지롱 님</span><br>
					<span class="nickname"><%=guest.getGuNick() %></span></p>
				</div>
			</div>
		</div>
		
		<ul class="list-unstyled ps-0">
      		<li class="mb-1">
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu"
        		 onclick="location.href='grouppagemain.do?gu_code=<%=guCode%>&gr_code=<%=grCode%>'">
          			<span class="menu_item">그룹 페이지</span>
        		</button>
      		</li> 
      		<li class="mb-1">
       			<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu"
       			 onclick="location.href='groupreservelist.do?gu_code=<%=guCode%>&gr_code=<%=grCode%>'">
         				<span class="menu_item">예약 내역</span>
       			</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu"
        		 onclick="location.href='grouppenaltylist.do?gu_code=<%=guCode%>&gr_code=<%=grCode%>'">
          			<span class="menu_item">패널티 내역</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu"
        		 onclick="location.href='groupmemberlist.do?gu_code=<%=guCode%>&gr_code=<%=grCode%>'">
          			<span class="menu_item">카페 예약</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu"
        		 onclick="location.hreg='groupmeetlist.do?gu_code=<%=guCode%>&gr_code=<%=grCode%>'">
          			<span class="menu_item">그룹원 관리</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu"
        		 onclick="location.href='#'">
          			<span class="menu_item">모임 관리</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu"
        		 onclick="locaton.href='#'">
          			<span class="menu_item">그룹 캘린더</span>
        		</button>
      		</li><li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu"
        		 onclick="locaton.href='groupboardlist.do?gu_code=<%=guCode%>&gr_code=<%=grCode%>'">
          			<span class="menu_item">그룹 게시판</span>
        		</button>
      		</li>
      	</ul>
		
		<!-- 게스트 로그인 -->
		<%} 
		else if(guCode != null && grCode == null)		
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
            			<li><a href="guestgroupactivelist.do?guCode=<%=guCode %>" class="link-body-emphasis d-inline-flex text-decoration-none rounded">
            				<span class="subMenu_item">활동중인 그룹</span></a></li>
            			<li><a href="guestgroupopenlist.do?guCode=<%=guCode %>" class="link-body-emphasis d-inline-flex text-decoration-none rounded">
            				<span class="subMenu_item">개설 내역</span></a></li>
            			<li><a href="guestgroupjoinlist.do?guCode=<%=guCode %>" class="link-body-emphasis d-inline-flex text-decoration-none rounded">
            				<span class="subMenu_item">가입 내역</span></a></li>
          			</ul>
        		</div>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" data-bs-toggle="collapse" data-bs-target="#board-collapse" aria-expanded="false">
          			<span class="menu_item">게시글 관리</span>
        		</button>
        		<div class="collapse" id="board-collapse">
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small sub_title">
            			<li><a href="guestboardlist.do?guCode=<%=guCode %>" class="link-body-emphasis d-inline-flex text-decoration-none rounded">
            				<span class="subMenu_item">작성 글</span></a>
          				</li>
            			<li><a href="guestreplylist.do?guCode=<%=guCode %>" class="link-body-emphasis d-inline-flex text-decoration-none rounded">
            				<span class="subMenu_item">작성 댓글</span></a></li>
            			<li><a href="guestscraplist.do?guCode=<%=guCode %>" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">스크랩</span></a></li>
          			</ul>
        		</div>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu"
        		 onclick="location.href='guestredlist.do?type=board&guCode=<%=guCode %>'">
          			<span class="menu_item">신고 내역 관리</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu"
        		 onclick="location.href='guestpenaltylist.do?guCode=<%=guCode %>'" >
          			<span class="menu_item">패널티 관리</span>
        		</button>
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
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" onclick="location.href='hostmypage.do'">
          			<span class="menu_item">마이페이지</span>
        		</button>
      		</li> 
      		<li class="mb-1">
       			<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
         				<span class="menu_item" onclick="location.href='cafelist.do?hoCode=<%=host.getHoCode()%>'">스터디카페 관리</span>
       			</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
          			<span class="menu_item" onclick="location.href='cafereservelist.do?hoCode=<%=host.getHoCode()%>'">예약 관리</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
          			<span class="menu_item" onclick="location.href='cafereviewlist.do?hoCode=<%=host.getHoCode()%>'">리뷰 확인</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
          			<span class="menu_item" onclick="location.href='hostredlist.do?hoCode=<%=host.getHoCode()%>'">신고 관리</span>
        		</button>
      		</li>
      		<li class="mb-1">   
              <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
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
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" data-bs-toggle="collapse" 
        		data-bs-target="#myPage-collapse" aria-expanded="false" onclick="location.href='adminadminlist.do'">
          			<span class="menu_item">관리자 계정 관리</span>
        		</button>
      		</li> 
      		<li class="mb-1">
       			<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#member-collapse" aria-expanded="false">
         				<span class="menu_item">회원 리스트</span>
       			</button>
        		<div class="collapse" id="member-collapse">
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            			<li><a href="adminguestlist.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded sub_menu"><span class="subMenu_item">게스트 회원</span></a></li>
            			<li><a href="adminhostlist.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded sub_menu"><span class="subMenu_item">호스트 회원</span></a></li>
          			</ul>
        		</div>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse"
        		 data-bs-target="#friend-collapse" aria-expanded="false" onclick="location.href='adminstudycafelist.do'">
          			<span class="menu_item">스터디카페 관리</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" 
        		data-bs-target="#group-collapse" aria-expanded="false" onclick="location.href='adminstudygrouplist.do'">
          			<span class="menu_item">스터디그룹 확인</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse"
        		 data-bs-target="#notice-collapse" aria-expanded="false" onclick="location.href='adminnoticelist.do'">
          			<span class="menu_item">공지사항 관리</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#redCard-collapse" aria-expanded="false">
          			<span class="menu_item">신고 관리</span>
        		</button>
        		<div class="collapse" id="redCard-collapse">
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            			<li><a href="adminreporthostlist.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded sub_menu"><span class="subMenu_item">호스트 신고</span></a></li>
            			<li><a href="adminreportallbbslist.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded sub_menu"><span class="subMenu_item">커뮤니티 신고</span></a></li>
            			<li><a href="adminreportgroupbbslist.do" class="link-body-emphasis d-inline-flex text-decoration-none rounded sub_menu"><span class="subMenu_item">그룹 게시물 신고</span></a></li>
          			</ul>
        		</div>
      		</li>
      	</ul>
      	<% }%>
   	</div>
</div>
