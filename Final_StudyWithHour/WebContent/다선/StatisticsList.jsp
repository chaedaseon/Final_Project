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
<title>StatisticsList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestMainStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script>
	$(document).ready(function()
	{

		$('#datePicker').datepicker(
		{
			format : 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			startDate : '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			endDate : '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
			clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
			datesDisabled : [ '2019-06-24', '2019-06-26' ], //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
			daysOfWeekDisabled : [ 0, 6 ], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
			daysOfWeekHighlighted : [ 3 ], //강조 되어야 하는 요일 설정
			disableTouchKeyboard : false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			immediateUpdates : false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
			multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
			multidateSeparator : ',', //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
			templates :
			{
				leftArrow : '&laquo;',
				rightArrow : '&raquo;',
			}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
			showWeekDays : true, // 위에 요일 보여주는 옵션 기본값 : true
			title : '테스트', //캘린더 상단에 보여주는 타이틀
			todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false
			toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			weekStart : 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
			language : 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		}).on('changeDate', function(e)
		{
			/* 이벤트의 종류 */
			//show : datePicker가 보이는 순간 호출
			//hide : datePicker가 숨겨지는 순간 호출
			//clearDate: clear 버튼 누르면 호출
			//changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
			//changeMonth : 월이 변경되면 호출
			//changeYear : 년이 변경되는 호출
			//changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
			console.log(e);
			// e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
		});
	});
</script>

</head>
<body>

	<header>
		<jsp:include page="/Menu.jsp" />
	</header>

	<section>

		<div id="content">
			<jsp:include page="/SideMenu.jsp" />
			<!-- col-2 적용되어 있음 -->

			<div class="rightContent_div">
				<div class="content_div">

					<div class="date_sorting"
						style="display: flex; align-items: center;">
						<span style="font-size: 28px;">일간 / 월간 현황</span> <span
							class="date_calendar"
							style="margin-left: calc(( 100% - 550px)/2);"> <!-- 
					<a href="#" class="text-decoration-none" style="color:black;">◁ </a>
     					<a>2024-02-10</a>
     				<a href="#" class="text-decoration-none" style="color:black;"> ▷</a>
     				 --> <input type="date" id="datePicker"> <!-- <input type="datetime-local" min="2024-02-15T10:26" id="field-:rr:" class="chakra-input css-1fwk4he" value=""> -->
						</span>

						<!-- 
				<div class="date_title">
					<h2>일간 / 월간 현황</h2>
				</div>
				<div class="date_calendar">
					<a href="#" class="text-decoration-none" style="color:black;">◁ </a>
     					<a>2024-02-10</a>
     				<a href="#" class="text-decoration-none" style="color:black;"> ▷</a>
				</div>
				 -->

					</div>


					<!-- 
			<div class="flex align-items-center pt-3 pb-2 mb-3 border-bottom">
				<div>
        		<h1 class="h3">일간/월간 현황</h1>
        			<div>
     				<a href="#" class="text-decoration-none" style="color:black;">◁ </a>
     					<a>2024-02-10</a>
     				<a href="#" class="text-decoration-none" style="color:black;"> ▷</a>
     				</div>
     			</div>
      		</div>
     			 -->
					<table class="table">
						<tr>
							<th>스터디카페</th>
							<th>총 예약 건수</th>
							<th>이용 완료</th>
							<th>취소</th>
							<th>노쇼</th>
						</tr>
						<tr>
							<td>서울스터디카페</td>
							<td>70 건</td>
							<td>60 건</td>
							<td>7 건</td>
							<td>3 건</td>
						</tr>
					</table>
					<div>
						<div class="chart">
							<div class="progress-stacked">
								<div class="progress" role="progressbar" aria-label="Segment one" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100" style="width: 15%">
									<div class="progress-bar"></div>
								</div>
								<div class="progress" role="progressbar" aria-label="Segment two" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
									<div class="progress-bar bg-success"></div>
								</div>
								<div class="progress" role="progressbar" aria-label="Segment three" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
									<div class="progress-bar bg-main"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>
</body>
</html>