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
<title>BoardCommunityUpdateForm.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/formStyle.css">
<link rel="stylesheet" type="text/css" href="css/boardPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/writeFormStyle.css">
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
    		alert('최대 2000Byte까지만 입력가능합니다.');
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
	
	// 게시판 분류 선택 시 자유게시판 or 중고책방 셀렉트 박스 다르게 표시
	$(document).ready(function() 
	{
		$('#board_first').click(function() 
		{
			var result = $('#board_first option:selected').val();
			if (result == '1')
			{
				$('#community_box').show();
				$('#usedBook_box').hide();
				$('#select_community').attr('disabled',false);
				$('#select_usedBook').attr('disabled',true);
			} 
			else if (result == '2')
			{
				$('#usedBook_box').show();
				$('#community_box').hide();
				$('#select_usedBook').attr('disabled',false);
				$('#select_community').attr('disabled',true);
			}
		}); 
	}); 

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
	        /* const arrayTest = $("#boardModifyForm").serializeArray()
	        var param = {};
			arrayTest.map(function(data,index){
			param[data.name] = data.value;
	        alert(param[data.name]);
			}) */
			
	        // 폼 submit 액션 처리 수행
			$("#boardModifyForm").submit();
	 		
	    });
	});
</script>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div class="content_div">
				<div class="board_title">
					<span><a href="boardcommunitylist.do" style="color: #94bc32;">커뮤니티</a></span>
					<c:import url="/WEB-INF/view/board/CategoryBar.jsp"></c:import>
				</div>
				<div id="form_title">
					<span>게시글 수정</span>
				</div>
				<div class="sub_title_div">
					<div class="content_box">	<!--boardviewmodify.do  -->
						<form action="boardviewmodify.do" method="post" id="boardModifyForm">
						<div class="mb-3" id="select_box">
							<div>
							<label for="exampleFormControlInput1" class="form-label">게시판</label>
							<select name="bfCode" name="board_first" id="board_first" class="category">
								<option value="1" selected="selected">커뮤니티</option>
								<option value="2">중고책방</option>
							</select>
							</div>
							<div id="community_box">
							<label for="exampleFormControlInput1" class="form-label">분류</label>
								<select name="bsCode" id="select_community" class="category" disabled="disabled">
									<option value="1">공부팁</option>
									<option value="2">고민상담</option>
									<option value="3">자유게시판</option>
									<option value="4">질문</option>
								</select>
							</div>
							<div id="usedBook_box" style="display: none;">
							<label for="exampleFormControlInput1" class="form-label">분류</label>
								<select id="select_usedBook" class="category" name="bsCode" disabled="disabled">
									<option value="5">삽니다</option>
									<option value="6">팝니다</option>
								</select>
							</div>
						</div>
						<c:forEach var="modify" items="${list }">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label" id="title">제목 </label>
							<span id="errCode1" style="display: none; color: red;"></span>
							<input type="text" class="form-control" id="exampleFormControlInput1" value="${modify.boTitle }" name="boTitle">
						</div>
						
						<div class="mb-3">
							<div id="text_count"><label for="exampleFormControlTextarea1" class="form-label" id="content">내용</label>
							<span><span id="nowByte">0</span>/2000bytes</span></div>
							<span id="errCode2" style="display: none; color: red;"></span>
							<textarea class="form-control" id="exampleFormControlTextarea1"	rows="3" 
							spellcheck="false" onkeyup="fn_checkByte(this)" name="boContent">${modify.boContent }</textarea>
						</div>
						
						<div class="mb-3">
							<label for="formFile" class="form-label"> 파일 삽입</label>
							<input class="form-control" type="file" id="formFile" name="boFile" disabled="disabled">
						</div>
						</c:forEach>
						<input type="text" id="boCode" name="boCode" value="${param.boCode }" style="display: none;"/>
						</form>
						<div class="button_box">
							<button onclick="history.back()" class="btn" id="backBtn">취소</button>
							<button type="submit" class="btn" id="submitBtn">수정하기</button>
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