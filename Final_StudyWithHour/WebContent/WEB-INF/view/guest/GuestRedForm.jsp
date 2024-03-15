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
<title>GuestRedForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/reportStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	
	<section>
		<div id="content">
			<div class="content_div">
			<div class="sub_title_div">
				<span class="sub_title">🚨신고하기🚨</span>
				<div class="content_box">
					
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">작성자 : 게스트1234</label>
						<label for="exampleFormControlInput1" class="form-label">제목 : 亼팸홍보7ㅔㅅ1물입L1ㄷㅏ❣</label>
						<label for="exampleFormControlInput1" class="form-label" id="reason">신고 사유를 선택하세요</label>
					</div>
					
					<input type="radio" class="btn-check" name="options" id="option1" autocomplete="off">
					<label class="btn btn-secondary" for="option1">스팸/홍보 도배글입니다.</label><br>
					<input type="radio" class="btn-check" name="options" id="option2" autocomplete="off">
					<label class="btn btn-secondary" for="option2">음란물입니다.</label><br>
					<input type="radio" class="btn-check" name="options" id="option3" autocomplete="off">
					<label class="btn btn-secondary" for="option3">불법정보를 포함하고 있습니다.</label><br>
					<input type="radio" class="btn-check" name="options" id="option4" autocomplete="off">
					<label class="btn btn-secondary" for="option4">청소년에게 유해한 내용입니다.</label><br>
					<input type="radio" class="btn-check" name="options" id="option5" autocomplete="off">
					<label class="btn btn-secondary" for="option5">욕설/생명경시/혐오/차별적 표현을 포함하고 있습니다.</label><br>
					<input type="radio" class="btn-check" name="options" id="option6" autocomplete="off">
					<label class="btn btn-secondary" for="option6">개인정보 노출 게시물입니다.</label><br>
					<input type="radio" class="btn-check" name="options" id="option7" autocomplete="off">
					<label class="btn btn-secondary" for="option7">불쾌한 표현을 포함하고 있습니다.</label><br>
					<input type="radio" class="btn-check" name="options" id="option8" autocomplete="off">
					<label class="btn btn-secondary" for="option8">카테고리와 맞지 않는 게시물입니다.</label><br>
					<input type="radio" class="btn-check" name="options" id="option9" autocomplete="off">
					<label class="btn btn-secondary" for="option9">만남 유도성 개시물입니다.</label><br>
					
					<div>
					<button onclick="history.back()" class="btn btn-secondary" id="backBtn">취소</button>
					<button type="submit" class="btn btn-secondary" id="submitBtn">신고하기</button>
					</div>
					<div class="warning_msg">
						<label for="exampleFormControlInput1">
						※주의※<br> 
						해당 게시물에 이상이 없거나<br>
						 해당 사유와 연관이 없을 경우<br>
						 신고자에게 패널티가 돌아갈 수 있습니다!</label>
					</div>
				</div>
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>