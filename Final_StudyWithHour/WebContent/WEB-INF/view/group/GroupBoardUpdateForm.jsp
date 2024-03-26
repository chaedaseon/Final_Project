<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String adCode = (String)session.getAttribute("adCode");
	String guCode = (String)session.getAttribute("guCode");
	String hoCode = (String)session.getAttribute("hoCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 게시글 수정 페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/formStyle.css">
<link rel="stylesheet" type="text/css" href="css/boardPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/writeFormStyle.css">
<link rel="stylesheet" type="text/css" href="css/adminPageStyle.css">
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

	function fn_checkByte(obj)
	{
	    const maxByte = 2000; //최대 2000바이트
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
    
    	if(totalByte>maxByte)
    	{
    		alert('최대 2000자 까지만 입력가능합니다.');
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
<script type="text/javascript">
	
	$(document).ready(function()
	{
	    $("#submitBtn").click(function()
	    {
	        //alert("확인");
	 		$("#errCode1").css("display","none");
	 		$("#errCode2").css("display","none");
	        if($("#exampleFormControlInput1").val()=="")
	        {
	            $("#errCode1").html("제목을 입력하세요!");
	            $("#errCode1").css("display","inline");
	            return;                        //--submit 액션 처리 중단
	        }
	        
	        if($("#exampleFormControlTextarea1").val()=="")
	        {
	            $("#errCode2").html("내용을 입력하세요!");
	            $("#errCode2").css("display","inline");
	            return;                        //--submit 액션 처리 중단
	        }
	        // 넘기는 파라미터 값 확인하는 코드
/* 	        const arrayTest = $("#boardInsertForm").serializeArray()
	        var param = {};
			arrayTest.map(function(data,index){
			param[data.name] = data.value;
			if(confirm("파라미터 확인"))
			{
				alert(param[data.name]);
			}
			}) */
			
	        // 폼 submit 액션 처리 수행
	        if(confirm("해당 내용으로 수정하시겠습니까?"))
	        {
				$("#boardInsertForm").submit();
	        }
	 		
	    });
	});
</script>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content" style="display: flex;">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
			<div class="rightContent_div">
				<div id="category">
					</div>
				<div id="form_title">
					<span>그룹 게시글 수정</span>
				</div>
				<div class="sub_title_div">
					<c:forEach var="list" items="${list }">
					<div class="content_box">	<!--boardviewmodify.do  -->
						<form action="groupboardmodify.do?grCode=${param.grCode}&gu_code=${param.gu_code}&gr_code=${param.gr_code}" method="post" id="boardInsertForm">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label" id="title">제목 </label>
							<span id="errCode1" style="display: none; color: red;"></span>
							<input type="text" class="form-control" id="exampleFormControlInput1" name="gbTitle" value="${list.gbTitle}">
						</div>
						
						<div class="mb-3">
							<div id="text_count"><label for="exampleFormControlTextarea1" class="form-label" id="content">내용</label>
							<span><span id="nowByte">0</span>/2000bytes</span></div>
							<span id="errCode2" style="display: none; color: red;"></span>
							<textarea class="form-control" id="exampleFormControlTextarea1"	rows="3" 
							spellcheck="false" onkeyup="fn_checkByte(this)" name="gbContent">${list.gbContent }</textarea>
						</div>
						
						<div class="mb-3">
							<label for="formFile" class="form-label"> 파일 삽입</label>
							<input class="form-control" type="file" id="formFile" name="gbFile" disabled="disabled">
						</div>
						<input type="hidden" id="gbCode" name="gbCode" value="${param.gbCode }"/>
						</form>
						<div class="button_box">
							<button onclick="history.back()" class="btn" id="backBtn">취소</button>
							<button type="submit" class="btn" id="submitBtn">수정하기</button>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>
</body>
</html>