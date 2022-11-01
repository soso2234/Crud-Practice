<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/freeboardAdd.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
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
			<div class="top_area">
				<div class="logo_area">
					<a href="/main"><img src="resources/img/mLogo.png"></a>
				</div>
				<div class="search_area">
					<div class="search_wrap">
                		<form id="searchForm" action="#" method="get">
                			<div class="search_input">
                				<input type="text" name="keyword">
                    			<button class='btn search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>
				</div>
				<div class="login_area">
					<!-- 로그인 하지 않은 상태 -->
	                <c:if test = "${member == null }">
	                    <div class="login_button"><a href="/member/login">로그인</a></div>
	                    <span><a href="/member/join">회원가입</a></span>                
	                </c:if>
	                
	                <!-- 로그인한 상태 -->
	                <c:if test="${ member != null }">
	            		<div class="login_success_area">
	                        <span>회원 : ${member.memberName}</span>
	                        <a href="/member/logout.do">로그아웃</a>
	                    </div>
	                </c:if>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="navi_bar_area">
				<div class="navi_bar_area">
					<div class="category">
						<button class="categorybtn"><a href="/notice">공지사항</a></button>
						<button class="categorybtn"><a href="/freeboard">자유게시판</a></button>
					</div>
				</div>
			</div>
			<div class="content_area">
				<form action="/freeboardModify" method="post" id="modifyForm">
					<div class="form_section">
						<input type ="hidden" class="input_block" name="freeboard_seq" value="<c:out value='${freeboardInfo.freeboard_seq }'></c:out>">
	    				<input type ="hidden" class="input_block" name="del_id" value="<c:out value='${member.memberId }'></c:out>">
						<div class="form_section_title">
							<label>제목</label>
						</div>
						<div class="form_section_content">
							<input name="title" value="<c:out value='${freeboardInfo.title }'></c:out>">
							<span id="warn_freeboardTitle">제목을 입력 해주세요.</span>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>내용</label>
						</div>
						<div class="form_section_content">
							<textarea name="conts"><c:out value='${freeboardInfo.conts }'/></textarea>
							<span id="warn_freeboardConts">내용을 입력 해주세요.</span>
						</div>
					</div>
					<div class="btn_section">
						<button id="cancelBtn" class="btn">취 소</button>
				 		<button id="modifyBtn" class="btn enroll_btn">수 정</button>
				 	</div>
				</form>
			</div>
			
			<form id="moveForm" method="get" >
				<input type="hidden" name='freeboard_seq' value='<c:out value="${freeboardInfo.freeboard_seq }"/>'>
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
		        <input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
		        <input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
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
	                    <img src="resources/img/Logo.png">
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
let moveForm = $("#moveForm");
let modifyForm = $("#modifyForm")

/* 취소 버튼 */
$("#cancelBtn").click(function(e){
	
	e.preventDefault();
	
	moveForm.attr("action", "/freeboard")
	moveForm.submit();
	
});

/* 수정 버튼 */
$("#modifyBtn").on("click", function(e){
	
	let title = $(".form_section_content input[name='title']").val();
	let conts = $(".form_section_content textarea").val();	
	
	let	titleCk = false;
	let contsCk = false;
	
	e.preventDefault();
	
	if(!title){
		$("#warn_freeboardTitle").css("display", "block");
	} else {
		$("#warn_freeboardTitle").css("display", "none");
		titleCk = true;
	}
	if(!conts){
		$("#warn_freeboardConts").css("display", "block");
	} else {
		$("#warn_freeboardConts").css("display", "none");
		contsCk = true;
	}
	
	if(titleCk && contsCk ){
		modifyForm.submit();
		alert("수정을 완료하였습니다.");
	} else {
		return false;
	}
});
</script>
</body>
</html>