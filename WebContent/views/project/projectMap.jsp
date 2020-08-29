<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
<head>

	
	<style type="text/css">
	  .tooltipUI{
	    background-color:#FAF4C0;
	  }
	  .ui-tooltip {
	    padding: 8px;
	    position: absolute;
	    z-index: 999999;
	    color : #fff;
	    font-size : 12px;
	    max-width: 600px;
	    -webkit-box-shadow: 0 0 5px #aaa;
	    box-shadow: 0 0 5px #aaa;
		/* for IE */
		filter:alpha(opacity=80);
		/* CSS3 standard */
		opacity:0.8;
		line-height:16px;
	  }
	  body .ui-tooltip {
	    border-width: 2px;
	  }
      #projectList
    {
        border: 1px solid black;
        height: 400px;
        overflow: scroll;
        overflow: auto;
        overflow-x: hidden;
    }
    #now
    {
        border: 1px solid black;
        width: 500px;
        height: 50px;
        padding: 10px;
        font-size: 30px;
        font-weight: bolder;
        text-align: center;
        display: inline-block;
    }

    #info
    {
        border: 1px solid black;
        width: 500px;
        height: 125px;
        font-size: 20px;
        text-align: center;
        display: inline-block;
    }
    #content{margin: 12% 0% 7% 18%; width: 80%;}
    #seoul{height: 400px; background: white; display: inline-block; padding: 1px;}
    #projectList{display: inline-block; float: left;}
	
    </style>
    
   	<%@ include file="../common/header.jsp" %>
	
    <!-- 네비게이션바 -->
	<style type="text/css">	  
	  #f_management{display:none;}
	  #p_management{display:none;}
	  #profile{display:none;}
	  #suggestion{display:none;}
	  #login{display:none;}
	</style>

</head>


<body>


	<%@ include file="../common/header.jsp" %>


		
<style type="text/css">
.gm-style-cc {display: none !important;}
.gm-style a[href^="https://maps.google.com/maps"] {display: none !important;}
</style>

<script type="text/javascript" src="../resources/freemon/project/projectMap5652.js?version=1.4"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDf3Pp-ktLrmZ_H9latDzkKXJuSCJi9KO0&amp;callback=initMap" async defer></script>
<script type="text/javascript">
	function initMap()
	{	
		freemon.invoker.invoke("projectMap", "mapinfo", {'lat' : '', 'lng' : ''});
	}
</script>
<script src="../resources/freemon/mapClusterer.js"></script>

