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
<style type="text/css">
#result_card img{
	max-width: 100%;
    height: auto;
    display: block;
    padding: 5px;
    margin-top: 10px;
    margin: auto;	
}
#result_card {
	position: relative;
}
.DeleteBtn{
    position: absolute;
    top: 0;
    right: 5%;
    background-color: #ef7d7d;
    color: wheat;
    font-weight: 900;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    line-height: 26px;
    text-align: center;
    border: none;
    display: block;
    cursor: pointer;	
}
	
</style>
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
				<form action="/freeboardAdd" method="post" id="freeboardAddForm">
					<div class="form_section">
			  			<div class="form_section_title">
			  				<label>작성자</label>
			  			</div>
			  			<div>
			  				<input name="reg_id" type="hidden" value="${member.memberId}" disabled >
			  			</div>
			  			<div class="form_section_content">
			  				<input name="reg_nm" type="text" value="${member.memberName}" disabled>
			  			</div>
			  		</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>제목</label>
						</div>
						<div class="form_section_content">
							<input name="title">
							<span id="warn_freeboardTitle">제목을 입력 해주세요.</span>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>내용</label>
						</div>
						<div class="form_section_content">
							<textarea name="conts" id="conts" rows="4" cols="80 "placeholder="내용을 입력하세요."></textarea>
							<span id="warn_freeboardConts">내용을 입력 해주세요.</span>
						</div>
					</div>
					<div class="form_section">
               			<div class="form_section_title">
               				<label>첨부파일</label>
               			</div>
               			<div class="form_section_content">
               				<input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
               				<div id="uploadResult">
               					<!-- <div id="result_card">
									<div class="DeleteBtn">x</div>
									
								</div> -->
							</div>
               			</div>
               		</div>  
				</form>
				<div class="btn_section">
					<button id="cancelBtn" class="btn">취 소</button>
			 		<button id="freeboardAddBtn" class="btn enroll_btn">등 록</button>
			 	</div>
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
let freeboardAddForm = $("#freeboardAddForm")

/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="/freeboard"
	
});

/* 상품 등록 버튼 */
$("#freeboardAddBtn").on("click",function(e){
	
	let title = $(".form_section_content input[name='title']").val();
	let conts = $(".form_section_content textarea").val();	
	
	let	titleCk = false;
	let contsCk = false;
	
	e.preventDefault();
	
	$("input[name=reg_id]").attr("disabled", false);
	$("input[name=reg_nm]").attr("disabled", false);
	
	
	
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
		freeboardAddForm.submit();
		alert("완료");
	} else {
		return false;
	}
});

/* 파일 업로드 */
$("input[type='file']").on("change", function(e){
	
	let formData = new FormData();
	let fileInput = $('input[name="uploadFile"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
	
	formData.append("uploadFile", fileObj);
	
	$.ajax({
		url: '/uploadAjaxAction',
		processData : false,
		contentType : false,
		data : formData,
		type : 'POST',
		dataType : 'json',
		success : function(result) {
			console.log("success 콘솔~");
			console.log(result);
			showUploadFile(result);
		},
		error : function(result) {
			alert("에러");
		}
	});
});

/* var, method related with attachFile */
let maxSize = 1048576; //1MB

function fileCheck(fileName, fileSize){

	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	
	return true;		
	
}

//첨부파일 출력
function showUploadFile(uploadResultArr){
	
	//데이터 검증
	if(!uploadResultArr || uploadResultArr.length == 0){
		return
	}
	
	let uploadResult = $("#uploadResult");
	let obj = uploadResultArr[0];
	let str = "";
	
	str += "<div id = 'result_card'>";
	str += "<div class = 'DeleteBtn'>x</div>";
	str += "<input type='hidden' name='uploadList[0].fileName' value='"+ obj.fileName +"'>";
	str += "<input type='hidden' name='uploadList[0].uuid' value='"+ obj.uuid +"'>";
	str += "</div>";
	
	uploadResult.append(str);
	
}

</script>
</body>
</html>