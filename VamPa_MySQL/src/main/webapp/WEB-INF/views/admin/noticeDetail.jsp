<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/noticeDetail.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
				<%@include file="../includes/admin/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>공지사항 상세</span></div>
                    <div class="admin_content_main">
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>NO
                   					<input class="input_block" name="notice_seq" readonly="readonly" value="<c:out value='${noticeAddGetInfo.notice_seq }'></c:out>">
                   				</label>
                   			</div>
                   		</div>                    
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>제목</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" name="title" readonly="readonly" value="<c:out value='${noticeAddGetInfo.title }'></c:out>" >
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>내용</label>
                   			</div>
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="conts" readonly="readonly"><c:out value='${noticeAddGetInfo.conts }'/></textarea>
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>등록 날짜</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${noticeAddGetInfo.reg_dt}" pattern="yyyy-MM-dd"/>">
                   			</div>
                   		</div>
                  		<div class="btn_section">
                  			<button id="cancelBtn" class="btn">목록</button>
                    		<button id="modifyBtn" class="btn modify_btn">수정</button>
                    	</div> 
                    </div>                    
                </div>
                
                <form id="moveForm" method="get">
                	<input type="hidden" name="notice_seq" value='<c:out value="${noticeAddGetInfo.notice_seq }"/>'>
                	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
                	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
                	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
                </form>
				<%@include file="../includes/admin/footer.jsp" %>

<script>
let moveForm = $("#moveForm");

/* 공지사항 관리 페이지 이동 버튼 */
$("#cancelBtn").on("click", function(e){
	
	e.preventDefault();
	
	$("input[name=notice_seq]").remove();
	moveForm.attr("action", "/admin/notice")
	moveForm.submit();
	
});

/* 공지사항 수정 페이지 이동 버튼 */
$("#modifyBtn").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.attr("action", "/admin/noticeModify");
	moveForm.submit();
	
});

</script>

</body>
</html>