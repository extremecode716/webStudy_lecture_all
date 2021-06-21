<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
.bar {
	width: 250px;
	height: 100%;
	box-sizing: border-box;
	display: inline-block;
	float: left;
	padding-top: 100px;
	padding-left: 30px;
	color: gray;
	/* position: fixed; */
}

li {
	list-style: none;
}

ul {
	padding: 0px;
}

.tap1 {
	text-decoration: none;
	color: white;
}

#searchFilter a {
	color: gray;
	width: 60px;
	padding: 5px;
}

#searchFilter li {
	padding-top: 10px;
	padding-bottom: 10px;
	color: gray;
	font-size: 15px;
	display: inline-block;
}

#areaCode a {
	color: #353535;
	font-size: 18px;
}

#areaCode {
	border-top: 1px solid gray;
	padding-top: 10px;
	padding-bottom: 10px;
}

ul[id^=area] {
	display: none;
}
/* a */
a:hover {
	font-weight: bold;
}
/* button */
button {
	width : 30px;
	height : 30px;
	border: 1.7px solid rgb(61, 183, 204);
	font-weight: bold;
	color : #FE9A2E;
	border-radius: 12.5px;
	background-color: #fff;
	text-align: center;
	padding: 0px;
}
button:hover {
	background-color: #FE9A2E;
	color : #fff;
}
button[id^=open] {
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("button[id^=open]").click(function() {
			var a = "#area" + $(this).attr("id");
			a = a.replace("open", "");
			$(a).toggle();

			if($(this).html() == '▶') {
				$(this).html('▼');
			}else{
				$(this).html('▶');
			}
		});
	});
