<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html lang="ko">
<head>
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible"
	content="IE=Edge; text/html; charset=UTF-8" />
<meta charset="utf-8">
<title>채용관리시스템</title>
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>

<link rel="stylesheet" type="text/css" href="/KCC_RMS/css/rms/cmn/main.css" />


<!--[if lt IE 9]>
		<script type="text/javascript" src="./common/js/respond.min.js"></script>
<![endif]-->
<!--[if lt IE 9]>
		<script type="text/javascript" src="./common/js/html5shiv.js"></script>
<![endif]-->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="/js/rms/com/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="/KCC_RMS/js/rms/com/jquery.cookie.js"></script>
<script type="text/javaScript" language="javascript">
	$(document).ready(function(){
	
		var loginState = '${loginState}';
		//alert(loginState);
		if('idNotExist'==loginState)
		{
			layPop(page4);
		}
		else if('pwNotAgreement'==loginState)
		{
			layPop(page5);
		}
		
	});
	
	function layPop(id)
	{
		var layPopH = $(id).height();
		var layPopW = $(id).width();
	
	
		var topPos = (($(window).height() - layPopH) / 2);
		var leftPos  = (($(window).width() - layPopW ) / 2);
		$(id).css({
			'left' : leftPos,
			'top' : topPos
		});
	
		popup_bg();
		$(id).show();
		$("html").css("overflow", "hidden");
		
	}
	function layPopClose(id)
	{
		
		if(page3==id)
		{
			$("#admin_nameForIdFind").val("");
			$("#admin_emailForIdFind").val("");
		}
		else if(page2==id)
		{
			$("#admin_nameForIdFind").val("");
			$("#admin_emailForIdFind").val("");
			$("#admin_id").val($("#findIdResult").html());
			$("#findIdResult").html("");
		}
		popup_bg_close();
		$(id).hide();
		$("html").css("overflow", "auto");
	}
	
	
	/* popup_bg */
	function popup_bg()
	{
		$(".popup_bg").height(($(document).height()));
		$(".popup_bg").show();
	}
	function popup_bg_close()
	{
		$(".popup_bg").hide();
	}

	function loginSubmit()
	{
		saveId();
		if ($("#admin_id").val() == "") 
		{
			alert('<spring:message code="cop.id.msg" />');
			$("#admin_id").focus();
			
		}
		else
		{
			if ($("#admin_pw").val() == "") 
			{
				alert('<spring:message code="cop.password.msg" />');
				$("#admin_pw").focus();
			}
			else
			{
				$("#log_form").attr("action", "<c:url value='/rms/sys/login.do'/>").submit();		
			}
		}
	}
	function idFind() {
		if ($("#admin_nameForIdFind").val() == "") {
			
			alert('<spring:message code="cop.name.msg" />');
			$("#admin_nameForIdFind").focus();

		} 
		else if($("#admin_emailForIdFind").val() == "")
		{
			alert('<spring:message code="cop.email.msg" />');
			$("#admin_emailForIdFind").focus();
		}
		else
		{
			var name= $("#admin_nameForIdFind").val();
			var email=$("#admin_emailForIdFind").val();
			var url=$("#admin_email_addr_url").val();
			$.post("<c:url value='/rms/sys/findId.do'/>", {admin_name : name, admin_email_id : email, admin_email_addr_url : url}, function(xml)
	                  {						
							var findIdResult = $(xml).find('check').text();
				 			if(""!=findIdResult)
				 			{
				 				$("#findIdResult").html(findIdResult);
				 				layPopClose(page1);
				 				layPop(page2);
				 			}else
				 			{
				 				layPopClose(page1);
				 				layPop(page3);
				 			}
	                  });
		}

	}
	
	

	    function saveId(){
	    	//alert("33");
	        if ($('input[name=saveid]').prop ('checked')) {
	        	saveLogin($("#admin_id").val());
	            $('input[name=saveid]').prop ('checked', true) 
	        }
	        else
	        {
	        	saveLogin("");
	            $('input[name=saveid]').prop ('checked', false)
	        }
	    }

	    // id를 받아와 쿠키에 저장할지 쿠키에서 삭제할지 결정.
	    function saveLogin(id) {
	        if (id != "") {
	            // admin_id 쿠키에 id 값을 7일간 저장
	        	 $.cookie('admin_id', id, {expires: 7, path:'/'});
	        } else {
	            // admin_id 쿠키 삭제
	        	 $.cookie('admin_id', id, {expires: -1, path:'/'});
	        }
	    }
	    function getLogin() {
	           var cookie = $.cookie('admin_id');
	            if (cookie!=null) {
	            	 $("#admin_id").val(cookie);
	                 $('input[name=saveid]').prop ('checked', true);
	            }

	      
	        } 
