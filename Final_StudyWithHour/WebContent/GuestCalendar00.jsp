<%@page import="com.test.mvc.GuestDTO"%>
<%@page import="com.test.mvc.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	/* 게스트 세션 받아오기 */
	String guCode = (String)session.getAttribute("guCode");
	GuestDAO guestDao = new GuestDAO();
	guestDao.connection();
	GuestDTO guest = guestDao.sessionGuest(guCode);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestCalendar.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestPageStyle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<script src='../dist/index.global.js'></script>

<script>

  	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var nowDate = new Date();
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	customButtons:{
    		myCustomButton:{
    			text:"일정 추가",
    			click : function() {
    				$("#calendarAdd").modal("show");
    			}
    		}
    	},
    	headerToolbar: 
    	{
    		left: 'prev,next',
	  		center: 'title',
	    	right: 'myCustomButton'
    	},
    	contentHeight:500,
      	initialDate: nowDate,
      	locale:"ko",
      	editable: true,
      	selectable: true,
      	dayMaxEvents: true,
      	dayCellContent: function(info)					// '일' 삭제
		{
      		var number = document.createElement("a");
      		number.classList.add("fc-daygrid-day-number");
      		number.innerHTML=info.dayNumberText.replace("일","");
      		if (info.view.type == "dayGridMonth") {
      			return {
      				html:number.outerHTML
      			};
      		}
      		return {
      			domNodes: []
      		};
		},
      	events: [
        {
          title: 'All Day Event',
          start: '2023-03-01'
        },
        {
          title: 'Long Event',
          start: '2023-01-07',
          end: '2023-03-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2023-03-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2023-04-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2023-01-11',
          end: '2023-01-13'
        },
        {
          title: 'Meeting',
          start: '2023-01-12T10:30:00',
          end: '2023-01-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2023-01-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2023-01-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2023-01-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2023-01-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2023-01-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2023-01-28'
        }
      ]
    });

    calendar.render();
    
  });

</script>


</head>

<body>

<header>
	<c:import url="Menu.jsp"></c:import>
</header>

<section>
	<div id="content">
		<c:import url="SideMenu.jsp"></c:import>
		
		<div class="rightContent_div">
			<div class="page_title">
				<span><span>일정</span> 관리</span>
			</div>
			
			<div style="display: flex;">
				<div style="width: 700px; margin-top: 25px;">
					<div id='calendar' style="width: 100%;">
					
					</div>
				</div>
			
				<div>
					<div>
						오늘의 일정
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