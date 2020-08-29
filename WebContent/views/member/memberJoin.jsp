<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>


    <%@ include file="../common/header.jsp" %>

    <!-- 네비게이션바 -->
    <style type="text/css">
        #f_management{display:none;}
        #p_management{display:none;}
        #profile{display:none;}
        #suggestion{display:none;}
    </style>


    <style type="text/css">      #signup_wrapper{
        margin: auto;
        /* border: 1px solid black; */
        height: 650px;
        width: 60%;
        padding: 30px;
    }


    #input_id{
        background: cornflowerblue;
        height: 35px;
    }
    #id_wrapper{
        width: 50%;
        height: 500px;
        /* background:yellow; */
        display: inline-block;
        position: relative;
        top: 60px;
        left: 100px;
    }
    #id_wrapper2{
        position: relative;
        width: 50%;
        height: 500px;
        left: 100px;
        top: 60px;
        /* background:yellow; */
        float: right;
    }
    #signup{
        position: relative;
        top: 25px;
        font-size: 45px;
    }
    #input_pass{
        background: cornflowerblue;
        width: 300px;
        height: 35px;
    }

    #yy{
        background:cornflowerblue ;
        height: 35px;
        width: 75px;
    }

    #mm{
        background:cornflowerblue ;
        height: 35px;
        width: 75px;
    }
    #dd{
        background:cornflowerblue ;
        height: 35px;
        width: 75px;
    }
    #sector{
        background:cornflowerblue ;
        height: 35px;
        width: 75px;
    }
    #sector_ch{
        background:cornflowerblue ;
        height: 35px;
        width: 100px;
    }
    #tech1{
        background:cornflowerblue ;
        height: 35px;
        width: 75px;
    }
    #tech1_year{
        background:cornflowerblue ;
        height: 35px;
        width: 100px;
    }
    #tech2{
        background:cornflowerblue ;
        height: 35px;
        width: 75px;
    }
    #tech2_year{
        background:cornflowerblue ;
        height: 35px;
        width: 100px;
    }
    #tel1{
        background:cornflowerblue ;
        height: 35px;
        width: 75px;
    }
    #tel2{
        background:cornflowerblue ;
        height: 35px;
        width: 75px;
        text-align: center;
    }
    #tel3{
        background:cornflowerblue ;
        height: 35px;
        width: 75px;
        text-align: center;
    }
    #date{
        background:cornflowerblue ;
        height: 35px;
        width: 150px;
        text-align: center;

    }
    #complete{
        border: 2px solid silver;
        width: 170px;
        height: 50px;
        background: lightskyblue;
        text-align: center;
        position: relative;
        top: 40px;
        left: 80px;

    }
    #complete>a{
        position: relative;
        top: 30%;
        font-size: 30px;
        /* text-align: center; */
    }
    </style>


</head>
<body>


<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="http://www.googletagmanager.com/ns.html?id=GTM-MF7LK3J"
                  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<div class="load_box" style="display:none;"><div class="load_img"><img src="../resources/images/common/loading.gif" alt="loading"/></div></div>





<script type="text/javascript" src="../resources/freemon/login/freemonLogin069b.js?version=1.1"></script>

