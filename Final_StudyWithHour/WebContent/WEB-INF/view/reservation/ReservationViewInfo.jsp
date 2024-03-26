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
		<div id="content" style="width: 70%;">

			<div class="content_div">
			<div style="margin-top: 20px;"></div>
				<div class="page_title">
					<span><span>${cafe.scName }</span> 정보</span>
				</div>
				<div class="sorting_div"></div>
				
				<div style="display: flex; align-items: center;">
					<div>
						<img src="images/studycafe.jpg" style="width: 500px; height: 400px;">
					</div>
					<div style="margin-left: 100px;">
					
					<table class="register_table" style="text-align: center; width: 600px;">
						<tr>
							<td colspan="4">보유 스터디룸 정보</td>
						</tr>
						<tr>
							<td>스터디룸명</td>
							<td>최대인원</td>
							<td style="width: 10px;"></td>
							<td>가격</td>
						</tr>
						<c:choose>
						<c:when test="${count <= 0}">
							<tr>
								<td colspan="4">보유 스터디룸 정보가 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="room" items="${room }">
							<tr>
								<td>${room.srName }</td>
								<td>최대${room.srCount }명</td>
								<td style="width: 10px;"></td>
								<td>시간/${room.srPrice }원</td>
							</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</table>
					<table class="register_table" style="text-align: center;">
						<tr>
							<td colspan="2">
								<a href="reservesearch.do">목록</a>
							</td>
						</tr>
					</table>
					
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
							<p>✨${fn:substring(cafe.scDate,0,11) } OPEN</p>
							<p>${cafe.scName }입니다.</p>
							<p>⏰${cafe.scOpenHour } ~ ${cafe.scCloseHour }</p>
							<p>📞${fn:substring(cafe.scTel,0,3) }-${fn:substring(cafe.scTel,3,7) }-${fn:substring(cafe.scTel,7,11) }</p>
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
							<p>${cafe.scConvenient }</p>
						</div>
					</div>
					
				  	<div class="tab-pane fade" id="conven-tab-pane" role="tabpanel" aria-labelledby="conven-tab" tabindex="0">
				  		<div style="margin-top: 10px;">
							<span style="border-bottom: 3px solid #94bc3e; font-size: 20px;">주변시설안내</span>
							<br><br>
							<p>${cafe.scSurround }</p>
						</div>
				  	</div>
				  	
				  	<div class="tab-pane fade" id="caution-tab-pane" role="tabpanel" aria-labelledby="caution-tab" tabindex="0">
				  		<div style="margin-top: 10px;">
							<span style="border-bottom: 3px solid #94bc3e; font-size: 20px;">유의사항</span>
							<br><br>
							<p>${cafe.scCaution }</p>
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
 			</div>
 		</div>

	</section>

	<footer>
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>
</body>
</html>