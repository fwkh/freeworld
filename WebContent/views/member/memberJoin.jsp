<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <%@ include file="../common/header.jsp" %>

    <!-- 네비게이션바 -->
    <style type="text/css">
        #f_management {
            display: none;
        }

        #p_management {
            display: none;
        }

        #profile {
            display: none;
        }

        #suggestion {
            display: none;
        }
        #logout{display:none;}
    </style>


    <style type="text/css">
        #signup_wrapper {
            margin: auto;
            /* border: 1px solid black; */
            height: 650px;
            width: 60%;
            padding: 30px;
        }


        #input_id1 {
            background: cornflowerblue;
            height: 35px;
        }
        #input_id2 {
            background: cornflowerblue;
            height: 35px;
        }

        #id_wrapper {
            width: 50%;
            height: 500px;
            /* background:yellow; */
            display: inline-block;
            position: relative;
            top: 60px;
            left: 100px;
        }

        #id_wrapper2 {
            position: relative;
            width: 50%;
            height: 500px;
            left: 100px;
            top: 60px;
            /* background:yellow; */
            float: right;
        }

        #signup {
            position: relative;
            top: 25px;
            font-size: 45px;
        }

        #input_pass1 {
            background: cornflowerblue;
            width: 300px;
            height: 35px;
        }
        #input_pass2 {
            background: cornflowerblue;
            width: 300px;
            height: 35px;
        }

        #yy {
            background: cornflowerblue;
            height: 35px;
            width: 75px;
        }

        #mm {
            background: cornflowerblue;
            height: 35px;
            width: 75px;
        }

        #dd {
            background: cornflowerblue;
            height: 35px;
            width: 75px;
        }

        #sector_area, #sector_hope, #sector_hope_ch {
            background: cornflowerblue;
            height: 35px;
            width: 75px;
        }

        #sector_ch {
            background: cornflowerblue;
            height: 35px;
            width: 100px;
        }

        #tech1, #tech2, #tech3{
            background: cornflowerblue;
            height: 35px;
            width: 75px;
        }

        #tech1_year,#tech2_year,#tech3_year {
            background: cornflowerblue;
            height: 35px;
            width: 100px;
        }



        #tel1 {
            background: cornflowerblue;
            height: 35px;
            width: 75px;
        }

        #tel2 {
            background: cornflowerblue;
            height: 35px;
            width: 75px;
            text-align: center;
        }

        #tel3 {
            background: cornflowerblue;
            height: 35px;
            width: 75px;
            text-align: center;
        }

        #date {
            background: cornflowerblue;
            height: 35px;
            width: 150px;
            text-align: center;

        }

        #complete {
            border: 2px solid silver;
            width: 170px;
            height: 50px;
            background: lightskyblue;
            text-align: center;
            position: relative;
            top: 40px;
            left: 80px;

        }

        #complete > a {
            position: relative;
            top: 30%;
            font-size: 30px;
            /* text-align: center; */
        }
    </style>


</head>
<body>


<!-- Google Tag Manager (noscript) -->
<noscript>
    <iframe src="http://www.googletagmanager.com/ns.html?id=GTM-MF7LK3J"
            height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->

<div class="load_box" style="display:none;">
    <div class="load_img"><img src="../resources/images/common/loading.gif" alt="loading"/></div>
</div>


<script type="text/javascript" src="../resources/freemon/login/freemonLogin069b.js?version=1.1"></script>

<script type="text/javascript">
    $(function () {
        freemon.invoker.invoke("freemonLogin");

        $('.login_box #login_tab > ul > li').bind("click", function () {
            $(this).children("a").removeAttr('href');
            if ($(this).attr("id") == 'tab_con') {

            } else {
                $('.login_box #login_tab > ul').children("li").removeClass("active");
                $(this).addClass("active");
                $('.login_box .tab_con').hide();
                $('.login_box #con_' + $(this).attr("id")).show();
            }
        });
        $('.btn_person').bind("click", function () {
            $(this).children("a").removeAttr('href');
            $('.login_box #login_tab > ul').children("li").removeClass("active");
            $('.login_box #tab1').addClass("active");
            $('.login_box .tab_con').hide();
            $('.login_box #con_tab1').show();
        });
        $('.btn_company').bind("click", function () {
            $(this).children("a").removeAttr('href');
            $('.login_box #login_tab > ul').children("li").removeClass("active");
            $('.login_box #tab2').addClass("active");
            $('.login_box .tab_con').hide();
            $('.login_box #con_tab2').show();
        });

        $('.idfind_box #login_tab > ul > li').bind("click", function () {
            $(this).children("a").removeAttr('href');
            if ($(this).attr("id") == 'tab_con') {

            } else {
                $('.idfind_box #login_tab > ul').children("li").removeClass("active");
                $(this).addClass("active");
                $('.idfind_box .tab_con').hide();
                $('.idfind_box #con_' + $(this).attr("id")).show();
            }
        });
    });
</script>

