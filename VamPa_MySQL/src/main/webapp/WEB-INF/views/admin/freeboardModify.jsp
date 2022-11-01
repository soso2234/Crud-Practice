<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/freeboardModify.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<%@include file="../includes/admin/header.jsp" %>
	<div class="admin_content_wrap">
	    <div class="admin_content_subject"><span>자유게시판 수정</span></div>
	    <div class="admin_content_main">
	    	<form action="/admin/freeboardModify" method="post" id="modifyForm">
	    		<div class="form_section">
	    			<input type ="hidden" class="input_block" name="freeboard_seq" value="<c:out value='${freeboardInfo.freeboard_seq }'></c:out>">
	    			<input type ="hidden" class="input_block" name="del_id" value="<c:out value='${member.memberId }'></c:out>">
	    			<div class="form_section_title">
	    				<label>제목</label>
	    			</div>
	    			<div class="form_section_content">
	    				<input name="title" value="<c:out value='${freeboardInfo.title }'></c:out>">
						<span id="warn_freeboardTitle">제목을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>내용</label>
					</div>
					<div class="form_section_content bit">
						<textarea name="conts"><c:out value='${freeboardInfo.conts }'/></textarea>
           				<span id="warn_freeboardConts">내용을 입력해주세요.</span>
           			</div>
           		</div>
           		<div class="btn_section">
	   				<button id="cancelBtn" class="btn">취 소</button>
	         		<button id="modifyBtn" class="btn modify_btn">수 정</button>
	         		<button id="deleteBtn" class="btn delete_btn">삭 제</button>
	           	</div> 
	        </form>
	    </div>  
	</div>
	
	<form id="moveForm" method="get" >
		<input type="hidden" name='freeboard_seq' value='<c:out value="${freeboardInfo.freeboard_seq }"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
        <input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
        <input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
	</form> 
<%@include file="../includes/admin/footer.jsp" %>

	<script>
	let moveForm = $("#moveForm");
	let modifyForm = $("#modifyForm");

	/* 취소 버튼 */
	$("#cancelBtn").on("click", function(e){
		
		e.preventDefault();
				
		moveForm.attr("action", "/admin/freeboard")
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
	
	/* 삭제 버튼 */
	$("#deleteBtn").on("click", function(e){
		
		e.preventDefault();
		
		modifyForm.attr("action", "/admin/freeboardDelete");
		modifyForm.submit();
		
		alert("게시물을 삭제하였습니다.");
	});
	
	</script>

</body>
</html>