</script>
</head>
<body>

	<div class="bar">
		<div id="searchFilter" class="hearderFrm">
			<p style="color: #333333; font-size: 25px; padding-bottom: 10px">테마</p>

			<ul>
				<li><a href="search_filter.do?gservSub=명소">명소</a></li>
				<li><a href="search_filter.do?gservSub=이색투어">이색투어</a></li>
				<li><a href="search_filter.do?gservSub=문화">문화</a></li>
				<li><a href="search_filter.do?gservSub=자연">자연</a></li>
				<li><a href="search_filter.do?gservSub=액티비티">스포츠/액티비티</a></li>
				<li><a href="search_filter.do?gservSub=야경">야경</a></li>
				<li><a href="search_filter.do?gservSub=쇼핑">쇼핑</a></li>
				<li><a href="search_filter.do?gservSub=힐링">힐링</a></li>
				<li><a href="search_filter.do?gservSub=체험">체험</a></li>
				<li><a href="search_filter.do?gservSub=축제">축제</a></li>
				<li><a href="search_filter.do?gservSub=가족">가족여행</a></li>
				<li><a href="search_filter.do?gservSub=단체">단체여행</a></li>
				<li><a href="search_filter.do?gservSub=바다">바다</a></li>
				<li><a href="search_filter.do?gservSub=산">산</a></li>
				<li><a href="search_filter.do?gservSub=기차">기차</a></li>
			</ul>
			<br>
			<p style="color: #333333; font-size: 25px; padding-bottom: 10px">지역</p>

			<div id="areaCode">
				<button id="open01">▶</button>
				<a href="search_filter.do?areaCode=01">서울</a>
			</div>
			<ul id="area01">
				<li><a href="search_filter.do?areaCode=0101">종로구</a></li>
				<li><a href="search_filter.do?areaCode=0102">중구</a></li>
				<li><a href="search_filter.do?areaCode=0103">용산구</a></li>
				<li><a href="search_filter.do?areaCode=0104">성동구</a></li>
				<li><a href="search_filter.do?areaCode=0105">광진구</a></li>
				<li><a href="search_filter.do?areaCode=0106">동대문구</a></li>
				<li><a href="search_filter.do?areaCode=0107">중랑구</a></li>
				<li><a href="search_filter.do?areaCode=0108">성북구</a></li>
				<li><a href="search_filter.do?areaCode=0109">강북구</a></li>
				<li><a href="search_filter.do?areaCode=0110">도봉구</a></li>
				<li><a href="search_filter.do?areaCode=0111">노원구</a></li>
				<li><a href="search_filter.do?areaCode=0112">은평구</a></li>
				<li><a href="search_filter.do?areaCode=0113">서대문구</a></li>
				<li><a href="search_filter.do?areaCode=0114">마포구</a></li>
				<li><a href="search_filter.do?areaCode=0115">양천구</a></li>
				<li><a href="search_filter.do?areaCode=0116">강서구</a></li>
				<li><a href="search_filter.do?areaCode=0117">구로구</a></li>
				<li><a href="search_filter.do?areaCode=0118">금천구</a></li>
				<li><a href="search_filter.do?areaCode=0119">영등포구</a></li>
				<li><a href="search_filter.do?areaCode=0120">동작구</a></li>
				<li><a href="search_filter.do?areaCode=0121">관악구</a></li>
				<li><a href="search_filter.do?areaCode=0122">서초구</a></li>
				<li><a href="search_filter.do?areaCode=0123">강남구</a></li>
				<li><a href="search_filter.do?areaCode=0124">송파구</a></li>
				<li><a href="search_filter.do?areaCode=0125">강동구</a></li>
			</ul>

			<div id="areaCode">
				<button id="open02">▶</button>
				<a href="search_filter.do?areaCode=02">부산</a>
			</div>
			<ul id="area02">
				<li><a href="search_filter.do?areaCode=0201">중구</a></li>
				<li><a href="search_filter.do?areaCode=0202">서구</a></li>
				<li><a href="search_filter.do?areaCode=0203">동구</a></li>
				<li><a href="search_filter.do?areaCode=0204">영도구</a></li>
				<li><a href="search_filter.do?areaCode=0205">부산진구</a></li>
				<li><a href="search_filter.do?areaCode=0206">동래구</a></li>
				<li><a href="search_filter.do?areaCode=0207">남구</a></li>
				<li><a href="search_filter.do?areaCode=0208">북구</a></li>
				<li><a href="search_filter.do?areaCode=0209">강서구</a></li>
				<li><a href="search_filter.do?areaCode=0210">해운대구</a></li>
				<li><a href="search_filter.do?areaCode=0211">사하구</a></li>
				<li><a href="search_filter.do?areaCode=0212">금정구</a></li>
				<li><a href="search_filter.do?areaCode=0213">연제구</a></li>
				<li><a href="search_filter.do?areaCode=0214">수영구</a></li>
				<li><a href="search_filter.do?areaCode=0215">사상구</a></li>
				<li><a href="search_filter.do?areaCode=0216">기장군</a></li>
			</ul>
			<div id="areaCode">
				<button id="open03">▶</button>
				<a href="search_filter.do?areaCode=03">인천</a>
			</div>
			<ul id="area03">
				<li><a href="search_filter.do?areaCode=0301">중구</a></li>
				<li><a href="search_filter.do?areaCode=0302">동구</a></li>
				<li><a href="search_filter.do?areaCode=0303">남구</a></li>
				<li><a href="search_filter.do?areaCode=0304">연수구</a></li>
				<li><a href="search_filter.do?areaCode=0305">남동구</a></li>
				<li><a href="search_filter.do?areaCode=0306">부평구</a></li>
				<li><a href="search_filter.do?areaCode=0307">계양구</a></li>
				<li><a href="search_filter.do?areaCode=0308">서구</a></li>
				<li><a href="search_filter.do?areaCode=0309">강화군</a></li>
				<li><a href="search_filter.do?areaCode=0310">옹진군</a></li>
			</ul>
			<div id="areaCode">
				<button id="open04">▶</button>
				<a href="search_filter.do?areaCode=04">대구</a>
			</div>
			<ul id="area04">
				<li><a href="search_filter.do?areaCode=0401">중구</a></li>
				<li><a href="search_filter.do?areaCode=0402">동구</a></li>
				<li><a href="search_filter.do?areaCode=0403">서구</a></li>
				<li><a href="search_filter.do?areaCode=0404">남구</a></li>
				<li><a href="search_filter.do?areaCode=0405">북구</a></li>
				<li><a href="search_filter.do?areaCode=0406">수성구</a></li>
				<li><a href="search_filter.do?areaCode=0407">달서구</a></li>
				<li><a href="search_filter.do?areaCode=0408">달성군</a></li>
			</ul>

			<div id="areaCode">
				<button id="open05">▶</button>
				<a href="search_filter.do?areaCode=05">대전</a>
			</div>
			<ul id="area05">
				<li><a href="search_filter.do?areaCode=0501">동구</a></li>
				<li><a href="search_filter.do?areaCode=0502">중구</a></li>
				<li><a href="search_filter.do?areaCode=0503">서구</a></li>
				<li><a href="search_filter.do?areaCode=0504">유성구</a></li>
				<li><a href="search_filter.do?areaCode=0505">대덕구</a></li>
			</ul>


			<div id="areaCode">
				<button id="open06">▶</button>
				<a href="search_filter.do?areaCode=06">광주</a>
			</div>
			<ul id="area06">
				<li><a href="search_filter.do?areaCode=0601">동구</a></li>
				<li><a href="search_filter.do?areaCode=0602">서구</a></li>
				<li><a href="search_filter.do?areaCode=0603">남구</a></li>
				<li><a href="search_filter.do?areaCode=0604">북구</a></li>
				<li><a href="search_filter.do?areaCode=0605">광산구</a></li>
			</ul>


			<div id="areaCode">
				<button id="open07">▶</button>
				<a href="search_filter.do?areaCode=07">울산</a>
			</div>
			<ul id="area07">
				<li><a href="search_filter.do?areaCode=0701">중구</a></li>
				<li><a href="search_filter.do?areaCode=0702">남구</a></li>
				<li><a href="search_filter.do?areaCode=0703">동구</a></li>
				<li><a href="search_filter.do?areaCode=0704">북구</a></li>
				<li><a href="search_filter.do?areaCode=0705">울주군</a></li>
			</ul>
			<div id="areaCode">
				<button id="open08">▶</button>
				<a href="search_filter.do?areaCode=08">강원도</a>
			</div>
			<ul id="area08">
				<li><a href="search_filter.do?areaCode=0801">춘천시</a></li>
				<li><a href="search_filter.do?areaCode=0802">원주시</a></li>
				<li><a href="search_filter.do?areaCode=0803">강릉시</a></li>
				<li><a href="search_filter.do?areaCode=0804">동해시</a></li>
				<li><a href="search_filter.do?areaCode=0805">태백시</a></li>
				<li><a href="search_filter.do?areaCode=0806">속초시</a></li>
				<li><a href="search_filter.do?areaCode=0807">삼척시</a></li>
				<li><a href="search_filter.do?areaCode=0808">홍천군</a></li>
				<li><a href="search_filter.do?areaCode=0809">횡성군</a></li>
				<li><a href="search_filter.do?areaCode=0810">영월군</a></li>
				<li><a href="search_filter.do?areaCode=0811">평창군</a></li>
				<li><a href="search_filter.do?areaCode=0812">정선군</a></li>
				<li><a href="search_filter.do?areaCode=0813">철원군</a></li>
				<li><a href="search_filter.do?areaCode=0814">화천군</a></li>
				<li><a href="search_filter.do?areaCode=0815">양구군</a></li>
				<li><a href="search_filter.do?areaCode=0816">인제군</a></li>
				<li><a href="search_filter.do?areaCode=0817">고성군</a></li>
				<li><a href="search_filter.do?areaCode=0818">양양군</a></li>
			</ul>

			<div id="areaCode">
				<button id="open09">▶</button>
				<a href="search_filter.do?areaCode=09">경기도</a>
			</div>

			<ul id="area09">
				<li><a href="search_filter.do?areaCode=0901">수원시</a></li>
				<li><a href="search_filter.do?areaCode=0902">성남시</a></li>
				<li><a href="search_filter.do?areaCode=0903">의정부시</a></li>
				<li><a href="search_filter.do?areaCode=0904">안양시</a></li>
				<li><a href="search_filter.do?areaCode=0905">부천시</a></li>
				<li><a href="search_filter.do?areaCode=0906">광명시</a></li>
				<li><a href="search_filter.do?areaCode=0907">평택시</a></li>
				<li><a href="search_filter.do?areaCode=0908">동두천시</a></li>
				<li><a href="search_filter.do?areaCode=0909">안산시</a></li>
				<li><a href="search_filter.do?areaCode=0910">고양시</a></li>
				<li><a href="search_filter.do?areaCode=0911">과천시</a></li>
				<li><a href="search_filter.do?areaCode=0912">구리시</a></li>
				<li><a href="search_filter.do?areaCode=0913">남양주시</a></li>
				<li><a href="search_filter.do?areaCode=0914">오산시</a></li>
				<li><a href="search_filter.do?areaCode=0915">시흥시</a></li>
				<li><a href="search_filter.do?areaCode=0916">군포시</a></li>
				<li><a href="search_filter.do?areaCode=0917">의왕시</a></li>
				<li><a href="search_filter.do?areaCode=0918">하남시</a></li>
				<li><a href="search_filter.do?areaCode=0919">용인시</a></li>
				<li><a href="search_filter.do?areaCode=0920">파주시</a></li>
				<li><a href="search_filter.do?areaCode=0921">이천시</a></li>
				<li><a href="search_filter.do?areaCode=0922">안성시</a></li>
				<li><a href="search_filter.do?areaCode=0923">김포시</a></li>
				<li><a href="search_filter.do?areaCode=0924">화성시</a></li>
				<li><a href="search_filter.do?areaCode=0925">광주시</a></li>
				<li><a href="search_filter.do?areaCode=0926">양주시</a></li>
				<li><a href="search_filter.do?areaCode=0927">포천시</a></li>
				<li><a href="search_filter.do?areaCode=0928">여주시</a></li>
				<li><a href="search_filter.do?areaCode=0929">연천군</a></li>
				<li><a href="search_filter.do?areaCode=0930">가평군</a></li>
				<li><a href="search_filter.do?areaCode=0931">양평군</a></li>
			</ul>

			<div id="areaCode">
				<button id="open10">▶</button>
				<a href="search_filter.do?areaCode=10">충청북도</a>
				</li>
			</div>
			<ul id="area10">
				<li><a href="search_filter.do?areaCode=1001">청주시</a></li>
				<li><a href="search_filter.do?areaCode=1002">충주시</a></li>
				<li><a href="search_filter.do?areaCode=1003">제천시</a></li>
				<li><a href="search_filter.do?areaCode=1004">보은군</a></li>
				<li><a href="search_filter.do?areaCode=1005">옥천군</a></li>
				<li><a href="search_filter.do?areaCode=1006">영동군</a></li>
				<li><a href="search_filter.do?areaCode=1007">증평군</a></li>
				<li><a href="search_filter.do?areaCode=1008">진천군</a></li>
				<li><a href="search_filter.do?areaCode=1009">괴산군</a></li>
				<li><a href="search_filter.do?areaCode=1010">음성군</a></li>
				<li><a href="search_filter.do?areaCode=1011">단양군</a></li>
			</ul>

			<div id="areaCode">
				<button id="open11">▶</button>
				<a href="search_filter.do?areaCode=11">충청남도</a>
				</li>
			</div>
			<ul id="area11">
				<li><a href="search_filter.do?areaCode=1101">천안시</a></li>
				<li><a href="search_filter.do?areaCode=1102">공주시</a></li>
				<li><a href="search_filter.do?areaCode=1103">보령시</a></li>
				<li><a href="search_filter.do?areaCode=1104">아산시</a></li>
				<li><a href="search_filter.do?areaCode=1105">서산시</a></li>
				<li><a href="search_filter.do?areaCode=1106">논산시</a></li>
				<li><a href="search_filter.do?areaCode=1107">계룡시</a></li>
				<li><a href="search_filter.do?areaCode=1108">당진시</a></li>
				<li><a href="search_filter.do?areaCode=1109">금산군</a></li>
				<li><a href="search_filter.do?areaCode=1110">부여군</a></li>
				<li><a href="search_filter.do?areaCode=1111">서천군</a></li>
				<li><a href="search_filter.do?areaCode=1112">청양군</a></li>
				<li><a href="search_filter.do?areaCode=1113">홍성군</a></li>
				<li><a href="search_filter.do?areaCode=1114">예산군</a></li>
				<li><a href="search_filter.do?areaCode=1115">태안군</a></li>
			</ul>

			<div id="areaCode">
				<button id="open12">▶</button>
				<a href="search_filter.do?areaCode=12">경상북도</a>
				</li>
			</div>
			<ul id="area12">
				<li><a href="search_filter.do?areaCode=1201">포항시</a></li>
				<li><a href="search_filter.do?areaCode=1202">경주시</a></li>
				<li><a href="search_filter.do?areaCode=1203">김천시</a></li>
				<li><a href="search_filter.do?areaCode=1204">안동시</a></li>
				<li><a href="search_filter.do?areaCode=1205">구미시</a></li>
				<li><a href="search_filter.do?areaCode=1206">영주시</a></li>
				<li><a href="search_filter.do?areaCode=1207">영천시</a></li>
				<li><a href="search_filter.do?areaCode=1208">상주시</a></li>
				<li><a href="search_filter.do?areaCode=1209">문경시</a></li>
				<li><a href="search_filter.do?areaCode=1210">경산시</a></li>
				<li><a href="search_filter.do?areaCode=1211">군위군</a></li>
				<li><a href="search_filter.do?areaCode=1212">의성군</a></li>
				<li><a href="search_filter.do?areaCode=1213">청송군</a></li>
				<li><a href="search_filter.do?areaCode=1214">양양군</a></li>
				<li><a href="search_filter.do?areaCode=1215">영덕군</a></li>
				<li><a href="search_filter.do?areaCode=1216">청도군</a></li>
				<li><a href="search_filter.do?areaCode=1217">고령군</a></li>
				<li><a href="search_filter.do?areaCode=1218">성주군</a></li>
				<li><a href="search_filter.do?areaCode=1219">칠곡군</a></li>
				<li><a href="search_filter.do?areaCode=1220">예천군</a></li>
				<li><a href="search_filter.do?areaCode=1221">봉화군</a></li>
				<li><a href="search_filter.do?areaCode=1222">울진군</a></li>
				<li><a href="search_filter.do?areaCode=1223">울릉군</a></li>
			</ul>

			<div id="areaCode">
				<button id="open13">▶</button>
				<a href="search_filter.do?areaCode=13">경상남도</a>
				</li>
			</div>
			<ul id="area13">
				<li><a href="search_filter.do?areaCode=1301">창원시</a></li>
				<li><a href="search_filter.do?areaCode=1302">김해시</a></li>
				<li><a href="search_filter.do?areaCode=1303">진주시</a></li>
				<li><a href="search_filter.do?areaCode=1304">양산시</a></li>
				<li><a href="search_filter.do?areaCode=1305">거제시</a></li>
				<li><a href="search_filter.do?areaCode=1306">통영시</a></li>
				<li><a href="search_filter.do?areaCode=1307">사천시</a></li>
				<li><a href="search_filter.do?areaCode=1308">밀양시</a></li>
				<li><a href="search_filter.do?areaCode=1309">함안군</a></li>
				<li><a href="search_filter.do?areaCode=1310">거창군</a></li>
				<li><a href="search_filter.do?areaCode=1311">창녕군</a></li>
				<li><a href="search_filter.do?areaCode=1312">고성군</a></li>
				<li><a href="search_filter.do?areaCode=1313">하동군</a></li>
				<li><a href="search_filter.do?areaCode=1314">합천군</a></li>
				<li><a href="search_filter.do?areaCode=1315">남해군</a></li>
				<li><a href="search_filter.do?areaCode=1316">함양군</a></li>
				<li><a href="search_filter.do?areaCode=1317">산청군</a></li>
				<li><a href="search_filter.do?areaCode=1318">의령군</a></li>
			</ul>

			<div id="areaCode">
				<button id="open14">▶</button>
				<a href="search_filter.do?areaCode=14">전라북도</a>
				</li>
			</div>
			<ul id="area14">
				<li><a href="search_filter.do?areaCode=1401">전주시</a></li>
				<li><a href="search_filter.do?areaCode=1402">익산시</a></li>
				<li><a href="search_filter.do?areaCode=1403">군산시</a></li>
				<li><a href="search_filter.do?areaCode=1404">정읍시</a></li>
				<li><a href="search_filter.do?areaCode=1405">김제시</a></li>
				<li><a href="search_filter.do?areaCode=1406">남원시</a></li>
				<li><a href="search_filter.do?areaCode=1407">완주군</a></li>
				<li><a href="search_filter.do?areaCode=1408">고창군</a></li>
				<li><a href="search_filter.do?areaCode=1409">부안군</a></li>
				<li><a href="search_filter.do?areaCode=1410">임실군</a></li>
				<li><a href="search_filter.do?areaCode=1411">순창군</a></li>
				<li><a href="search_filter.do?areaCode=1412">진안군</a></li>
				<li><a href="search_filter.do?areaCode=1413">무주군</a></li>
				<li><a href="search_filter.do?areaCode=1414">장수군</a></li>
			</ul>

			<div id="areaCode">
				<button id="open15">▶</button>
				<a href="search_filter.do?areaCode=15">전라남도</a>
				</li>
			</div>
			<ul id="area15">
				<li><a href="search_filter.do?areaCode=1501">목포시</a></li>
				<li><a href="search_filter.do?areaCode=1502">여수시</a></li>
				<li><a href="search_filter.do?areaCode=1503">순천시</a></li>
				<li><a href="search_filter.do?areaCode=1504">나주시</a></li>
				<li><a href="search_filter.do?areaCode=1505">광양시</a></li>
				<li><a href="search_filter.do?areaCode=1506">담양군</a></li>
				<li><a href="search_filter.do?areaCode=1507">곡성군</a></li>
				<li><a href="search_filter.do?areaCode=1508">구례군</a></li>
				<li><a href="search_filter.do?areaCode=1509">고흥군</a></li>
				<li><a href="search_filter.do?areaCode=1510">보성군</a></li>
				<li><a href="search_filter.do?areaCode=1511">화순군</a></li>
				<li><a href="search_filter.do?areaCode=1512">장흥군</a></li>
				<li><a href="search_filter.do?areaCode=1513">강진군</a></li>
				<li><a href="search_filter.do?areaCode=1514">해남군</a></li>
				<li><a href="search_filter.do?areaCode=1515">영암군</a></li>
				<li><a href="search_filter.do?areaCode=1516">무안군</a></li>
				<li><a href="search_filter.do?areaCode=1517">함평군</a></li>
				<li><a href="search_filter.do?areaCode=1518">영광군</a></li>
				<li><a href="search_filter.do?areaCode=1519">장성군</a></li>
				<li><a href="search_filter.do?areaCode=1520">완도군</a></li>
				<li><a href="search_filter.do?areaCode=1521">진도군</a></li>
				<li><a href="search_filter.do?areaCode=1522">신안군</a></li>
			</ul>


			<div id="areaCode">
				<button id="open16">▶</button>
				<a href="search_filter.do?areaCode=16">제주도</a>
				</li>
			</div>
			<ul id="area16">
				<li><a href="search_filter.do?areaCode=1601">제주시</a></li>
				<li><a href="search_filter.do?areaCode=1602">서귀포시</a></li>
			</ul>
		</div>
	</div>
</body>
</html>