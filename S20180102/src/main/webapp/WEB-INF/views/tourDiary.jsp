<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href='//fonts.googleapis.com/css?family=Lato:100,400,700' rel='stylesheet' />
	<link rel='stylesheet' href='css/fullcalendar.min.css' />
	<script src='js/moment.min.js'></script>
	<script src='js/fullcalendar.min.js'></script>
	<script type="text/javascript">
		$(document).ready(function() {
	
	    $('#calendar').fullCalendar({
	    	header: {
	            left: 'prev,next today',
	            center: 'title',
	            right: 'month,agendaWeek,agendaDay,listWeek'
	          },
	          defaultDate: '2018-01-01',
	          navLinks: false, // can click day/week names to navigate views
	          editable: false,
	          eventLimit: true, // allow "more" link when too many events
	          eventMouseover: function (data, event, view) {
	              tooltip = '<div class="tooltiptopicevent" style="width:auto;height:auto;background:#feb811;position:absolute;z-index:10001;padding:10px 10px 10px 10px ;  line-height: 200%;">' + '상품명: ' + data.title + '</div>';
	              $("body").append(tooltip);
	              $(this).mouseover(function (e) {
	                  $(this).css('z-index', 10000);
	                  $('.tooltiptopicevent').fadeIn('500');
	                  $('.tooltiptopicevent').fadeTo('10', 1.9);
	              }).mousemove(function (e) {
	                  $('.tooltiptopicevent').css('top', e.pageY + 10);
	                  $('.tooltiptopicevent').css('left', e.pageX + 20);
	              });


	          },
	          eventMouseout: function (data, event, view) {
	              $(this).css('z-index', 8);

	              $('.tooltiptopicevent').remove();

	          },
	          events: [
	        	 <c:forEach var="gserv" items="${gsList }">
	        	  {
	              title: '${gserv.gservTitle} / 예약 : ${gserv.reMemSize}',
	              start: new Date('${gserv.tourDate}T${gserv.pickUpTime}'),
	              end: new Date('${gserv.tourDate}T${gserv.endTime}'),
	              url: 'confirmResForm.do?gservNo=${gserv.gservNo}&tourDate=${gserv.tourDate}'
	              },
	            </c:forEach>
	              {
		              title: '회식하는날',
		              start: new Date('2018-01-19'),
		         },
	            ],
		          eventClick: function(event) {
		              if (event.url) {
		            	  cw=screen.availWidth;     //화면 넓이
		            	  ch=screen.availHeight;    //화면 높이

		            	  sw=640;    /* 띄울 창의 넓이 */
		            	  sh=800;    /* 띄울 창의 높이 */
		            	  ml=(cw-sw)/2;        /* 가운데 띄우기위한 창의 x위치 */
		            	  mt=(ch-sh)/2;        /* 가운데 띄우기위한 창의 y위치 */
		                  window.open(event.url, "네이버새창", "width="+sw+", height="+sh+", left="+ml+", top="+mt+", toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		                  return false;
		              }
		          }
	    });
	
	});
</script>
<style>
  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  .body {
		padding-top: 70px;
	}

</style>
				
</head>
<body>
	<jsp:include page="guideBar.jsp"></jsp:include>
<section class="body">
	<div id='calendar'></div>
	</section>
</body>
</html>