<div id="content">
        <h1 style="margin: 15px">프로젝트 맵</h1>
        <div id="projectList">
            <div id="now">2020. 08 시작 프로젝트</div><br>
            <div id="info">
                <p>KH Education</p>
                <p>스마트 콘텐츠 융합 응용SW 엔지니어 양성과정</p>
                <p>20.05.07~20.12.08 (7개월)</p>
                <p>서울시 강남구</p>
                <p>450만원</p>
                <p>JAVA, SQL, HTML, JDBC</p>
            </div>
            <br>
            <div id="info">
                <p>KH Education</p>
                <p>스마트 콘텐츠 융합 응용SW 엔지니어 양성과정</p>
                <p>20.05.07~20.12.08 (7개월)</p>
                <p>서울시 강남구</p>
                <p>450만원</p>
                <p>JAVA, SQL, HTML, JDBC</p>
            </div>
            <br>
            <div id="info">
                <p>KH Education</p>
                <p>스마트 콘텐츠 융합 응용SW 엔지니어 양성과정</p>
                <p>20.05.07~20.12.08 (7개월)</p>
                <p>서울시 강남구</p>
                <p>450만원</p>
                <p>JAVA, SQL, HTML, JDBC</p>
            </div>
            <br>
            <div id="info">
                <p>KH Education</p>
                <p>스마트 콘텐츠 융합 응용SW 엔지니어 양성과정</p>
                <p>20.05.07~20.12.08 (7개월)</p>
                <p>서울시 강남구</p>
                <p>450만원</p>
                <p>JAVA, SQL, HTML, JDBC</p>
            </div>
            <br>
            <div id="info">
                <p>KH Education</p>
                <p>스마트 콘텐츠 융합 응용SW 엔지니어 양성과정</p>
                <p>20.05.07~20.12.08 (7개월)</p>
                <p>서울시 강남구</p>
                <p>450만원</p>
                <p>JAVA, SQL, HTML, JDBC</p>
            </div>
        </div>
        <!-- 지도 -->
        <div id="seoul">
            <img src="../../resources/images/map/img_map_default.gif" alt="서울시 지도" usemap="#seoulMap" id="seoul-map-image" width="550px" height="350px" onClick="javascript:getLoc()"/>
            <map name="seoulMap" id="seoulMap">
                <area shape="poly"
                    coords="113,130,112,133,117,141,113,150,99,162,94,171,91,172,92,177,89,183,80,184,89,194,111,202,111,210,121,201,128,204,140,204,144,194,150,207,156,221,179,216,180,192,196,195,190,183,185,175,170,169,150,148,129,138"
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()" onfocus="fn_ShowSeoulGu(1);"
                    onmouseover="fn_ShowSeoulGu(1);" href="javascript:fn_locationMove(11500, '강서구')"
                    alt="강서구" title="강서구" />
                <area shape="poly"
                    coords="138,205,143,194,156,220,179,217,179,189,186,195,195,194,203,209,201,217,192,222,193,233,186,247,177,245,176,240,162,240,152,250,148,248,144,241,138,244,137,231,144,219,137,215,137,208"
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()" onfocus="fn_ShowSeoulGu(2);"
                    onmouseover="fn_ShowSeoulGu(2);" href="javascript:fn_locationMove(11470, '양천구')"
                    alt="양천구" title="양천구" />
                <area shape="poly"
                    coords="128,259,135,254,138,244,145,241,150,250,163,241,176,241,177,244,186,247,193,232,207,243,205,253,211,269,215,271,212,278,206,279,187,267,182,260,165,275,161,285,150,285,148,280,145,283,131,286,133,275,133,271,138,267,128,260"
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()" onfocus="fn_ShowSeoulGu(3);"
                    onmouseover="fn_ShowSeoulGu(3);" href="javascript:fn_locationMove(11530, '구로구')"
                    alt="구로구" title="구로구" />
                <area shape="poly"
                    coords="189,184,196,193,203,210,194,221,193,233,204,238,208,247,211,268,216,270,225,255,232,255,237,233,248,233,243,220,236,212,226,208,220,205,199,190"
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()" onfocus="fn_ShowSeoulGu(4);"
                    onmouseover="fn_ShowSeoulGu(4);" href="javascript:fn_locationMove(11560, '영등포구')"
                    alt="영등포구" title="영등포구" />
                <area shape="poly"
                    coords="186,273,191,269,206,280,222,276,228,294,227,305,233,306,242,313,233,324,225,328,220,336,215,335,209,326,206,317,207,314,201,311,198,308,201,302,196,301,193,288,191,284"
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()" onfocus="fn_ShowSeoulGu(5);"
                    onmouseover="fn_ShowSeoulGu(5);" href="javascript:fn_locationMove(11545, '금천구')"
                    alt="금천구" title="금천구" />
                <area shape="poly"
                    coords="212,279,216,270,224,269,228,266,237,264,239,259,252,263,256,261,263,261,267,264,271,261,275,275,281,282,291,280,294,289,299,292,297,305,292,304,288,312,284,317,276,320,275,324,269,328,261,328,251,332,249,325,243,321,241,314,234,306,227,304,226,293,227,285,223,277,218,277"
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()" onfocus="fn_ShowSeoulGu(6);"
                    onmouseover="fn_ShowSeoulGu(6);" href="javascript:fn_locationMove(11620, '관악구')"
                    alt="관악구" title="관악구" />
                <area shape="poly"
                    coords="215,272,225,257,233,254,239,234,250,233,258,237,272,236,281,243,288,246,289,247,295,252,291,281,283,283,274,276,272,261,269,264,258,261,248,263,239,260,238,265,227,267"
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()" onfocus="fn_ShowSeoulGu(7);"
                    onmouseover="fn_ShowSeoulGu(7);" href="javascript:fn_locationMove(11590, '동작구')"
                    alt="동작구" title="동작구" />
                <area shape="poly" coords="288,248,293,253,293,265,293,267,291,283,295,291,298,294,297,305,306,299,305,293,314,294,320,306,325,308,336,304,339,296,344,296,344,304,345,312,347,318,346,324,343,328,348,329,355,335,359,341,368,340,375,340,379,337,379,330,378,326,384,325,389,326,396,321,396,315,399,308,402,304,397,299,396,294,391,288,391,285,384,284,377,290,364,292,361,287,354,283,350,271,343,273,333,247,327,228,326,224,323,227,314,239,305,246,293,248"
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(8);" onmouseover="fn_ShowSeoulGu(8);"
                    href="javascript:fn_locationMove(11650, '서초구')" alt="서초구" title="서초구" />
                <area shape="poly" 
                    coords="323,222,329,230,329,237,332,244,338,258,344,273,352,271,355,282,363,289,366,292,380,289,387,284,392,283,398,294,399,300,402,303,409,304,409,299,423,303,429,292,422,282,418,271,408,259,393,253,375,249,375,225,355,216,344,212,334,215" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(9);" onmouseover="fn_ShowSeoulGu(9);"
                    href="javascript:fn_locationMove(11680, '강남구')" alt="강남구" title="강남구" />
                <area shape="poly" 
                    coords="375,226,378,249,397,255,409,259,416,265,419,273,422,279,427,289,430,293,438,291,436,286,437,283,441,283,444,285,454,278,457,267,464,263,464,257,465,253,460,252,458,247,450,249,446,246,445,241,448,231,426,219,429,205,416,201,412,205,406,216,396,223,384,226,375,224" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(10);" onmouseover="fn_ShowSeoulGu(10);"
                    href="javascript:fn_locationMove(11710, '송파구')" alt="송파구" title="송파구" />
                <area shape="poly" 
                    coords="417,199,429,205,426,219,450,232,454,227,456,218,459,215,459,210,467,198,486,196,489,189,484,188,484,177,482,168,478,157,471,156,468,157,457,166,446,167,432,171,421,182,418,193,417,197" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(11);" onmouseover="fn_ShowSeoulGu(11);"
                    href="javascript:fn_locationMove(11740, '강동구')" alt="강동구" title="강동구" />
                <area shape="poly" 
                    coords="367,212,372,203,375,193,380,184,380,176,387,165,394,168,406,163,410,161,412,164,410,171,409,178,410,186,408,199,399,213,391,218,381,219,372,217" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(12);" onmouseover="fn_ShowSeoulGu(12);"
                    href="javascript:fn_locationMove(11215, '광진구')" alt="광진구" title="광진구" />
                <area shape="poly" 
                    coords="378,110,378,122,380,129,377,134,379,147,383,152,386,166,396,168,410,161,410,156,417,149,417,143,425,137,422,131,425,124,423,116,425,113,424,106,414,102,408,105,395,108,395,104,383,108" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(13);" onmouseover="fn_ShowSeoulGu(13);"
                    href="javascript:fn_locationMove(11260, '중랑구')" alt="중랑구" title="중랑구" />
                <area shape="poly" 
                    coords="359,22,360,34,356,45,359,55,362,70,365,72,363,81,359,75,354,81,351,93,356,96,358,101,367,110,379,112,395,105,401,108,414,102,413,97,418,91,417,77,411,73,405,73,401,70,400,63,399,58,403,51,403,42,401,36,400,30,403,25,403,19,394,17,389,9,380,11,374,14,368,14" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(14);" onmouseover="fn_ShowSeoulGu(14);"
                    href="javascript:fn_locationMove(11350, '노원구')" alt="노원구" title="노원구" />
                <area shape="poly" 
                    coords="318,25,318,31,327,42,325,54,324,57,324,70,331,70,340,77,343,84,347,85,351,94,353,85,359,76,362,79,364,73,362,69,362,62,359,51,356,42,359,31,360,23,358,14,354,14,350,12,340,16,339,6,333,6,325,5,323,9,320,9,316,13,316,21" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(15);" onmouseover="fn_ShowSeoulGu(15);"
                    href="javascript:fn_locationMove(11320, '도봉구')" alt="도봉구" title="도봉구" />
                <area shape="poly" 
                    coords="317,24,318,31,327,42,325,55,324,69,332,71,342,78,349,91,357,96,357,101,353,107,343,114,344,118,341,119,331,117,327,111,321,110,315,100,310,99,307,93,295,85,295,81,292,77,295,72,288,64,289,59,295,56,294,53,301,49,303,44,299,33,303,28,308,25" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(16);" onmouseover="fn_ShowSeoulGu(16);"
                    href="javascript:fn_locationMove(11305, '강북구')" alt="강북구" title="강북구" />
                <area shape="poly" 
                    coords="295,84,284,94,290,96,297,124,288,130,300,140,311,138,319,153,326,151,328,156,334,154,346,139,349,134,357,134,359,127,363,130,368,128,368,125,379,120,378,110,372,110,364,105,357,97,353,107,346,111,343,118,337,115,331,116,320,108,315,100,305,93" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(17);" onmouseover="fn_ShowSeoulGu(17);"
                    href="javascript:fn_locationMove(11290, '성북구')" alt="성북구" title="성북구" />
                <area shape="poly" 
                    coords="332,156,332,163,339,167,349,161,367,176,380,179,386,164,385,152,379,145,377,133,380,127,379,121,369,124,367,130,363,130,359,128,356,134,350,134,349,138,340,150" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(18);" onmouseover="fn_ShowSeoulGu(18);"
                    href="javascript:fn_locationMove(11230, '동대문구')" alt="동대문구" title="동대문구" />
                <area shape="poly" 
                    coords="366,213,374,196,380,182,380,179,366,176,361,170,356,165,350,163,340,167,333,165,333,173,336,173,333,179,326,183,326,189,319,195,319,204,324,205,325,212,335,205,343,205,354,207,362,210" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(19);" onmouseover="fn_ShowSeoulGu(19);"
                    href="javascript:fn_locationMove(11200, '성동구')" alt="성동구" title="성동구" />
                <area shape="poly" 
                    coords="325,212,324,205,318,204,319,199,314,198,314,191,310,191,307,194,302,190,297,189,294,187,288,187,283,187,280,185,274,188,275,192,272,196,270,198,270,202,265,206,259,210,258,210,263,213,276,223,282,232,293,239,302,237,308,232,310,228,316,221" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(20);" onmouseover="fn_ShowSeoulGu(20);"
                    href="javascript:fn_locationMove(11170, '용산구')" alt="용산구" title="용산구" />
                <area shape="poly" 
                    coords="273,190,272,186,275,179,281,176,278,169,285,166,290,168,293,167,300,169,308,168,314,166,322,167,332,164,331,171,335,173,335,176,331,179,327,181,325,189,321,192,319,196,316,197,314,190,310,191,305,194,302,190,297,189,295,187,289,186,282,187,279,184,276,186" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(21);" onmouseover="fn_ShowSeoulGu(21);"
                    href="javascript:fn_locationMove(11140, '중구')" alt="중구" title="중구" />
                <area shape="poly" 
                    coords="285,92,279,91,269,95,261,100,263,118,265,124,265,129,271,133,269,152,263,155,279,172,281,167,288,167,300,169,307,168,324,167,332,163,331,154,328,156,325,151,319,154,313,140,300,140,288,132,288,128,296,125,296,114,291,102,290,97" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(22);" onmouseover="fn_ShowSeoulGu(22);"
                    href="javascript:fn_locationMove(11110, '종로구')" alt="종로구" title="종로구" />
                <area shape="poly" 
                    coords="217,69,221,76,221,85,216,90,220,95,212,111,211,141,202,142,202,136,196,142,215,158,226,145,228,150,233,150,234,146,239,143,243,134,252,130,251,126,262,117,262,99,284,90,280,80,275,75,270,64,263,61,260,57,255,56,248,64,238,71,228,72" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(23);" onmouseover="fn_ShowSeoulGu(23);"
                    href="javascript:fn_locationMove(11380, '은평구')" alt="은평구" title="은평구" />
                <area shape="poly" 
                    coords="216,160,226,167,235,170,239,173,240,180,249,185,254,182,271,182,281,176,265,153,268,153,271,144,269,143,271,133,265,129,265,123,263,119,253,125,253,130,246,133,242,140,239,144,233,150,230,150,227,145,221,154" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(24);" onmouseover="fn_ShowSeoulGu(24);"
                    href="javascript:fn_locationMove(11410, '서대문구')" alt="서대문구" title="서대문구" />
                <area shape="poly" 
                    coords="174,160,180,159,184,155,191,156,192,148,197,142,207,151,216,160,227,168,234,171,240,173,241,179,250,185,254,182,263,184,274,181,272,187,276,193,271,196,269,201,264,207,256,209,246,204,239,204,230,203,219,196,205,185,198,179,188,169,187,166" 
                    onmouseout="fn_SeoulGuOut()" onblur="fn_SeoulGuOut()"
                    onfocus="fn_ShowSeoulGu(25);" onmouseover="fn_ShowSeoulGu(25);"
                    href="javascript:fn_locationMove(11440, '마포구')" alt="마포구" title="마포구" />
            </map>
        </div>
    </div>
    <!-- //지도 -->

    <script type="text/javascript">
        // 마우스 위치 이벤트
        var _seoul_gu_over = false;

        // 마우스가 지도 위에 없을때
        function fn_SeoulGuOut()
        {
            _seoul_gu_over = false;
            setTimeout(function ()
            {
                if (_seoul_gu_over == false) $('#seoul-map-image').attr('src', '../../resources/images/map/img_map_default.gif');
            }, 500);
        }

        // 마우스가 지도 위에 있을 때
        function fn_ShowSeoulGu(n)
        {
            _seoul_gu_over = true;
            $('#seoul-map-image').attr('src', '../../resources/images/map/img_map_s' + n + '.gif');
        }
    </script>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>