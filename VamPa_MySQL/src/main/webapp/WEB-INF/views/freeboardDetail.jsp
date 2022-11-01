<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/freeboard.css">
	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
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
				<div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>자유게시판 상세</span></div>
                    <div class="admin_content_main">
	                    <form action="/freeboardDelete" method="post" id="modifyForm">
	                    	<div class="form_section">
                    			<div class="form_section_title">
                    				<label>첨부 파일</label>
                    			</div>
                    			<div class="form_section_content">
									<div id="uploadResult">
										첨부파일 자리
									</div>
                    			</div>
                    		</div>
	                   		<div class="form_section">
	                   			<input type ="hidden" class="input_block" name="freeboard_seq" value="<c:out value='${freeboardInfo.freeboard_seq }'></c:out>">
	    						<input type ="hidden" class="input_block" name="del_id" value="<c:out value='${member.memberId }'></c:out>">
	                   			<div class="form_section_title">
	                   				<label>작성자</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input class="input_block" name="reg_id" readonly="readonly" value="<c:out value='${freeboardInfo.reg_id }'></c:out>" >
	                   			</div>
	                   			<div class="form_section_title">
	                   				<label>제목</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input class="input_block" name="title" readonly="readonly" value="<c:out value='${freeboardInfo.title }'></c:out>" >
	                   			</div>
	                   		</div>
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>내용</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<textarea class="input_block" name="conts" readonly="readonly"><c:out value='${freeboardInfo.conts }'/></textarea>
	                   			</div>
	                   		</div>
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>등록 날짜</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${freeboardInfo.reg_dt}" pattern="yyyy-MM-dd"/>">
	                   			</div>
	                   		</div>
	                  		<div class="btn_section">
	                  			<button id="cancelBtn" class="btn">목록</button>
	                  			<c:if test="${freeboardInfo.reg_id eq member.memberId}">
		                  			<button id="modifyBtn" class="btn">수정</button>
		                  			<button id="deleteBtn" class="btn">삭제</button>
	                  			</c:if>
	                    	</div>
	                    </form>
                    </div>                    
                </div>
				
				<form id="moveForm" method="get" >
					<input type="hidden" name="freeboard_seq" value="${freeboardInfo.freeboard_seq}">
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
                	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
                	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
				</form>
			</div>
			
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
		let modifyForm = $("#modifyForm");
		
	    /* gnb_area 로그아웃 버튼 작동 */
	    $("#gnb_logout_button").click(function(){
	    	//alert("버튼 작동");
	        $.ajax({
	            type:"POST",
	            url:"/member/logout.do",
	            success:function(data){
	                alert("로그아웃 성공");
	                document.location.reload();     
	            } 
	        }); // ajax 
	    });
	    
	    /* 첨부파일 정보 호출 */
	    let freeboard_seq = '<c:out value = "${freeboardInfo.freeboard_seq}" />';
	    let uploadResult = $("#uploadResult");
	    
	    $.getJSON("/getUploadList", {freeboard_seq : freeboard_seq}, function(arr) {
	    	
	    	let str = "";
	    	let obj = arr[0];
	    	
	    	str += "<div id='result_card'>";
	    	str += "<div";
	    	str += "</div>";
	    	
	    	uploadResult.html(str);
	    });
	    
	    /* 취소 버튼 */
		$("#cancelBtn").click(function(e){
			e.preventDefault();
			
			moveForm.attr("action", "/freeboard")
			moveForm.submit();
		});
	    
	    /* 수정 버튼 */
	    $("#modifyBtn").click(function(e){
	    	
	    	e.preventDefault();
	    	
	    	moveForm.attr("action", "/freeboardModify");
	    	moveForm.submit();
	    });
	    
	    /* 삭제 버튼 */
	    $("#deleteBtn").on("click", function(e){
	    	e.preventDefault();
	    	
	    	modifyForm.attr("action", "/freeboardDelete");
	    	modifyForm.submit();
	    	
	    	alert("게시물을 삭제하였습니다.");
	    });
	    
	</script>

</body>
</html>