</script>
</head>

<body onload="getLogin();">
<div id="wrap">
<section class="main">
      	  <article>
	<div class="container">
    	<div class="kcc_link">
            <a href="#"> kcc 홈페이지 바로가기</a>
            <span class="right">
                <a href="#" onclick="document.location.href='/KCC_RMS/rms/recNotice/userNoticeList.do'">채용공고 홈페이지 바로가기</a>
            </span>
        </div>
        <header>
            <h1><span class="font_bold">KCC RECRUIT</span> system</h1>
            <h2><img src="/KCC_RMS/images/rms/cmn/contents/main_name.png" alt="채용관리 관리자"></h2>
        </header>
       	
        
            <form class="log_form" id="log_form" method="post">
                <h1><span class="log-in">Log in</span><span class="log_mes">Please Enter Your Information</span></h1>
                <p class="float_left">
                    <label for="login" class="log_la"><span class="ico_user"></span>Username</label>
                    <input type="text" id="admin_id" name="admin_id" placeholder="Username" value="123">
                </p>
                <p class="float_right">
                    <label for="password" class="log_la"><span class="ico_lock"></span>Password</label>
                    <input type="password" id="admin_pw" name="admin_pw" placeholder="Password" class="showpassword" value="1q2w3e">
                </p>
                <p class="clearfix">     
                    <input type="button" name="button" value="Log in" onclick="loginSubmit();">
                </p>
                <p class="main_img">     
                    <img src="/KCC_RMS/images/rms/cmn/contents/main_img.png" alt="채용관리">
                </p>
                <div class="toolbar">
                	<div><input name="saveid" id="saveid" class="int" type="checkbox" "/><label class="id_la">아이디 저장</label></div>
                    <div></div>
                    <div><a href="#" onclick="layPop(page1);"><span class="ico_id"></span>아이디 찾기</a></div>
                </div>
            </form>
           <footer>
            <div class="fWrap">
                <span>COPYRIGHT ⓒ 2014 <b>KCC.</b></span>
                <span>ALL RIGHT RESERVED.</span>
            </div>
        </footer>
        </div>
          </article>​​
        </section>
        </div>
       
	<!-- loding_pop -->
<div class="layPop" id="loding">
	<div class="loding">
		페이지를 불러오고 있습니다.
		<div class="logo"><img src="/KCC_RMS/images/rms/cmn/common/logo_loding.gif" alt="로딩 로고" /></div>
	</div>
</div>
<!-- //loding_pop -->
<!-- page1 시작 -->
<div class="layPop" id="page1">
	<div class="wrap" style="width:550px;">
		<div class="bg_lt"></div>
		<div class="bg_rt"></div>
		<div class="cont">
			<dl class="pop_list">
				<dt>아이디 찾기</dt>
				<dd>
					<div class="con_wrap" style="height:115px;">
						<div class="wcont">
							<div class="login_con">
                                <ul class="form">
                                    <li>
                                        <label class="tit">이름</label>
                                        <span class="input"><input type="text" id="admin_nameForIdFind" name="admin_nameForIdFind" style="width:180px;"class="ipt_listIn" /></span>
                                    </li>
                                    <li>
                                        <label class="tit">이메일</label>
                                        <span class="input"><input type="text" id="admin_emailForIdFind" name="admin_emailForIdFind" style="width:85px;"class="ipt_listIn" />
                                        <select id="admin_email_addr_url" name="admin_email_addr_url" style="width: 95px;"
										class="ipt_listIn2" onchange="preUserChange();">
											<option value="kcc.co.kr" SELECTED>@ kcc.co.kr</option>
											<option value="kccsecurity.com">@ kccsecurity.com</option>
											<option value="sysone.co.kr">@ sysone.co.kr</option>
										</select>
										</span>
                                    </li>
                                </ul>
                                <span class="btn-pack btn-type_6">
                                	<input id="" name="" class="cmt_btn" type="button" value="아이디찾기" onclick="idFind();">
                            	</span>
                            </div><!--//테이블2-->
						</div>
					</div>
				</dd>
			</dl>
			<div class="close"><a href="#" onclick="layPopClose(page1);"><img src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a></div>
		</div>
		<div class="bg_lb"></div>
		<div class="bg_rb"></div>
	</div>
