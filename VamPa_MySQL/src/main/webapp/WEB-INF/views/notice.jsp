<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/notice.css">
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
				<div class="list_search_result">
					<table class="type_list">
						<colgroup>
							<col width="120">
							<col width="120">
						</colgroup>
						<tbody id="searchList>">
							<thead>
		            			<tr>
									<td class="th_column_1">NO</td>
		            				<td class="th_column_2">제목</td>
		            				<td class="th_column_3">내용</td>
		            				<td class="th_column_4">등록자</td>
		            				<td class="th_column_5">등록날짜</td>
		            			</tr>
		            		</thead>
							<c:forEach items="${list}" var="list">
								<tr>
									<td class="detail">
										<div class="noticeSeq">
											<c:out value="${list.notice_seq}"></c:out>
										</div>
									</td>
									<td class="detail">
										<a class="title" href='<c:out value="${list.notice_seq}"/>'>
											<c:out value="${list.title}"></c:out>
										</a>
									</td>
									<td class="detail">
										<div class="conts">
											${list.conts}
										</div>
									</td>
									<td class="detail">
										<div class="reg_nm">
											${list.reg_nm}
										</div>
									</td>
									<td class="detail">
										<div class="reg_dt">
											<fmt:formatDate pattern = "yyyy/MM/dd" value="${list.reg_dt}"/>
										</div>
									</td>
									<td class="option"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
					
				<!-- 페이지 이동 인터페이스 -->
				<div class="pageMaker_wrap">
					<ul class="pageMaker">
	                			
						<!-- 이전 버튼 -->
						<c:if test="${pageMaker.prev }">
	               			<li class="pageMaker_btn prev">
	               				<a href="${pageMaker.pageStart -1}">이전</a>
	               			</li>
						</c:if>
	               			
	               		<!-- 페이지 번호 -->
	               		<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
	               			<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
	               				<a href="${num}">${num}</a>
	               			</li>	
	               		</c:forEach>
	               		
	                   	<!-- 다음 버튼 -->
	                   	<c:if test="${pageMaker.next}">
	                   		<li class="pageMaker_btn next">
	                   			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                   		</li>
	                   	</c:if>
					</ul>
				</div>
				
				<form id="moveForm" action="/notice" method="get" >
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
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
	    
	    /* 페이지 이동 버튼 */
	    const moveForm = $('#moveForm');
	    
		$(".pageMaker_btn a").on("click", function(e){
			
			e.preventDefault();
			
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			
			moveForm.submit();
			
		});
		
		/* 공지사항 상세 페이지 이동 */
		$(".title").on("click", function(e){
			
			e.preventDefault();
			
			moveForm.append("<input type='hidden' name='notice_seq' value='"+ $(this).attr("href") + "'>");
			moveForm.attr("action", "/noticeDetail");
			moveForm.submit();
			
		});
	    
	</script>

</body>
</html>