<!--Contents-->
<form action="${pageContext.request.contextPath}/memInsert.me" method="post">
    <div id="container">
        <div id="signup_wrapper">
            <h1 style="text-align: center;" id="signup">회원가입</h1>
            <div id="id_wrapper">
                <h3 style="margin: 10px;">*아이디(이메일형식)</h3>
                <input type="email" id="input_id1" name="email">&nbsp;
                <button type="submit" id="id_check">중복확인</button>
                <h3 style="margin: 10px;">*비밀번호</h3>
                <input type="password" id="input_pass1" name="pwd" placeholder="비밀번호(숫자,영문,특수문자 조합 최소 8자)">&nbsp;
                <h3 style="margin: 10px;">*생년월일</h3>
                <input type="date" id="birth" name="birth" style="background: cornflowerblue; height: 40px;">

                <h3 style="margin: 10px;">*희망지역</h3>
                <select id="sector_hope">
                    <option value="">시</option>
                    <option value="seoul">
                        서울
                    </option>

                </select>
                &nbsp;&nbsp;
                <select id="sector_hope_ch" name="sector_hope_ch">
                    <option value="notselect">구</option>
                    <option value="종로구">종로구</option>
                    <option value="중구">중구</option>
                    <option value="용산구">용산구</option>
                    <option value="성동구">성동구</option>
                    <option value="광진구">광진구</option>
                    <option value="동대문구">동대문구</option>
                    <option value="중랑구">중랑구</option>
                    <option value="성북구">성북구</option>
                    <option value="강북구">강북구</option>
                    <option value="도봉구">도봉구</option>
                    <option value="노원구">노원구</option>
                    <option value="은평구">은평구</option>
                    <option value="서대문구">서대문구</option>
                    <option value="양천구">양천구</option>
                    <option value="강서구">강서구</option>
                    <option value="구로구">구로구</option>
                    <option value="금천구">금천구</option>
                    <option value="영등포구">영등포구</option>
                    <option value="동작구">동작구</option>
                    <option value="관악구">관악구</option>
                    <option value="서초구">서초구</option>
                    <option value="강남구">강남구</option>
                    <option value="송파구">송파구</option>
                    <option value="강동구">강동구</option>
                    <option value="마포구">마포구</option>

                </select>
                <h3 style="margin: 10px;">*보유기술</h3>
                <select id="tech1">
                    <option value="">1순위</option>
                    <option value="JSP">JSP</option>
                    <option value="PHP">PHP</option>
                    <option value="ASP.NET">ASP.NET</option>
                    <option value="ASP">ASP</option>
                    <option value="JavaScript">JavaScript</option>
                    <option value="Ajax">Ajax</option>
                    <option value="Jquery">Jquery</option>
                    <option value="NodeJS">NodeJS</option>
                    <option value="Vue.js">Vue.js</option>
                    <option value="React.js">React.js</option>
                    <option value="Ruby">Ruby</option>
                    <option value="RubyonRails">RubyonRails</option>
                    <option value="MiPlatform">MiPlatform</option>
                    <option value="Nexacro">Nexacro</option>
                    <option value="XPLATFORM">XPLATFORM</option>
                    <option value="GO">GO</option>
                    <option value="Oracle">Oracle</option>
                    <option value="MS-SQL">MS-SQL</option>
                    <option value="MySQL">MySQL</option>
                    <option value="DB2">DB2</option>
                    <option value="Pro-C">Pro-C</option>
                    <option value="Python">Python</option>
                    <option value="VB">VB</option>
                    <option value="VB.NET">VB.NET</option>
                    <option value="POS">POS</option>
                    <option value="ABAP">ABAP</option>
                    <option value="EJB">EJB</option>
                    <option value="JAVA">JAVA</option>
                    <option value="C#">C#</option>
                    <option value="SAP">SAP</option>
                    <option value="C++">C++</option>
                    <option value="Kotlin">Kotlin</option>
                    <option value="F#">F#</option>
                    <option value="C">C</option>
                    <option value="PowerBuilder">PowerBuilder</option>
                    <option value="MFC">MFC</option>
                    <option value="어셈블리">어셈블리</option>
                    <option value="임베디드">임베디드</option>
                    <option value="펌웨어">펌웨어</option>
                    <option value="HMI">HMI</option>
                    <option value="MMI">MMI</option>
                    <option value="PLC">PLC</option>
                    <option value="Android">Android</option>
                    <option value="Objective">Objective</option>
                    <option value="Swift">Swift</option>
                </select>&nbsp;&nbsp;
                <input type="number" id="tech1_year" name="tech1_year" placeholder="경력(년차)" >
                <br><br>
                <select id="tech2">
                    <option value="">2순위</option>
                    <option value="JSP">JSP</option>
                    <option value="PHP">PHP</option>
                    <option value="ASP.NET">ASP.NET</option>
                    <option value="ASP">ASP</option>
                    <option value="JavaScript">JavaScript</option>
                    <option value="Ajax">Ajax</option>
                    <option value="Jquery">Jquery</option>
                    <option value="NodeJS">NodeJS</option>
                    <option value="Vue.js">Vue.js</option>
                    <option value="React.js">React.js</option>
                    <option value="Ruby">Ruby</option>
                    <option value="RubyonRails">RubyonRails</option>
                    <option value="MiPlatform">MiPlatform</option>
                    <option value="Nexacro">Nexacro</option>
                    <option value="XPLATFORM">XPLATFORM</option>
                    <option value="GO">GO</option>
                    <option value="Oracle">Oracle</option>
                    <option value="MS-SQL">MS-SQL</option>
                    <option value="MySQL">MySQL</option>
                    <option value="DB2">DB2</option>
                    <option value="Pro-C">Pro-C</option>
                    <option value="Python">Python</option>
                    <option value="VB">VB</option>
                    <option value="VB.NET">VB.NET</option>
                    <option value="POS">POS</option>
                    <option value="ABAP">ABAP</option>
                    <option value="EJB">EJB</option>
                    <option value="JAVA">JAVA</option>
                    <option value="C#">C#</option>
                    <option value="SAP">SAP</option>
                    <option value="C++">C++</option>
                    <option value="Kotlin">Kotlin</option>
                    <option value="F#">F#</option>
                    <option value="C">C</option>
                    <option value="PowerBuilder">PowerBuilder</option>
                    <option value="MFC">MFC</option>
                    <option value="어셈블리">어셈블리</option>
                    <option value="임베디드">임베디드</option>
                    <option value="펌웨어">펌웨어</option>
                    <option value="HMI">HMI</option>
                    <option value="MMI">MMI</option>
                    <option value="PLC">PLC</option>
                    <option value="Android">Android</option>
                    <option value="Objective">Objective</option>
                    <option value="Swift">Swift</option>
                </select>
                &nbsp;
                <input type="number" id="tech2_year" name="tech2_year" placeholder="경력(년차)" >
                <br><br>
                <select id="tech3">
                    <option value="">3순위</option>
                    <option value="JSP">JSP</option>
                    <option value="PHP">PHP</option>
                    <option value="ASP.NET">ASP.NET</option>
                    <option value="ASP">ASP</option>
                    <option value="JavaScript">JavaScript</option>
                    <option value="Ajax">Ajax</option>
                    <option value="Jquery">Jquery</option>
                    <option value="NodeJS">NodeJS</option>
                    <option value="Vue.js">Vue.js</option>
                    <option value="React.js">React.js</option>
                    <option value="Ruby">Ruby</option>
                    <option value="RubyonRails">RubyonRails</option>
                    <option value="MiPlatform">MiPlatform</option>
                    <option value="Nexacro">Nexacro</option>
                    <option value="XPLATFORM">XPLATFORM</option>
                    <option value="GO">GO</option>
                    <option value="Oracle">Oracle</option>
                    <option value="MS-SQL">MS-SQL</option>
                    <option value="MySQL">MySQL</option>
                    <option value="DB2">DB2</option>
                    <option value="Pro-C">Pro-C</option>
                    <option value="Python">Python</option>
                    <option value="VB">VB</option>
                    <option value="VB.NET">VB.NET</option>
                    <option value="POS">POS</option>
                    <option value="ABAP">ABAP</option>
                    <option value="EJB">EJB</option>
                    <option value="JAVA">JAVA</option>
                    <option value="C#">C#</option>
                    <option value="SAP">SAP</option>
                    <option value="C++">C++</option>
                    <option value="Kotlin">Kotlin</option>
                    <option value="F#">F#</option>
                    <option value="C">C</option>
                    <option value="PowerBuilder">PowerBuilder</option>
                    <option value="MFC">MFC</option>
                    <option value="어셈블리">어셈블리</option>
                    <option value="임베디드">임베디드</option>
                    <option value="펌웨어">펌웨어</option>
                    <option value="HMI">HMI</option>
                    <option value="MMI">MMI</option>
                    <option value="PLC">PLC</option>
                    <option value="Android">Android</option>
                    <option value="Objective">Objective</option>
                    <option value="Swift">Swift</option>
                </select>
                &nbsp;
                <input type="number" id="tech3_year" name="tech3_year" placeholder="경력(년차)" >



            </div>
            <div id="id_wrapper2">
                <h3 style="margin: 10px;">*이름</h3>
                <input type="text" id="input_id2">&nbsp;
                <h3 style="margin: 10px;">*비밀번호 확인</h3>
                <input type="password" id="input_pass2" placeholder="비밀번호 확인">&nbsp;
                <h3 style="margin: 10px;">*전화번호</h3>
                <select name="tel1" id="tel1" onchange="">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="019">019</option>
                </select>-
                <input type="text" name="tel2" id="tel2" size="3" maxlength="4">-
                <input type="text" name="tel3" id="tel3" size="3" maxlength="4">
                <h3 style="margin: 10px;">*거주 지역</h3>
                <input type="text" id="sector_area" name="sector_area" placeholder="시, 구 까지" style="width: 200px;">
                <h3 style="margin: 10px;">*투입가능한 날짜</h3>
                <input type="date" id="date">
                <br><br><br>
                <input type="submit" value="가입완료" style="width: 200px; height: 50px; background: gray;">


            </div>
        </div>


    </div>
</form>

<%@ include file="../common/footer.jsp" %>

</body>

</html>