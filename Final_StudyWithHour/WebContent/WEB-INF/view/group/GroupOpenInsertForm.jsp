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
<title>GroupOpenInsertForm.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/formStyle.css">
<link rel="stylesheet" type="text/css" href="css/studyGroupPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/writeFormStyle.css">
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

	function fn_checkByte(obj)
	{
	    const maxByte = 250; //최대 500바이트
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
    		alert('최대 250까지만 입력가능합니다.');
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
		$('#lfList').click(function() 
		{
			$('#lsList1').hide();
			$("#lsList2").hide();
	 		$("#lsList3").hide();
	 		$("#lsList4").hide();
	 		$("#lsList5").hide();
	 		$("#lsList6").hide();
	 		$("#lsList7").hide();
	 		$("#lsList8").hide();
	 		$("#lsList9").hide();
	 		$("#lsList10").hide();
	 		$("#lsList11").hide();
	 		$("#lsList12").hide();
	 		$("#lsList13").hide();
	 		$("#lsList14").hide();
	 		$("#lsList15").hide();
	 		$("#lsList16").hide();
	 		$("#lsList17").hide();
	 		
			var result = $('#lfList option:selected').val();
			if (result == '1')
			{
				$('#lsList1').show();
				$('#lsList1').attr('disabled',false);
				$("#lsList2").attr('disabled',true);
		 		$("#lsList3").attr('disabled',true);
		 		$("#lsList4").attr('disabled',true);
		 		$("#lsList5").attr('disabled',true);
		 		$("#lsList6").attr('disabled',true);
		 		$("#lsList7").attr('disabled',true);
		 		$("#lsList8").attr('disabled',true);
		 		$("#lsList9").attr('disabled',true);
		 		$("#lsList10").attr('disabled',true);
		 		$("#lsList11").attr('disabled',true);
		 		$("#lsList12").attr('disabled',true);
		 		$("#lsList13").attr('disabled',true);
		 		$("#lsList14").attr('disabled',true);
		 		$("#lsList15").attr('disabled',true);
		 		$("#lsList16").attr('disabled',true);
		 		$("#lsList17").attr('disabled',true);
			} 
			else if (result == '2')
			{
				$('#lsList2').show();
				$('#lsList2').attr('disabled',false);
				$("#lsList1").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '3')
			{
				$('#lsList3').show();
				$('#lsList3').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList1").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '4')
			{
				$('#lsList4').show();
				$('#lsList4').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList1").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '5')
			{
				$('#lsList5').show();
				$('#lsList5').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList1").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '6')
			{
				$('#lsList6').show();
				$('#lsList6').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList1").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '7')
			{
				$('#lsList7').show();
				$('#lsList7').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList1").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '8')
			{
				$('#lsList8').show();
				$('#lsList8').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList1").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '9')
			{
				$('#lsList9').show();
				$('#lsList9').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList1").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '10')
			{
				$('#lsList10').show();
				$('#lsList10').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList1").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '11')
			{
				$('#lsList11').show();
				$('#lsList11').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList1").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '12')
			{
				$('#lsList12').show();
				$('#lsList12').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList1").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '13')
			{
				$('#lsList13').show();
				$('#lsList13').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList1").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '14')
			{
				$('#lsList14').show();
				$('#lsList14').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList1").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '15')
			{
				$('#lsList15').show();
				$('#lsList15').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList1").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '16')
			{
				$('#lsList16').show();
				$('#lsList16').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList1").attr('disabled',true);     
				$("#lsList17").attr('disabled',true);     
			}
			else if (result == '17')
			{
				$('#lsList17').show();
				$('#lsList17').attr('disabled',false);
				$("#lsList2").attr('disabled',true);      
				$("#lsList3").attr('disabled',true);      
				$("#lsList4").attr('disabled',true);      
				$("#lsList5").attr('disabled',true);      
				$("#lsList6").attr('disabled',true);      
				$("#lsList7").attr('disabled',true);      
				$("#lsList8").attr('disabled',true);      
				$("#lsList9").attr('disabled',true);      
				$("#lsList10").attr('disabled',true);     
				$("#lsList11").attr('disabled',true);     
				$("#lsList12").attr('disabled',true);     
				$("#lsList13").attr('disabled',true);     
				$("#lsList14").attr('disabled',true);     
				$("#lsList15").attr('disabled',true);     
				$("#lsList16").attr('disabled',true);     
				$("#lsList1").attr('disabled',true);     
			}
		}); 
	}); 

</script>
<script type="text/javascript">
	
	$(document).ready(function() 
	{
		$('#selectGoCode').click(function() 
		{
			var result = $('#selectGoCode option:selected').val();
			if (result == '1')
			{
				$('#toggle').attr('disabled',true);
			} 
			else if (result == '2')
			{
				$('#toggle').attr('disabled',false);
			}
		}); 
	}); 

	
	$(function()
	{
		$("#submitBtn").click(function()
		{
			// 넘기는 파라미터 값 확인하는 코드
			
			if(confirm("작성한 모집글을 등록하시겠습니까?"))
	        {
				var guCode = $("input[name=guCode]").val();
				var category = $("select[name=category]").val();
				var age = $("select[name=age]").val();
				var gender = $("select[name=gender]").val();
				var lsCode = $("select[name=lsCode]").val();
				var grCount = $("select[name=grCount]").val();
				var goCode = $("select[name=goCode]").val();
				var pw = $("input[name=pw]").val();
				var grName = $("input[name=grName]").val();
				var grSubject = $("input[name=grSubject]").val();
				var grComment = $("textarea[name=grComment]").val();

	        	var data = {"P_GR_NAME": guCode, "P_GR_COUNT": grCount, "P_GR_SUBJECT": grSubject,
							"P_GR_COMMENT":grComment, "P_GU_CODE":guCode, "P_AGE_CODE":age,
							"P_GENDER_CODE":gender, "P_LS_CODE":lsCode, "P_CATEGORY_CODE":category,
							"P_GO_CODE":goCode, "P_GP_PW":pw}
	            $.ajax({
	                url: "groupregistration.do",
	                type: "POST",
	                data: data,
	                dataType: "json",
	                success: function(response) {
	                	var out = "";
	                	out += response.msg;
	                	
	                	alert(out);
	                	window.location.href = "boardgrouplist.do";
	                },
	                error: function(e) {
	                	alert("잘못된 접근입니다.");
					} 
	            });
	        }
		})
	})
	
</script>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div class="content_div">
				<div id="form_title">
					<span>그룹 <span style="color: #94be2c;">개설 요청서</span> 작성</span>
				</div>
				<div class="sub_title_div">
					<div class="content_box">
					<form id="regForm" action="boardgrouplist.do" method="post">
						<div class="mb-3">
							<input type="hidden" name="guCode" value="<%=guCode%>"/>
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
							<select name="age" class="category">
								<option value="1">유사</option>
								<option value="2">무관</option>
								<option value="3">동일</option>
							</select>
							<label for="exampleFormControlInput1" class="form-label">성별</label>
							<select name="gender" class="category">
								<option value="1">동일</option>
								<option value="2">무관</option>
							</select>
							<label for="exampleFormControlInput1" class="form-label">모집인원수</label>
							<select name="grCount" class="category">
								<option value="3" selected="selected">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">지역</label>
							<select class="category" id="lfList" name="lfList">
								<option value="1" selected="selected">서울</option>
								<option value="2">인천</option>
								<option value="3">경기</option>
								<option value="4">부산</option>
								<option value="5">대구</option>
								<option value="6">광주</option>
								<option value="7">대전</option>
								<option value="8">울산</option>
								<option value="9">세종</option>
								<option value="10">강원</option>
								<option value="11">경남</option>
								<option value="12">경북</option>
								<option value="13">전남</option>
								<option value="14">전북</option>
								<option value="15">충남</option>
								<option value="16">충북</option>
								<option value="17">제주</option>
							</select>
							<label for="exampleFormControlInput1" class="form-label">지역 소분류</label>
							
							<select name="lsCode" class="category" id="lsList1" disabled="disabled">
							<c:forEach var="lsList1" items="${list1 }">
									<option value="${lsList1.lsCode }">${lsList1.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList2" disabled="disabled">
							<c:forEach var="lsList2" items="${list2 }">
									<option value="${lsList2.lsCode }">${lsList2.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList3" disabled="disabled">
							<c:forEach var="lsList3" items="${list3 }">
									<option value="${lsList3.lsCode }">${lsList3.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList4" disabled="disabled">
							<c:forEach var="lsList4" items="${list4 }">
									<option value="${lsList4.lsCode }" id="${lsList4.lfCode}">${lsList4.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList5" disabled="disabled">
							<c:forEach var="lsList5" items="${list5 }">
									<option value="${lsList5.lsCode }" id="${lsList5.lfCode}">${lsList5.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList6" disabled="disabled">
							<c:forEach var="lsList6" items="${list6 }">
									<option value="${lsList6.lsCode }" id="${lsList6.lfCode}">${lsList6.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList7" disabled="disabled">
							<c:forEach var="lsList7" items="${list7 }">
									<option value="${lsList7.lsCode }" id="${lsList7.lfCode}">${lsList7.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList8" disabled="disabled">
							<c:forEach var="lsList8" items="${list8 }">
									<option value="${lsList8.lsCode }" id="${lsList8.lfCode}">${lsList8.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList9" disabled="disabled">
							<c:forEach var="lsList9" items="${list9 }">
									<option value="${lsList9.lsCode }" id="${lsList9.lfCode}">${lsList9.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList10" disabled="disabled">
							<c:forEach var="lsList10" items="${list10 }">
									<option value="${lsList10.lsCode }" id="${lsList10.lfCode}">${lsList10.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList11" disabled="disabled">
							<c:forEach var="lsList11" items="${list11 }">
									<option value="${lsList11.lsCode }" id="${lsList11.lfCode}">${lsList11.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList12" disabled="disabled">
							<c:forEach var="lsList12" items="${list12 }">
									<option value="${lsList12.lsCode }" id="${lsList12.lfCode}">${lsList12.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList13" disabled="disabled">
							<c:forEach var="lsList13" items="${list13 }">
									<option value="${lsList13.lsCode }" id="${lsList13.lfCode}">${lsList13.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList14" disabled="disabled">
							<c:forEach var="lsList14" items="${list14 }">
									<option value="${lsList14.lsCode }" id="${lsList14.lfCode}">${lsList14.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList15" disabled="disabled">
							<c:forEach var="lsList15" items="${list15 }">
									<option value="${lsList15.lsCode }" id="${lsList15.lfCode}">${lsList15.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList16" disabled="disabled">
							<c:forEach var="lsList16" items="${list16 }">
									<option value="${lsList16.lsCode }" id="${lsList16.lfCode}">${lsList16.lsList }</option>
							</c:forEach>
							</select>
							<select name="lsCode" class="category" id="lsList17" disabled="disabled">
							<c:forEach var="lsList17" items="${list17 }">
									<option value="${lsList17.lsCode }" id="${lsList17.lfCode}">${lsList17.lsList }</option>
							</c:forEach>
							</select>
						</div>
						<div class="mb-3">
							<label class="form-check-label" for="flexSwitchCheckDefault">그룹 비밀번호 설정</label>
							<select name="goCode" id="selectGoCode" class="category">
								<option value="1">공개</option>
								<option value="2">비공개</option>
							</select>
						  	<input type="text" id="toggle" name="pw" value="" placeholder="비밀번호 4자리" style="width: 120px;" disabled="disabled"/>
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">제목</label>
								<input type="text" class="form-control" id="exampleFormControlInput1" name="grName">
						</div>
						
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">스터디 주제(간단하게 작성)</label>
								<input type="text" class="form-control" id="exampleFormControlInput1" name="grSubject">
						</div>
						
						<div class="mb-3">
							<div id="text_count"><label for="exampleFormControlTextarea1" class="form-label">내용</label><span><span id="nowByte">0</span>/250bytes</span></div>
							<textarea class="form-control" id="exampleFormControlTextarea1"	name="grComment" rows="3" spellcheck="false" onkeyup="fn_checkByte(this)"></textarea>
						</div>
						
						<div class="button_box">
							<button onclick="history.back()" class="btn" id="backBtn">취소</button>
							<button type="button" class="btn" id="submitBtn">글올리기</button>
						</div>
					</form>
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