package com.vam.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.mapper.UploadMapper;
import com.vam.model.Criteria;
import com.vam.model.FreeboardVO;
import com.vam.model.NoticeAddVO;
import com.vam.model.PageDTO;
import com.vam.model.UploadVO;
import com.vam.service.FreeboardService;
import com.vam.service.NoticeService;

@Controller
public class BookController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private FreeboardService freeboardService;
	
	@Autowired
	private UploadMapper uploadMapper;
	
	//메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET() {
		
		logger.info("메인 페이지 진입");
		
	}
	
	@GetMapping("/search")
	public String searchGet(Criteria cri, Model model) {
		
		logger.info("cri =" + cri);
		
		List<NoticeAddVO> list = noticeService.noticeList(cri);
		
		logger.info("list = " + list);
		
		if(!list.isEmpty()) {
			
			model.addAttribute("list", list);
			
			logger.info("list = " + list);
		} else {
			model.addAttribute("list check", "empty");
			
			return "search";
		}
		
		return "search";
	}
	
	//목록
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public void noticeList(Criteria cri, Model model) {
		logger.info("공지사항 접속 = " + cri);;
		
		/* 공지사항 목록 출력 데이터 */
		List list = noticeService.noticeList(cri);
		
		model.addAttribute("list", list);
		
		/* 페이지 이동 인터페이스 데이터 */
		int total = noticeService.noticeTotal(cri);
		
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
	}

	//공지사항 상세
	@GetMapping("noticeDetail")
	public void noticeDetail(int notice_seq, Criteria cri, Model model) {
		
		logger.info("noticeDetail" + notice_seq);
		
		/* 공지사항 관리 페이지 정보 */
		model.addAttribute("cri", cri);
		
		/* 공지사항 정보 */
		model.addAttribute("noticeDetail", noticeService.noticeDetail(notice_seq));
	}
	
	//자유게시판 목록
	@RequestMapping(value = "freeboard", method = RequestMethod.GET)
	public void freeboardList(Criteria cri, Model model) {
		
		logger.info("자유게시판 리스트 접속 = " + cri);
		
		/* 자유게시판 리스트 데이터 */
		List list = freeboardService.freeboardGetList(cri);
		
		model.addAttribute("list", list);
		
		/* 페이지 이동 인터페이스 데이터 */
		int total = freeboardService.freeboardGetTotal(cri);
		
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	/* 자유게시판 등록 페이지 접속 */
    @RequestMapping(value = "freeboardAdd", method = RequestMethod.GET)
    public void freeboardAdd() throws Exception{
    	
        logger.info("자유게시판 등록 페이지 접속");
   
    }
    
    /* 자유게시판 삭제 페이지 접속 */
    @RequestMapping(value = "freeboardDelete", method = RequestMethod.GET)
    public void freeboardDelete() throws Exception{
    	
        logger.info("자유게시판 삭제 페이지 접속");
   
    }
	
	//자유게시판 등록
	@PostMapping("freeboardAdd")
	public String freeboardAdd(FreeboardVO freeboard, RedirectAttributes rttr) {
		
		logger.info("freeboardAdd == " + freeboard);
		
		freeboardService.freeboardAdd(freeboard);
		
		rttr.addFlashAttribute("freeboardAdd_result", freeboard.getTitle());
		
		return "redirect:/freeboard";
		
	}
	
	//자유게시판 상세 페이지
	@GetMapping({"/freeboardDetail", "/freeboardModify"})
	public void freeboardInfo(int freeboard_seq, Criteria cri, Model model) {
		
		logger.info("freeboardDetail = " + freeboard_seq);
		
		//목록 페이지 조건 정보
		model.addAttribute("cri", cri);
		
		//조회페이지 정보
		model.addAttribute("freeboardInfo", freeboardService.freeboardGetDetail(freeboard_seq));
	}
	
	//자유게시판 수정
	@PostMapping("/freeboardModify")
	public String freeboardModify(FreeboardVO freeboard, RedirectAttributes rttr) {
		
		logger.info("freeboardModify = " + freeboard);
		
		int result = freeboardService.freeboardModify(freeboard);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/freeboard";
		
	}
	
	//자유게시판 삭제
	@PostMapping("/freeboardDelete")
	public String freeboardDelete(FreeboardVO freeboard, RedirectAttributes rttr) {
		
		logger.info("freeboardDelete == ");
		
		int result = freeboardService.freeboardDelete(freeboard);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/freeboard";
		
	}
	
	//첨부 파일 업로드
	//@PostMapping("/uploadAjaxAction")
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<UploadVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		System.out.println("uploadAjaxActionPOST == ");
		//파일 체크
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				System.out.println("MIME TYPE = " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		String uploadFolder = "D:\\workspace\\VamPa_MySQL\\upload";
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* 파일 정보 담는 객체 */
		List<UploadVO> list = new ArrayList();
		
		// 향상된 for
		for(MultipartFile multipartFile : uploadFile) {
			
			/* 파일 정보 담는 객체 */
			UploadVO vo = new UploadVO();
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			list.add(vo);
		}
		
		ResponseEntity<List<UploadVO>> result = new ResponseEntity<List<UploadVO>>(list, HttpStatus.OK);
		
		return result;
		
	}
	
	//첨부 파일 삭제
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		
		System.out.println("deleteFile == " + fileName);
		
		File file = null;
		
		try {
			
			file = new File("D:\\workspace\\VamPa_MySQL\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			//원본파일 삭제
			String originFileName = file.getAbsolutePath().replace("", "");
			
			System.out.println("originFileName = " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	
	//첨부파일 정보 반환
	@GetMapping(value="getUploadList")
	public ResponseEntity<List<UploadVO>> getUploadList(int freeboard_seq) {
		
		System.out.println("getUploadList Controller =============== " + freeboard_seq);
		
		return new ResponseEntity<List<UploadVO>>(uploadMapper.getUploadList(freeboard_seq), HttpStatus.OK);
	}
	
}
