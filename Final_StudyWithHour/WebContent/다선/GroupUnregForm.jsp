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
<title>GroupUnregForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/form.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<header>
		<jsp:include page="/Menu.jsp" />
	</header>
	
	<section>
		<div id="content">
			<jsp:include page="/SideMenu.jsp" /> <!-- col-2 적용되어 있음 -->
			
			<div class="rightContent_div">
		  		<div class="container">
		    		<div class="input-form-backgroud row">
		      			<div class="input-form col-md-12 mx-auto">
		        			<h4 class="mb-3">그룹 탈퇴를 위한 정보 입력</h4>
		        				<form class="validation-form" novalidate>
		          					<div class="row">
							            <div class="col-md-12 mb-3">
							              <label for="GroupName">그룹명</label>
							              <input type="text" class="form-control" id="GroupName" placeholder="" value="" required="required">
							              <div class="invalid-feedback">
							                그룹명을 입력해주세요.
							              </div>
							            </div>
		          					</div>
				   					<div class="row">
								        <div class="col-md-12 mb-3">
								           <label for="GroupMember">그룹원</label>
								           <input type="text" class="form-control" id="GroupMember" placeholder="" required="required">
								           <div class="invalid-feedback">
								             그룹원을 입력해주세요.
								           </div>
								        </div>
		          					</div>          
				   					<div class="row">
							            <div class="col-md-12 mb-3">
							          	   <label for="UnregReason">탈퇴 사유</label>            
							               <select class="custom-select d-block w-100" id="UnregReason">
							               		<option>목적 달성</option>
							            		<option>생각했던 활동 내용과 다름</option>
							            		<option>개인사정</option>
							            		<option>패널티누적(강제탈퇴)</option>
							            		<option>다른 그룹을 가입하기 위해서</option>
							            		<option>그룹원과 맞지않음</option>
							            	</select>
							            	<div class="invalid-feedback">
							              		신고사유를 입력해주세요.
							            	</div>
							        	</div>
          							</div> 
          								<div class="mb-4"></div>        
										<div class="mb-4">
										  	<span style="font-weight: bold; color:red;">🔔그룹 탈퇴 후 재가입이 불가합니다.</span>
										</div>
								        <div class="mb-4"></div>
		          					<div>
								        <div style="display: flex; align-items: flex-end;">
								          	<button class="btn btn-block" type="submit" style="background: #ddedb7; width: 300px; margin-right: 5px;">탈퇴</button>
								          	<button class="btn btn-block" type="submit" style="background: #ddedb7; width: 300px; margin-left: 5px;">취소</button>
								        </div>
		          					</div>
		        				</form>
		      				</div>
		    			</div>
    
					    <footer class="my-3 text-center text-small">
					      <p class="mb-1">&copy; 2024 STUDY WITH HOUR</p>
					    </footer>
		  			</div>
		  		</div>
		  </div>
  </section>
</body>
</html>