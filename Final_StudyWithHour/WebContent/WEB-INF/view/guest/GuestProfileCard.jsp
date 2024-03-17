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
<title>GuestProfileCard.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">

table.groupProfile_list
{
	width: 50%;
	margin: 0 auto;
	text-align: center;
}

table.groupProfile_list td
{
	font-size: 18px;
	height: 45px;
}

</style>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
			
			<div class="rightContent_div">
				<!-- <div class="page_title">
					<span><span>superman 님</span> 프로필</span>
				</div> -->
				
				<div style="margin: 0 auto; width: 800px;">
					<div style="width: 100%; height: 140px; background: #94be2424; margin-top: 10px;">
						<div style="position: relative;">
							<div style="display: flex; justify-content: center;">
								<img src="images/woman.png" class="image-file" style="width: 150px; height: 150px; border: 3px solid #94be2c; background: #fff; border-radius: 100px; margin: 60px 0 0 30px;">
							</div>
							<div style="display: flex; flex-direction: column; align-content: center; flex-wrap: wrap;">
								<h3 style="margin: 10px 0 0 30px;">superman</h3>
								<h5 style="margin: 5px 0 0 40px;">슈퍼맨이지롱</h5>
								<div style="display: flex; justify-content: flex-end;">
									<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#friendAdd">찜❤️</button>
									<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#notfriendAdd" style="margin-left:5px;">차단🔕</button>
								</div>
								<div style="margin-left: 20px;">
									<span style="border-radius: 30px; background: #94be247d; display: flex; justify-content: center;">
										찜한 이웃 5
									</span>
								</div>
							</div>
						</div>
						
	<!-- 스터디룸 수정 모달 영역 ------------------------------------------------------------------------->
    <div class="modal fade" id="friendAdd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="friendAddLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
         <h1 class="modal-title fs-5" id="friendAddLabel">계정 찜</h1>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body" style="text-align: center; display: flex; justify-content: space-evenly;">
          <input type="hidden" name="deleteCode" value="${rm.srCode }">
          	<span>superman 님 계정을 찜하시겠습니까?</span>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
            <button type="button" class="btn btn-primary" onclick="location.href='caferoomdelete.do?scCode=${cafe.scCode}&srCode=${rm.srCode }'">Yes</button>
          </div>
        </div>
      </div>
    </div>
    
	<!-- 스터디룸 비활성화 모달 영역 -------------------------------------------------------->
    <div class="modal fade" id="notfriendAdd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="notfriendAddLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
         <h1 class="modal-title fs-5" id="notfriendAddLabel">계정 차단</h1>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body" style="text-align: center; display: flex; justify-content: space-evenly;">
          <input type="hidden" name="deleteCode" value="${rm.srCode }">
          	<span>superman 님 계정을 차단하시겠습니까?</span>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
            <button type="button" class="btn btn-primary" onclick="location.href='caferoomdelete.do?scCode=${cafe.scCode}&srCode=${rm.srCode }'">Yes</button>
          </div>
        </div>
      </div>
    </div>
						
						<hr>
						
						<div style="display: flex; justify-content: center;">
							<table class="groupProfile_list"">
								<tr>
									<td>가입일자</td>
									<td>2024-01-14</td>
								</tr>	
								<tr>
									<td>카테고리</td>
									<td>자격증</td>
								</tr>	
								<tr>
									<td>성별</td>
									<td>여자</td>
								</tr>	
								<tr>
									<td>나이</td>
									<td>23</td>
								</tr>	
							</table>
						</div>
						<hr>
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