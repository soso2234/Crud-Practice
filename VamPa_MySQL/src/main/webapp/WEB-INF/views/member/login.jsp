<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/resources/css/member/login.css">
</head>
<body>
	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<ul class="list">
					<c:if test = "${member == null}"><!-- 로그인 안했을때 -->
		                <li>
		                    <a href="/member/login">로그인</a>
		                </li>
		                <li>
		                    <a href="/member/join">회원가입</a>
		                </li>
	                </c:if>
	                <c:if test="${member != null }"> <!-- 로그인 했을때 -->  
	                	<c:if test="${member.adminCk == 1 }"> <!-- 관리자 계정 -->
	                        <li>
	                        	<a href="/admin/main">관리자 페이지</a>
	                        </li>
	                    </c:if>  
	                    <li>
	                    	<a id="gnb_logout_button">로그아웃</a>
	                    </li>  
	                    <li>
							마이룸
	                    </li>
	                </c:if>  
	                <li>
						고객센터
	                </li>        
            	</ul>   
			</div>
			
			<form id="login_form" method="post">
				<div class="logo_wrap">
					<span>Book Mall</span>
				</div>
				<div class="login_wrap"> 
					<div class="id_wrap">
							<div class="id_input_box">
							<input class="id_input" name="memberId">
						</div>
					</div>
					<div class="pw_wrap">
						<div class="pw_input_box">
							<input class="pw_iput" name="memberPw">
						</div>
					</div>
					
					<c:if test = "${result == 0 }">
		                <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
		            </c:if>
					
					<div class="login_button_wrap">
						<input type="button" class="login_button" value="로그인">
					</div>			
				</div>
			</form>
			
			<!-- Footer 영역 -->
	        <div class="footer_nav">
	            <div class="footer_nav_container">
	                <ul>
	                    <li>회사소개</li>
	                    <span class="line">|</span>
	                    <li>이용약관</li>
	                    <span class="line">|</span>
	                    <li>고객센터</li>
	                    <span class="line">|</span>
	                </ul>
	            </div>
	        </div> <!-- class="footer_nav" -->
	        
	        <div class="footer">
	            <div class="footer_container">
	                
	                <div class="footer_left">
	                    <img src="../resources/img/Logo.png">
	                </div>
	                <div class="footer_right">
	                    (주) Test    대표이사 : OOO
	                    <br>
	                    	사업자등록번호 : ooo-oo-ooooo
	                    <br>
	                    	대표전화 : oooo-oooo(발신자 부담전화)
	                    <br>
	                    <br>
	                    COPYRIGHT(C) <strong>test.naver.com</strong>    ALL RIGHTS RESERVED.
	                </div>
	                <div class="clearfix"></div>
	            </div>
	        </div> <!-- class="footer" -->  
		</div>
	</div>

<script>

	/* 로그인 버튼 클릭 메서드 */
	$(".login_button").click(function(){
	    
	    //alert("로그인 버튼 작동");
	    /* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/member/login.do");
        $("#login_form").submit();
	    
	});
	
</script>

</body>
</html>