<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCafeModifyForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript"src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
</script>
<script type="text/javascript">
	
	$(document).ready(function()
	{		
		var checkCon = ['프린터','복사기', '에어컨&난방', '남녀화장실', '정수기', '사물함', '휴게공간', '커피머신', '사무용품대여', '공기청정기', '냉장고', '전자레인지', '흡연실', '와이파이'];
		var checkSur = ['지하철역', '버스정류장', '편의점', '카페', '서점', '제본소'];
		
		var conLists = "<c:out value="${cafeInfo.scConvenient}"/>";
		var conList = [];
		conList = conLists.split(",");
		
		var surLists = "<c:out value="${cafeInfo.scSurround}"/>";
		var surList = [];
		surList = surLists.split(",");
		
		//alert(checkCon.length);		
		
		for (var i=0; i<checkCon.length; i++)
		{
			for (var j=0; j<conList.length; j++)
			{
				if (checkCon[i] == conList[j])
				{
					document.getElementById("con").innerHTML += "<label><input type='checkbox' checked='checked' name='checkCon' value='" + checkCon[i] + "'>" + checkCon[i] + "</label>";
					i++;
				}
			}
			document.getElementById("con").innerHTML += "<label><input type='checkbox' name='checkCon' value='" + checkCon[i] + "'>" + checkCon[i] + "</label>";
			
		} 
		
		for (var i=0; i<checkSur.length; i++)
		{
			for (var j=0; j<surList.length; j++)
			{
				if (checkSur[i] == surList[j])
				{				
					document.getElementById("sur").innerHTML += "<label><input type='checkbox' checked='checked' name='checkSur' value='" + checkSur[i] + "'>" + checkSur[i] + "</label>";
					i++;
				}
			}
			document.getElementById("sur").innerHTML += "<label><input type='checkbox' name='checkSur' value='" + checkSur[i] + "'>" + checkSur[i] + "</label>";
			
		} 
		
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
			<form action="cafeupdate.do?scCode=${cafeInfo.scCode }" method="post" id="cafeModForm">
				<div class="register_div">
					<div class="register_description">
						<span style="color: #94bc32; font-weight: bold; font-size: 38px;">스터디카페 수정</span><span style="color: #212529; font-size: 20px;"> 을 위해 정보를 입력해주세요</span>
					</div>	
					
					<div class="underline"></div>
					<div class="register_form">
						
						<table>
							<tr>
								<td class="register_title">
									<span>스터디카페명</span>
								</td> 
								<td class="register_input" colspan="2">
									<input type="text" class="register_text" name="name" value="${cafeInfo.scName }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>사업자등록번호</span>
								</td> 
								<td class="register_input" colspan="2">
									<input type="text" class="register_text" name="resnumber" value="${cafeInfo.scResnumber }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>전화번호</span>
								</td>
								<c:set var="tel" value="${cafeInfo.scTel }"/>
								<c:choose>
								<c:when test="${fn:length(cafeInfo.scTel) == 11}">
									<td class="register_input">
										<input type="tel" class="register_text" style="width: 68px;" name="tel1" placeholder="${fn:substring(tel, 0, 3)}" required="required">
										 - <input type="tel" class="register_text" style="width: 75px;" name="tel2" placeholder="${fn:substring(tel, 3, 7)}" required="required">
										  - <input type="tel" class="register_text" style="width: 75px;" name="tel3" placeholder="${fn:substring(tel, 7, 11)}" required="required">
									</td>
								</c:when>
								<c:otherwise>
									<td class="register_input">
										<input type="tel" class="register_text" style="width: 68px;" name="tel1" placeholder="${fn:substring(tel, 0, 2)}" required="required">
										 - <input type="tel" class="register_text" style="width: 75px;" name="tel2" placeholder="${fn:substring(tel, 2, 6)}" required="required">
										  - <input type="tel" class="register_text" style="width: 75px;" name="tel3" placeholder="${fn:substring(tel, 6, 10)}" required="required">
									</td>
								</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<td class="register_title">
									<span>주소</span>
								</td> 
								<td class="register_input">
									<input type="text" class="register_text" value="${cafeInfo.scAddr1 }" name="addr1" readonly="readonly">
								</td> 
								<td class="register_input">
									<input type="text" class="register_text" value="${cafeInfo.scAddr2 }" name="addr2" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>운영 시작시간</span>
								</td> 
								<td class="register_input" colspan="2">
									<select	class="register-select" id="startHour" name="startHour">
										<option selected="selected">${cafeInfo.scOpenHour }</option>
										<option>00:00</option>
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
									<select class="register-select" id="closeHour" name="closeHour">
										<option selected="selected">${cafeInfo.scCloseHour }</option>
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
										<option>24:00</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>편의 시설</span>
								</td> 	
								<td class="register_check" colspan="2" id="con">
									
								</td>								
							</tr>
							<tr>
								<td class="register_title">
									<span>주변 시설</span>
								</td> 
								<td class="register_check" colspan="2" id="sur">
									
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>상세설명</span>
								</td> 
								<td class="register_input" colspan="2">
									<textarea class="register_text regform-control" name="detail" placeholder="${cafeInfo.scDetail }" required="required"></textarea>
									<span class="span-limit">0/1000</span>
								</td>
							</tr>
							<tr>
								<td class="register_title">
									<span>유의사항</span>
								</td> 
								<td class="register_input" colspan="2">
									<textarea class="register_text regform-control" name="caution" placeholder="${cafeInfo.scCaution }" required="required"></textarea>
									<span class="span-limit">0/1000</span>
								</td>
							</tr>
						</table>
						
					</div>
				
					<div class="underline"></div>
					
					<button type="reset" class="signUp" style="margin-left: 10px;" onclick="location.href='cafedetail.do?scCode=${cafeInfo.scCode}'">취 소</button>
					<button type="submit" class="signUp">수 정</button>
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