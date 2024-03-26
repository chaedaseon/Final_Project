<%@page import="com.study.mvc.model.HostDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 호스트 세션 받아오기
	HostDTO host = (HostDTO) session.getAttribute("host");
	
	// 차트 영역부분에 필요한 데이터 수신
	String cfSelect = request.getParameter("cfState");
	int cancelCount = (Integer)request.getAttribute("cancelCount");
	int stateDoneCount = (Integer)request.getAttribute("stateDoneCount");
	int noshowCount = (Integer)request.getAttribute("noshowCount");
	int totalCount = (Integer)request.getAttribute("totalCount");
	
	int stateDonePrice = (Integer)request.getAttribute("stateDonePrice");
	int cancelPrice = (Integer)request.getAttribute("cancelPrice");
	int noshowPrice = (Integer)request.getAttribute("noshowPrice");
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StatisticsList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/groupPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 차트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{	
		$("#cfState").change(function()
		{
			var f = document.searchForm;
			f.submit();
			var selectText = $("#cfState option:selected").text();
			var scName = document.getElementById("name");
			
			//$("#name").val() = selectText;
			
			//alert(selectText);
			//scName.innerHTML = selectText;
			//scName.value = selectText;
			
		});
		
		
		var searchArr = $('#cfState').find("option");
		searchArr.each(function(i)
		{     
			var optionValue = $(this).val();     
			if(optionValue == <%=cfSelect%>)
				$(this).attr("selected","selected");
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
					
				<div class="page_title">
					<span><span>통계 내역</span> 관리</span>
				</div>
				
				<!-- 검색창 영역 -------------------------------------------------------------------->
				<div class="select_div">
					<form action="hoststatuslist.do?hoCode=<%=host.getHoCode() %>" method="post" name="searchForm">
						<select class="select_bar" name="cfState" id="cfState">
							<option value="cfAll">전체</option>
						<c:forEach var="cafe" items="${cafe }" varStatus="cf">
							<option value="${cafe.scCode }">${cafe.scName }</option>
						</c:forEach>
						</select>
					</form>
				</div>
				
				
				<!-- 통계 영역 -------------------------------------------------------------------->
				<div style="margin-top: 10px;">
					<table class="register_table">
						<tr>
							<th></th>
							<th>총 예약건수[총액]</th>
							<th>이용완료</th>
							<th>취소</th>
							<th>노쇼</th>
						</tr>
						<tr>
							<td><div id="name"></div></td>
							<td id="total">${totalCount }건[${stateDonePrice }원]</td>
							<td id="state">${stateDoneCount }건</td>
							<td id="cancel">${cancelCount }건</td>
							<td id="noshow">${noshowCount }건</td>
						</tr>
					</table>
				</div>
				<div style="margin-top: 10px;"></div>
				
				<div style="display: flex;">  	
				<!-- 차트 영역 ------------------------------------------------------------------------->
				<div style="width: 70%;">
				<canvas id="myChart"></canvas>
					<script>
					var ctx = document.getElementById('myChart').getContext('2d');
					var chart = new Chart(ctx, {
					    type: 'bar',  
					    data: {
					        labels: ['전체','이용완료','취소','노쇼'],
					        datasets: [{
					            label: '',
					            backgroundColor: [
					              'rgba(255, 99, 132, 0.5)',
					              'rgba(255, 159, 64, 0.5)',
					              'rgba(255, 205, 86, 0.5)',
					              'rgba(75, 192, 192, 0.5)'
					            ],
					            data: [<%=totalCount%>, <%=stateDoneCount%> ,<%=cancelCount%>, <%=noshowCount%>,]
					        }]
					    },
					
					}); 
					
					</script>
				</div>


				<div style="margin-top: 10px;"></div>
					
				<!-- 차트 영역 ------------------------------------------------------------------------->
				<div style="width: 70%; margin: 0 auto;">
				<canvas id="priceChart"></canvas>
					<script>
					var ctx = document.getElementById('priceChart').getContext('2d');
					var chart = new Chart(ctx, {
					    type: 'doughnut',  
					    data: {
					    	labels: ['전체','이용완료','취소','노쇼'],
					        datasets: [{
					            label: '',
					            backgroundColor: [
					              'rgba(255, 99, 132, 0.5)',
					              'rgba(255, 159, 64, 0.5)',
					              'rgba(255, 205, 86, 0.5)',
					              'rgba(75, 192, 192, 0.5)'
					            ],
					            data: [<%=stateDonePrice%>, <%=stateDonePrice%> ,<%=cancelPrice%>, <%=noshowPrice%>,]
					        }]
					    },
					
					}); 
					
					</script>
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