</div>
<!-- //page1 끝 -->
<!-- page2 시작 -->
<div class="layPop" id="page2">
	<div class="wrap" style="width:550px;">
		<div class="cont">
			<dl class="pop_list">
				<dt>아이디 찾기</dt>
				<dd>
					<div class="con_wrap" style="height:115px;">
						<div class="wcont">
							<div class="noti_box mt10">
                                <p>아이디는 <span class="font_style_1"><text id="findIdResult"></text></span>입니다.</p>
                            </div><!--//테이블2-->
                            <div class="pop_btn">
                                <span class="btn-pack btn-type_1">
                                    <a class="" href="#" onclick="layPopClose(page2);"><span class="ico_v"></span> 확 인</a>
                                </span>
                            </div>
						</div>
					</div>
				</dd>
			</dl>
			<div class="close"><a href="#" onclick="layPopClose(page2);"><img src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a></div>
		</div>
	</div>
</div>
<!-- //page2 끝 -->
<!-- page3 시작 -->
<div class="layPop" id="page3">
	<div class="wrap" style="width:550px;">
		<div class="cont">
			<dl class="pop_list">
				<dt>아이디 찾기</dt>
				<dd>
					<div class="con_wrap" style="height:115px;">
						<div class="wcont">
							<div class="noti_box mt10">
                                <p>일치하는 아이디가 없습니다.</p>
                            </div><!--//테이블2-->
                            <div class="pop_btn">
                                <span class="btn-pack btn-type_1">
                                    <a class="" href="#" onclick="layPopClose(page3);"><span class="ico_v"></span> 확 인</a>
                                </span>
                            </div>
						</div>
					</div>
				</dd>
			</dl>
			<div class="close"><a href="#" onclick="layPopClose(page3);"><img src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a></div>
		</div>
	</div>
</div>
<div class="layPop" id="page4">
	<div class="wrap" style="width:550px;">
		<div class="cont">
			<dl class="pop_list">
				<dt></dt>
				<dd>
					<div class="con_wrap" style="height:115px;">
						<div class="wcont">
							<div class="noti_box mt10">
                                <p>등록되지 않은 계정입니다. 인사팀에 문의해주세요.</p>
                            </div><!--//테이블2-->
                            <div class="pop_btn">
                                <span class="btn-pack btn-type_1">
                                    <a class="" href="#" onclick="layPopClose(page4);"><span class="ico_v"></span> 확 인</a>
                                </span>
                            </div>
						</div>
					</div>
				</dd>
			</dl>
			<div class="close"><a href="#" onclick="layPopClose(page4);"><img src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a></div>
		</div>
	</div>
</div>
<div class="layPop" id="page5">
	<div class="wrap" style="width:550px;">
		<div class="cont">
			<dl class="pop_list">
				<dt></dt>
				<dd>
					<div class="con_wrap" style="height:115px;">
						<div class="wcont">
							<div class="noti_box mt10">
                                <p>비밀번호를 확인해주세요.</p>
                            </div><!--//테이블2-->
                            <div class="pop_btn">
                                <span class="btn-pack btn-type_1">
                                    <a class="" href="#" onclick="layPopClose(page5);"><span class="ico_v"></span> 확 인</a>
                                </span>
                            </div>
						</div>
					</div>
				</dd>
			</dl>
			<div class="close"><a href="#" onclick="layPopClose(page5);"><img src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a></div>
		</div>
	</div>
</div>
	
</body>
</html>
