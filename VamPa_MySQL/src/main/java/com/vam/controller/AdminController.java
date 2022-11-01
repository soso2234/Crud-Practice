package com.vam.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.Criteria;
import com.vam.model.FreeboardVO;
import com.vam.model.NoticeAddVO;
import com.vam.model.PageDTO;
import com.vam.service.FreeboardService;
import com.vam.service.NoticeAddService;

@Controller
@RequestMapping("/admin")
public class AdminController {
 
    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    
    @Autowired
    private NoticeAddService noticeAddService;
    
    @Autowired
	private FreeboardService freeboardService;
    
    /* 관리자 메인 페이지 이동 */
    @RequestMapping(value="main", method = RequestMethod.GET)
    public void adminMainGET() throws Exception{
        
        logger.info("관리자 페이지 이동");
        
    }
    
    /* 공지사항 관리 페이지 접속 */
    @RequestMapping(value = "notice", method = RequestMethod.GET)
    public void noticeGET(Criteria cri, Model model) throws Exception{
        logger.info("공지사항 관리 페이지 접속 = " + cri);
        
        /* 공지사항 목록 출력 데이터 */
        List list = noticeAddService.noticeAddGetList(cri);
        
        model.addAttribute("list", list);
        
        /* 페이지 이동 인터페이스 데이터 */
        int total = noticeAddService.noticeAddGetTotal(cri);
        
        PageDTO pageMaker = new PageDTO(cri, total);
        
        model.addAttribute("pageMaker", pageMaker);
    }
    
    /* 공지사항 등록 페이지 접속 */
    @RequestMapping(value = "noticeAdd", method = RequestMethod.GET)
    public void noticeAddGET() throws Exception{
        logger.info("공지사항 등록 페이지 접속");
    }
    
    /* 자유게시판 관리 페이지 접속 */
    @RequestMapping(value = "freeboard", method = RequestMethod.GET)
    public void freeboardGET(Criteria cri, Model model) throws Exception{
        logger.info("자유게시판 관리 페이지 접속");
        
        /* 자유게시판 리스트 데이터 */
		List list = freeboardService.freeboardGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, freeboardService.freeboardGetTotal(cri)));
    }
    
    /* 자유게시판 등록 페이지 접속 */
    @RequestMapping(value = "freeboardAdd", method = RequestMethod.GET)
    public void freeboardAddGET() throws Exception{
        logger.info("자유게시판 등록 페이지 접속");
    }
    
    /* 공지사항 등록 */
    @RequestMapping(value="noticeAdd.do", method = RequestMethod.POST)
    public String noticeAddPOST(NoticeAddVO notice, RedirectAttributes rttr) throws Exception{
    	logger.info("noticeAdd :" +  notice);
    	
    	noticeAddService.noticeAdd(notice);      // 작가 등록 쿼리 수행
    	
    	rttr.addFlashAttribute("noticeAdd_result", notice.getTitle());
    	
    	return "redirect:/admin/notice";
    }
    
    /* 공지사항 상세 페이지 */
	@GetMapping({"/noticeDetail", "/noticeModify"})
	public void noticeAddGetInfoGET(int notice_seq, Criteria cri, Model model) throws Exception {
		
		logger.info("noticeAddGetDetail......." + notice_seq);
		
		/* 공지사항 관리 페이지 정보 */
		model.addAttribute("cri", cri);
		
		/* 공지사항 정보 */
		model.addAttribute("noticeAddGetInfo", noticeAddService.noticeAddGetDetail(notice_seq));
		
	}
	
	
	/* 공지사항 수정 */
	@PostMapping("/noticeModify")
	public String noticeModifyPOST(NoticeAddVO notice, RedirectAttributes rttr) throws Exception{
		
		logger.info("noticeModifyPOST......." + notice);
		
		int result = noticeAddService.noticeModify(notice);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/notice";
		
	}
	
	/* 공지사항 삭제 */
	@PostMapping("/noticeDelete")
	public String noticeDeletePOST(NoticeAddVO notice, RedirectAttributes rttr) throws Exception{
		
		logger.info("noticeDeletePOST......." + notice);
		
		int result = noticeAddService.noticeDelete(notice);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/notice";
		
	}
	
	/* 자유게시판 등록 */
	@PostMapping("/freeboardAdd")
	public String freeboardAddPOST(FreeboardVO freeboard, RedirectAttributes rttr) {

		logger.info("freeboardAddPOST ==" + freeboard);
		
		freeboardService.freeboardAdd(freeboard);
		
		rttr.addFlashAttribute("freeboardAdd_result", freeboard.getTitle());
		
		return "redirect:/admin/freeboard";
	}
	
	/* 자유게시판 상세 페이지 */
	@GetMapping({"/freeboardDetail", "/freeboardModify"})
	public void freeboardGetInfoGET(int freeboard_seq, Criteria cri, Model model) {
		
		logger.info("freeboardGetInfo() == " + freeboard_seq);
		
		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);
		
		/* 조회 페이지 정보 */
		model.addAttribute("freeboardInfo", freeboardService.freeboardGetDetail(freeboard_seq));
	}
	
	/* 자유게시판 수정 */
	@PostMapping("/freeboardModify")
	public String freeboardModifyPOST(FreeboardVO freeboard, RedirectAttributes rttr) {
		
		logger.info("freeboardModifyPOST == " + freeboard);
		
		int result = freeboardService.freeboardModify(freeboard);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/freeboard";
		
	}
	
	/* 자유게시판 삭제 */
	@PostMapping("/freeboardDelete")
	public String freeboardDeletePOST(FreeboardVO freeboard, RedirectAttributes rttr) {
		
		logger.info("freeboardDeletePOST == ");
		
		int result = freeboardService.freeboardDelete(freeboard);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/freeboard";
		
	}
	
}