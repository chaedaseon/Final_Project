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
<title>Reservation.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestMainStyle.css">
<link rel="stylesheet" type="text/css" href="css/form.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body>
	<header>
		<jsp:include page="/Menu.jsp" />
	</header>
	
	<section>
		<div id="content">
		<jsp:include page="/SideMenu.jsp" /> <!-- col-2 적용되어 있음 -->
			
		<div class="rightContent_div">
    		<div class="input-form-backgroud row">
      			<div class="input-form mx-auto">
        			<h4 class="mb-3">스터디카페 예약을 위한 정보 입력</h4>
        				<form class="validation-form" novalidate>
          					<div class="row">
					            <div class="col-md-12 mb-3">
					              <label for="name">그룹명</label>
					              <input type="text" class="form-control" id="name" placeholder="" value="" required="required">
					              <div class="invalid-feedback">
					                그룹명을 입력해주세요.
					              </div>
					            </div>
          					</div>
		   					<div class="row">
						        <div class="col-md-12 mb-3">
						           <label for="email">예약날짜</label>
						           <input type="tel" class="form-control" id="tel" placeholder="" required="required">
						           <div class="invalid-feedback">
						             예약날짜를 입력해주세요.
						           </div>
						        </div>
          					</div>          
		   					<div class="row">
					            <div class="col-md-6 mb-3">
					          	   <label for="email">이용 시작시간</label>            
					               <select class="custom-select d-block w-100">
					               		<option>08:00</option>
					            		<option>09:00</option>
					            		<option>10:00</option>
					            		<option>11:00</option>
					            		<option>12:00</option>
					            	</select>
					            <div class="invalid-feedback">
					              이용시간을 입력해주세요.
					            </div>
					        </div>
				            <div class="col-md-6 mb-3">
				            	<label for="address">이용 종료시간</label>
				            	<select class="custom-select d-block w-100">
				            		<option>17:00</option>
				            		<option>18:00</option>
				            		<option>19:00</option>
				            		<option>20:00</option>
				            		<option>21:00</option>
				            	</select>
				            <div class="invalid-feedback">
				              이용시간을 입력해주세요.
				            </div>
				          </div>
				          <div class="col-md-12 mb-3">
				              <label for="name">인원수</label>
				              <input type="text" class="form-control" id="count" placeholder="" value="" required="required">
				              <div class="invalid-feedback">
				                인원수를 입력해주세요.
				              </div>
				          </div>
          			</div>
          

		          <div class="mb-4"></div>
		          <button class="btn btn-lg btn-block" type="submit" style="background: #ddedb7;">등록</button>
		        </form>
		      </div>
		    </div>
    
		    <footer class="my-3 text-center text-small">
		      <p class="mb-1">&copy; 2024 STUDY WITH HOUR</p>
		    </footer>
		  </div>
		  </div>
  </section>
</body>
</html>