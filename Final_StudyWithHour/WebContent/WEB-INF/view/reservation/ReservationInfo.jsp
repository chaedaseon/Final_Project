<%@page import="com.study.mvc.model.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	GuestDTO guest = (GuestDTO) session.getAttribute("guest");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationInfo.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/groupPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6deffd0f352a0e6f8ae48b94ee77f4b3"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6deffd0f352a0e6f8ae48b94ee77f4b3&libraries=services"></script>
<script type="text/javascript">
	
	function initialize()
	{
	   	//var addr = document.getElementById("addr").innerText;
	   	
	   	container = document.getElementById("map");
	   	mapCenter = new kakao.maps.LatLng(37.5565401,126.9194871);
		options =
		{
			center: mapCenter
			, level: 3
		};
		
		map = new kakao.maps.Map(container, options);  
	   	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
	   	imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		imageSize = new kakao.maps.Size(24, 35);
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

		// 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map
            , position: mapCenter
            , image: markerImage
        });   
		
	}
	
	function sendIt()
	{
		var form = document.getElementById("addReserveForm");
		form.submit();
	}

</script>
</head>
<body>
<body onload ="initialize()">
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>

			<div class="rightContent_div">
				<div class="page_title">
					<span><span>예약확인</span></span>
				</div>
				<div class="sorting_div"></div>
				
				<c:forEach var="room" items="${cafe }">
				<div style="margin-bottom: 30px;">
					<h2>${room.scName } ${room.srName }</h2>
					<h4 id="addr">${room.scAddr1 }, ${room.scAddr2 }</h4>
				</div>
				
				<div style="display: flex; align-items: center;">
					<div>
						<img src="images/studycafe.jpg" style="width: 500px; height: 400px;">
					</div>
					<div style="margin-left: 100px;">
					<c:choose>
					<c:when test="${reserveDate != null && reserveAddr1 != null && reserveAddr2 != null && reserveHour1 != null && reserveHour2 != null}">
					<form action="groupreserveinsert.do?gu_code=<%=guest.getGuCode() %>&gr_code=${grCode }&srCode=${room.srCode }" method="post" id="addReserveForm">
						<table class="register_table" style="width: 450px; text-align: center;">
						<tr>
							<td colspan="2">
								<h5>예약확인 후 바로 예약확정</h5>
								<h6>빠르고 확실한 예약을 위해<br>
								<span style="font-weight: bold; color: #94bc3e;">STUDY WITH HOUR</span> 에서 예약을 진행하세요 :)</h6>
							</td>
						</tr>
						<tr class="spacer"></tr>
						<tr>
							<td>예약일자</td>
							<td>
								${reserveDate }
								<input type="hidden" name="reserveDate" value="${reserveDate }">
							</td>
						</tr>
						<tr>
							<td>이용시간</td>
							<td>
								${reserveHour1 }
								<input type="hidden" name="reserveHour1" value="${reserveHour1 }">
							</td>
						</tr>
						<tr>
							<td>이용시간</td>
							<td>
								${reserveHour2 }
								<input type="hidden" name="reserveHour2" value="${reserveHour2 }">
							</td>
						</tr>
						<tr>
							<td>인원수</td>
							<td>
								${reserveCount }명
								<input type="hidden" name="reserveCount" value="${reserveCount }">
							</td>
						</tr>
						<tr class="spacer"></tr>
						</table>
						<table class="register_table" style="text-align: center;">
							<tr>
								<td>
									<a href="javascript:sendIt()">바로예약</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="groupreservesearch.do?&gu_code=<%=guest.getGuCode() %>&gr_code=${grCode }">다시검색</a>
								</td>
							</tr>
						</table>
					</form>
					</c:when>
					<c:when test="${reserveDate == null}">
						<table class="register_table" style="text-align: center;">
							<tr>
								<td colspan="2">
									예약 정보를 입력해주세요.
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<a href="groupreservesearch.do?grCode=1">검색으로</a>
								</td>
							</tr>
						</table>
					</c:when>
					</c:choose>
					</div>
				</div>
				<div class="sorting_div"></div>
				
				<ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 50px; font-size: 18px;">
					<li class="nav-item" role="presentation">
				   		<button class="nav-link active" id="detail-tab" data-bs-toggle="tab" data-bs-target="#detail-tab-pane" type="button" role="tab"
				   		 aria-controls="home-tab-pane" aria-selected="true">상세정보</button>
				  	</li>
				</ul>
				
				<div class="tab-content" id="myTabContent">
				  	<div class="tab-pane fade show active" id="detail-tab-pane" role="tabpanel" aria-labelledby="detail-tab" tabindex="0">
						<div style="margin-top: 10px;">
							<span style="border-bottom: 3px solid #94bc3e; font-size: 20px;">상세정보</span>
							<br><br>
							<p>✨${fn:substring(room.scDate,0,11) } OPEN</p>
							<p>${room.scName }입니다.</p>
							<p>⏰${room.scOpenHour } ~ ${room.scCloseHour }</p>
							<p>📞${fn:substring(room.scTel,0,3) }-${fn:substring(room.scTel,3,7) }-${fn:substring(room.scTel,7,11) }</p>
						</div>
					</div>
				</div>
				
				
				<ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 50px; font-size: 18px;">
					<li class="nav-item" role="presentation">
				   		<button class="nav-link active" id="cafeinfo-tab" data-bs-toggle="tab" data-bs-target="#cafeinfo-tab-pane" type="button" role="tab"
				   		 aria-controls="home-tab-pane" aria-selected="true">편의시설</button>
				  	</li>
				  	<li class="nav-item" role="presentation">
				    	<button class="nav-link" id="conven-tab" data-bs-toggle="tab" data-bs-target="#conven-tab-pane" type="button" role="tab"
				    	 aria-controls="profile-tab-pane" aria-selected="false">주변시설</button>
				  	</li>
				  	<li class="nav-item" role="presentation">
				    	<button class="nav-link" id="caution-tab" data-bs-toggle="tab" data-bs-target="#caution-tab-pane" type="button" role="tab"
				    	 aria-controls="contact-tab-pane" aria-selected="false">유의사항</button>
				  	</li>
				  	<li class="nav-item" role="presentation">
				    	<button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review-tab-pane" type="button" role="tab"
				    	 aria-controls="contact-tab-pane" aria-selected="false">이용후기</button>
				  	</li>
				</ul>
				
				<div class="tab-content" id="myTabContent">
				  	<div class="tab-pane fade show active" id="cafeinfo-tab-pane" role="tabpanel" aria-labelledby="cafeinfo-tab" tabindex="0">
						<div style="margin-top: 10px;">
							<span style="border-bottom: 3px solid #94bc3e; font-size: 20px;">편의시설안내</span>
							<br><br>
							<p>${room.scConvenient }</p>
						</div>
					</div>
					
				  	<div class="tab-pane fade" id="conven-tab-pane" role="tabpanel" aria-labelledby="conven-tab" tabindex="0">
				  		<div style="margin-top: 10px;">
							<span style="border-bottom: 3px solid #94bc3e; font-size: 20px;">주변시설안내</span>
							<br><br>
							<p>${room.scSurround }</p>
						</div>
				  	</div>
				  	
				  	<div class="tab-pane fade" id="caution-tab-pane" role="tabpanel" aria-labelledby="caution-tab" tabindex="0">
				  		<div style="margin-top: 10px;">
							<span style="border-bottom: 3px solid #94bc3e; font-size: 20px;">유의사항</span>
							<br><br>
							<p>${room.scCaution }</p>
						</div>
				  	</div>
				  	
				  	<div class="tab-pane fade" id="review-tab-pane" role="tabpanel" aria-labelledby="review-tab" tabindex="0">
				  		<div style="margin-top: 10px;">
							<span style="border-bottom: 3px solid #94bc3e; font-size: 20px;">이용후기</span>
							<br><br>
							<c:forEach var="re" items="${review }">
							<p>${fn:substring(re.rvDate,0,11) } 🗨️${re.guNick }<br>
							[${fn:substring(re.reStartDate,0,11) } 이용] ${re.rvContent } 
							</p>
							</c:forEach>
						</div>
				  	</div>
				</div>
				
				<ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 50px; font-size: 18px;">
					<li class="nav-item" role="presentation">
				   		<button class="nav-link active" id="map-tab" data-bs-toggle="tab" data-bs-target="#map-tab-pane" type="button" role="tab"
				   		 aria-controls="home-tab-pane" aria-selected="true">지도</button>
				  	</li>
				</ul>
				
				<div class="tab-content" id="myTabContent">
				  	<div class="tab-pane fade show active" id="map-tab-pane" role="tabpanel" aria-labelledby="map-tab" tabindex="0">
						<div style="margin-top: 10px;"></div>
						<div id="map" style="width: 100%; height: 350px;"></div>
					</div>
				</div>

				</c:forEach>
 			</div>
 		</div>

	</section>

	<footer>
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>
</body>
</html>