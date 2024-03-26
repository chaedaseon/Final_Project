<%@page import="com.study.mvc.model.HostDTO"%>
<%@page import="com.study.mvc.model.HostDAO"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 호스트 세션 받아오기
	HostDTO host = (HostDTO) session.getAttribute("host"); 
%>
<%
	String root = pageContext.getServletContext().getRealPath("/");
	String savePath = root + "pds" + "\\" + "saveFile";
	
	File dir = new File(savePath);
	// C:\SpringMVCStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp06\pds\saveFile 
	
	if (!dir.exists())
		dir.mkdirs();
	
	String encType = "UTF-8";		//-- 인코딩 방식(UTF-8)
	int maxFileSize = 5*1024*1024;	//-- 최대 업로드 크기(5MB)
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCafeRegForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript"src="http://code.jquery.com/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	
	function sample4_execDaumPostcode() 
	{
		var width = 500; //팝업의 너비
        var height = 600; //팝업의 높이
        new daum.Postcode(
        {
        	width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
            height: height,
            oncomplete: function(data) 
            {
                var roadAddr = data.roadAddress; // 도로명 주소 변수

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;

                if(data.autoRoadAddress) 
                {
                    var expRoadAddr = data.autoRoadAddress;
                } 
            }
        }).open({
            autoClose: true
        });
    }
	
	$(document).ready(function() {
		
	    $("#file").change(function()
		{
	    	
		    var input = document.getElementById("file");
		    var fileRoute = document.getElementById("fileRoute");
		    
		    //var fReader = new FileReader();
		    //fReader.readAsDataURL(input.files[0]);

		    //fReader.onloadend = function(event){

			// 절대경로
		    fileRoute.value = URL.createObjectURL(event.target.files[0]);
		});
		
	    // 정규식
	    var regTel = /^(010|011|016|017|018|019)[0-9]{3,4}[0-9]{4}$/;
	    var regRes = /^[0-9]{0,11}$/;
	    
	 	// 사업자번호 정규식 확인
		$("#resNumber").keyup(function()
		{
			var resNum = $("#resNumber").val();
			
			// 입력한 사업자번호가 정규표현식에 부합하지 않을 경우
			if(!regRes.test(resNum))	
			{
				alert("사업자번호를 확인해주세요");
				resNum.focus();
			}
		});
	 	
		// 전화번호 정규식 확인
		$("#tel3").blur(function()
		{
			var resTel1 = $("#tel1").val();
			var resTel2 = $("#tel2").val();
			var resTel3 = $("#tel3").val();
			
			var resTel = resTel1 + resTel2 + resTel3;
			
			if(!regTel.test(resTel))
			{
				alert("전화번호를 확인해주세요");
				resTel1.focus();
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
		<div id="content">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
			
			<div class="rightContent_div">
			<form action="cafeinsert.do?hoCode=<%=host.getHoCode() %>" method="post" id="cafeRegForm">
				<div class="register_div">
					<div class="register_description">
						<span style="color: #94bc32; font-weight: bold; font-size: 38px;">
							스터디카페 등록
						</span>
						<span style="color: #212529; font-size: 20px;"> 을 위해 정보를 입력해주세요</span>
					</div>	
					
					<div class="underline"></div>
					
					<div class="register_form">
						<table>
							<tr>
								<td class="register_title">
									<span>스터디카페명</span>
								</td> 
								<td class="register_input" colspan="2">
									<input type="text" class="register_text" name="name" required="required">
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>사업자등록번호</span>
								</td> 
								<td class="register_input" colspan="2">
									<input type="text" class="register_text" name="resNumber" id="resNumber" required="required">
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>전화번호</span>
								</td>
								<td class="register_input">
									<input type="tel" class="register_text" style="width: 68px;" name="tel1" id="tel1" required="required">
									 - <input type="tel" class="register_text" style="width: 75px;" name="tel2" id="tel2" required="required">
									  - <input type="tel" class="register_text" style="width: 75px;" name="tel3" id="tel3" required="required">
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>주소</span>
								</td> 
								<td class="register_input">
									<input type="text" id="sample4_postcode" class="register_text" placeholder="우편번호" readonly="readonly">
									<div style="height: 5px;"></div>							
									<input type="text" id="sample4_roadAddress" class="register_text" placeholder="도로명주소" readonly="readonly" name="addr1">
								</td> 							
								<td class="register_input">
									<input type="button" class="postBtn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
									<div style="height: 5px;"></div>
									<input type="text" id="sample4_detailAddress" class="register_text" name="addr2" placeholder="상세주소">
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>운영 시작시간</span>
								</td> 
								<td class="register_input" colspan="2">
									<select	class="register-select" id="startHour" name="startHour" required="required">
										<option selected="selected">00:00</option>
										<option>01:00</option>
										<option>02:00</option>
										<option>03:00</option>
										<option>04:00</option>
										<option>05:00</option>
										<option>06:00</option>
										<option>07:00</option>
										<option>08:00</option>
										<option>09:00</option>
										<option>10:00</option>
										<option>11:00</option>
										<option>12:00</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>운영 종료시간</span>
								</td> 
								<td class="register_input" colspan="2">
									<select class="register-select" id="closeHour" name="closeHour" required="required">
										<option>12:00</option>
										<option>13:00</option>
										<option>14:00</option>
										<option>15:00</option>
										<option>16:00</option>
										<option>17:00</option>
										<option>18:00</option>
										<option>19:00</option>
										<option>20:00</option>
										<option>21:00</option>
										<option>22:00</option>
										<option>23:00</option>
										<option selected="selected">24:00</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>편의 시설</span>
								</td> 
								<td class="register_check" colspan="2">
									<label><input type="checkbox" value="프린터&복사기" name="checkCon"> 프린터&복사기</label>									
									<label><input type="checkbox" value="에어컨&난방" name="checkCon"> 에어컨&난방</label>									
									<label><input type="checkbox" value="남녀화장실" name="checkCon"> 남녀화장실</label>									
									<label><input type="checkbox" value="정수기" name="checkCon"> 정수기</label>									
									<label><input type="checkbox" value="사물함" name="checkCon"> 사물함</label>									
									<label><input type="checkbox" value="휴게공간" name="checkCon"> 휴게공간</label>									
									<label><input type="checkbox" value="커피머신" name="checkCon"> 커피머신</label>									
									<label><input type="checkbox" value="사무용품대여" name="checkCon"> 사무용품대여</label>									
									<label><input type="checkbox" value="공기청정기" name="checkCon"> 공기청정기</label>									
									<label><input type="checkbox" value="냉장고" name="checkCon"> 냉장고</label>									
									<label><input type="checkbox" value="전자레인지" name="checkCon"> 전자레인지</label>									
									<label><input type="checkbox" value="흡연실" name="checkCon"> 흡연실</label>									
									<label><input type="checkbox" value="와이파이" name="checkCon"> 와이파이</label>									
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>주변 시설</span>
								</td> 
								<td class="register_check" colspan="2">
									<label><input type="checkbox" value="지하철역" name="checkSur"> 지하철역</label>									
									<label><input type="checkbox" value="버스정류장" name="checkSur"> 버스정류장</label>									
									<label><input type="checkbox" value="편의점" name="checkSur"> 편의점</label>									
									<label><input type="checkbox" value="카페" name="checkSur"> 카페</label>									
									<label><input type="checkbox" value="서점" name="checkSur"> 서점</label>									
									<label><input type="checkbox" value="제본소" name="checkSur"> 제본소</label>									
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>상세설명</span>
								</td> 
								<td class="register_input" colspan="2">
									<textarea class="register_text regform-control" name="detail" required="required"></textarea>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>유의사항</span>
								</td> 
								<td class="register_input" colspan="2">
									<textarea class="register_text regform-control" name="caution" required="required"></textarea>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>첨부파일</span>
								</td> 
								<td class="register_input" colspan="2">
									<input type="file" accept="image/*" name="file" id="file">
									<div style="height: 5px;"></div>
									<input type="text" class="register_text" name="fileRoute" id="fileRoute" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="register_input" colspan="4">
									<input type="checkbox" class="custom-control-input"	id="aggrement"> 
									<label	class="custom-control-label" for="aggrement">
										개인정보 수집 및 이용에 동의합니다.
									</label>
								</td>
							</tr>
						</table>
					</div>
				
					<div class="underline"></div>
					
					<button type="reset" class="signUp signUp-del" onclick="location.href='cafelist.do?hoCode=<%=host.getHoCode()%>'">취 소</button>
					<button type="submit" class="signUp" id="regBtn">등 록</button>
				</div>
				</form>
			</div>
			</div>
		</section>
	
	<footer>
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>