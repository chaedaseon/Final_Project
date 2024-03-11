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
<title>GroupOpenInsertForm.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/formStyle.css">
<link rel="stylesheet" type="text/css" href="css/studyGroupPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/writeFormStyle.css">
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

	function fn_checkByte(obj)
	{
	    const maxByte = 500; //최대 500바이트
	    const text_val = obj.value; //입력한 문자
	    const text_len = text_val.length; //입력한 문자수
	    
	    let totalByte=0;
	    for(let i=0; i<text_len; i++)
	    {
	    	const each_char = text_val.charAt(i);
	        const uni_char = escape(each_char); //유니코드 형식으로 변환
	        if(uni_char.length>4)
	        {
	        	// 한글 : 2Byte
	            totalByte += 2;
	        }else
	        {
	        	// 영문,숫자,특수문자 : 1Byte
	            totalByte += 1;
	    	}
    	}
    
    	if(totalByte>maxByte){
    		alert('최대 500까지만 입력가능합니다.');
        	document.getElementById("nowByte").innerText = totalByte;
            document.getElementById("nowByte").style.color = "red"; // 글자수 넘어가면 카운트 빨간색
        }
    	else
        {
        	document.getElementById("nowByte").innerText = totalByte;
            document.getElementById("nowByte").style.color = "green"; // 글자수 안넘어가면 카운트 초록색
        }
    }
</script>
</head>
<body>
	<header>
		<c:import url="/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div class="content_div">
				<div class="board_title">
					<span><a href="#" style="color: #94bc32;">스터디그룹</a></span>
					<c:import url="/CategoryBar_group.jsp"></c:import>
				</div>
				<div id="form_title">
					<span>그룹 개설 요청서 작성</span>
				</div>
				<div class="sub_title_div">
					<div class="content_box">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">카테고리</label>
							<select name="category" class="category">
								<option value="1">자격증</option>
								<option value="2">취업</option>
								<option value="3">외국어</option>
								<option value="4">면접</option>
								<option value="5">취미</option>
								<option value="6">학업</option>
								<option value="7">자기개발</option>
								<option value="8">기타</option>
							</select>
							<label for="exampleFormControlInput1" class="form-label">연령대</label>
							<select name="category" class="category">
								<option value="1">유사</option>
								<option value="2">무관</option>
								<option value="3">동일</option>
							</select>
							<label for="exampleFormControlInput1" class="form-label">성별</label>
							<select name="category" class="category">
								<option value="1">동일</option>
								<option value="2">무관</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">제목</label>
								<input type="text" class="form-control" id="exampleFormControlInput1" >
						</div>
						
						<div class="mb-3">
							<div id="text_count"><label for="exampleFormControlTextarea1" class="form-label">내용</label><span><span id="nowByte">0</span>/500bytes</span></div>
							<textarea class="form-control" id="exampleFormControlTextarea1"	rows="3" spellcheck="false" onkeyup="fn_checkByte(this)"></textarea>
						</div>
						<div class="mb-3">
							<label for="formFile" class="form-label">파일 삽입</label>
							<input class="form-control" type="file" id="formFile">
						</div>
						
						<div class="button_box">
							<button onclick="history.back()" class="btn" id="backBtn">취소</button>
							<button type="submit" class="btn" id="submitBtn">글올리기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<c:import url="/Footer.jsp"></c:import>
	</footer>
</body>
</html>