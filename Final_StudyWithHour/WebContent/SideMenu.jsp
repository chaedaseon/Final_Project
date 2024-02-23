<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<div class="sideMenu-area">
	<div class ="sideMenu-content">
		<div class="profile-area">
			<div class="card-area">
				<div class="image-area">
					<img src="images/woman.png" class="image-file">
				</div>
				<div class="text-area">
					<p><span class="name">홍길동</span><br>
					<span class="nickname">동그리동동</span></p>
				</div>
			</div>
		</div>
		
		
		<!-- 게스트 로그인 -->
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
       			<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu">
         				<span class="menu_item">마이캘린더</span>
       			</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" data-bs-toggle="collapse" data-bs-target="#friend-collapse" aria-expanded="false">
          			<span class="menu_item">이웃관리</span>
        		</button>
        		<div class="collapse" id="friend-collapse">
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">찜 계정</span></a></li>
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">차단 계정</span></a></li>
          			</ul>
        		</div>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" data-bs-toggle="collapse" data-bs-target="#group-collapse" aria-expanded="false">
          			<span class="menu_item">스터디그룹 관리</span>
        		</button>
        		<div class="collapse" id="group-collapse">
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">가입내역</span></a></li>
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">즐겨찾기</span></a></li>
          			</ul>
        		</div>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed btn_menu" data-bs-toggle="collapse" data-bs-target="#redCard-collapse" aria-expanded="false">
          			<span class="menu_item">신고 관리</span>
        		</button>
        		<div class="collapse" id="redCard-collapse">
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
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
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">개인 패널티</span></a></li>
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">그룹 패널티</span></a></li>
          			</ul>
        		</div>
      		</li>
      	</ul>
      	
      	
      	
      	<!-- 호스트 로그인 -->
      	<!-- 
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
         				<span class="menu_item">스터디카페 관리</span>
       			</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#friend-collapse" aria-expanded="false">
          			<span class="menu_item">예약 관리</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#group-collapse" aria-expanded="false">
          			<span class="menu_item">리뷰 확인</span>
        		</button>
      		</li>
      		<li class="mb-1">	
        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#redCard-collapse" aria-expanded="false">
          			<span class="menu_item">신고 관리</span>
        		</button>
        		<div class="collapse" id="redCard-collapse">
          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">신고 접수 내역</span></a></li>
            			<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><span class="subMenu_item">신고 당한 내역</span></a></li>
          			</ul>
        		</div>
      		</li>
      	</ul>
      	 -->
      	
      	
   	</div>
	
	

</div>