<script type="text/javascript">
    $(function() {
        freemon.invoker.invoke("freemonLogin");

        $('.login_box #login_tab > ul > li').bind("click",function(){
            $(this).children("a").removeAttr('href');
            if($(this).attr("id") == 'tab_con'){

            }else{
                $('.login_box #login_tab > ul').children("li").removeClass("active");
                $(this).addClass("active");
                $('.login_box .tab_con').hide();
                $('.login_box #con_'+$(this).attr("id")).show();
            }
        });
        $('.btn_person').bind("click",function(){
            $(this).children("a").removeAttr('href');
            $('.login_box #login_tab > ul').children("li").removeClass("active");
            $('.login_box #tab1').addClass("active");
            $('.login_box .tab_con').hide();
            $('.login_box #con_tab1').show();
        });
        $('.btn_company').bind("click",function(){
            $(this).children("a").removeAttr('href');
            $('.login_box #login_tab > ul').children("li").removeClass("active");
            $('.login_box #tab2').addClass("active");
            $('.login_box .tab_con').hide();
            $('.login_box #con_tab2').show();
        });

        $('.idfind_box #login_tab > ul > li').bind("click",function(){
            $(this).children("a").removeAttr('href');
            if($(this).attr("id") == 'tab_con'){

            }else{
                $('.idfind_box #login_tab > ul').children("li").removeClass("active");
                $(this).addClass("active");
                $('.idfind_box .tab_con').hide();
                $('.idfind_box #con_'+$(this).attr("id")).show();
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
                <input type="text" id="input_id" name="id">&nbsp;
                <button type="submit" id="id_check">중복확인</button>
                <h3 style="margin: 10px;">*비밀번호</h3>
                <input type="password" id="input_pass" name="pwd" placeholder="비밀번호(숫자,영문,특수문자 조합 최소 8자)">&nbsp;
                <h3 style="margin: 10px;">*생년월일</h3>
                <input type="text" id="yy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4">
                &nbsp;
                <select id="mm" class="sel" aria-label="월">
                    <option value="">월</option>
                    <option value="01">
                        1
                    </option>
                    <option value="02">
                        2
                    </option>
                    <option value="03">
                        3
                    </option>
                    <option value="04">
                        4
                    </option>
                    <option value="05">
                        5
                    </option>
                    <option value="06">
                        6
                    </option>
                    <option value="07">
                        7
                    </option>
                    <option value="08">
                        8
                    </option>
                    <option value="09">
                        9
                    </option>
                    <option value="10">
                        10
                    </option>
                    <option value="11">
                        11
                    </option>
                    <option value="12">
                        12
                    </option>
                </select>
                &nbsp;
                <input type="text" id="dd" placeholder="일" aria-label="일" class="int" maxlength="2">
                <h3 style="margin: 10px;">*희망지역</h3>
                <select id="sector">
                    <option value="">시</option>
                    <option value="seoul">
                        서울
                    </option>

                </select>
                &nbsp;&nbsp;
                <select id="sector_ch">
                    <option value="">구,동</option>
                    <option value="location">
                        강북구,미아동
                    </option>
                </select>
                <h3 style="margin: 10px;">*보유기술</h3>
                <select id="tech1">
                    <option value="">1순위</option>
                    <option value="JAVA">JAVA</option>
                    <option value="SQL">SQL</option>
                    <option value="CSS">CSS</option>
                </select>
                &nbsp;
                <select id="tech1_year">
                    <option value="">경력(년차)</option>
                    <option value="1">1년차</option>
                    <option value="2">2년차</option>
                    <option value="3">3년차</option>
                </select>
                <br><br>
                <select id="tech2">
                    <option value="">2순위</option>
                    <option value="JAVA">JAVA</option>
                    <option value="SQL">SQL</option>
                    <option value="CSS">CSS</option>
                </select>
                &nbsp;
                <select id="tech2_year">
                    <option value="">경력(년차)</option>
                    <option value="1">1년차</option>
                    <option value="2">2년차</option>
                    <option value="3">3년차</option>
                </select>



            </div>
            <div id="id_wrapper2">
                <h3 style="margin: 10px;">*이름</h3>
                <input type="text" id="input_id">&nbsp;
                <h3 style="margin: 10px;">*비밀번호</h3>
                <input type="password" id="input_pass" placeholder="비밀번호 확인">&nbsp;
                <h3 style="margin: 10px;">*전화번호</h3>
                <select name="tel1" id="tel1"onchange="">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="019">019</option>
                </select>-
                <input type="text" name="tel2" id="tel2" size="3" maxlength="4">-
                <input type="text" name="tel3" id="tel3" size="3" maxlength="4">
                <h3 style="margin: 10px;">*거주 지역</h3>
                <select id="sector">
                    <option value="">시</option>
                    <option value="seoul">
                        서울
                    </option>
                </select>
                &nbsp;&nbsp;
                <select id="sector_ch">
                    <option value="">구,동</option>
                    <option value="location">
                        강북구,미아동
                    </option>
                </select>
                <h3 style="margin: 10px;">*투입가능한 날짜</h3>
                <input type="date" id="date">
                <br>
                <div id="complete">
                    <a href="">가입완료</a>
                </div>





            </div>
        </div>


    </div>
</form>

<%@ include file="../common/footer.jsp" %>

</body>

</html>