<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/noticeModify.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="../includes/admin/header.jsp" %>
        <div class="admin_content_wrap">
            <div class="admin_content_subject"><span>공지사항 수정</span></div>
            <div class="admin_content_main">
            	<form id="modifyForm" action="/admin/noticeModify" method="post">
            		<div class="form_section">
            			<div class="form_section_title">
            				<label>NO</label>
            			</div>
            			<div class="form_section_content">
            				<input class="input_block" name="notice_seq" readonly="readonly" value="<c:out value='${noticeAddGetInfo.notice_seq }'></c:out>">
            				<input type="hidden" class="input_block" name="del_id" value="<c:out value='${member.memberId }'></c:out>">
            			</div>
            		</div>                    
            		<div class="form_section">
            			<div class="form_section_title">
            				<label>제목</label>
            			</div>
            			<div class="form_section_content">
            				<input name="title" value="<c:out value='${noticeAddGetInfo.title }'></c:out>" >
            				<span id="warn_noticeAddTitle">제목을 입력 해주세요.</span>
            			</div>
            		</div>
            		<div class="form_section">
            			<div class="form_section_title">
            				<label>내용</label>
            			</div>
            			<div class="form_section_content">
            				<textarea name="conts"><c:out value='${noticeAddGetInfo.conts }'/></textarea>
            				<span id="warn_noticeAddConts">내용을 입력 해주세요.</span>
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
	            		<button id="cancelBtn" class="btn">취소</button>
	              		<button id="modifyBtn" class="btn modify_btn">수정</button>
	              		<button id="deleteBtn" class="btn delete_btn">삭제</button>
	              	</div> 
            	</form>
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
let modifyForm = $("#modifyForm");

/* 공지사항 상세 페이지 이동 버튼 */
$("#cancelBtn").on("click", function(e){
	
	e.preventDefault();
			
	moveForm.attr("action", "/admin/notice")
	moveForm.submit();
	
});

/* 공지사항 수정 버튼 작동 및 유효성 검사 */
$("#modifyBtn").on("click", function(e){

	let title = $(".form_section_content input[name='title']").val();
	let conts = $(".form_section_content textarea").val();		

	let	titleCk = false;
	let contsCk = false;		
	
	e.preventDefault();
	
	if(!title){
		$("#warn_noticeAddTitle").css("display", "block");
	} else {
		$("#warn_noticeAddTitle").css("display", "none");
		titleCk = true;
	}
	if(!conts){
		$("#warn_noticeAddConts").css("display", "block");
	} else {
		$("#warn_noticeAddConts").css("display", "none");
		contsCk = true;
	}

	
	if(titleCk && contsCk ){
		modifyForm.submit();
		alert("공지사항 수정을 완료하였습니다.");
	} else {
		return false;
	}
	
	
});

/* 공지사항 삭제 버튼 */
$("#deleteBtn").on("click", function(e){
	
	e.preventDefault();
	
	modifyForm.attr("action", "/admin/noticeDelete");
	modifyForm.submit();
	alert("공지사항을 삭제하였습니다.");
	
});
</script>


</body>
</html>