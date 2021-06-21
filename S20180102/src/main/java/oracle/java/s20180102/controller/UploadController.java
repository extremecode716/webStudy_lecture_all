package oracle.java.s20180102.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.NoticeDto;
import oracle.java.s20180102.model.ReviewDto;
import oracle.java.s20180102.service.GServService;
import oracle.java.s20180102.service.GuideService;
import oracle.java.s20180102.service.MemberService;
import oracle.java.s20180102.service.NoticeService;
import oracle.java.s20180102.service.ReviewService;
import oracle.java.s20180102.vo.GServContentsVo;

@Controller
public class UploadController {

  private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

  @Resource(name = "uploadPath")
	  private String uploadPath;
  @Autowired
  	private GuideService gs;
  @Autowired
  	private GServService gss;
  @Autowired
	private ReviewService revs;
  @Autowired
  	private MemberService mbs;
  @Autowired
  	private NoticeService ns;
  @RequestMapping(value = "inRImg", method = RequestMethod.GET)
  public void inRImg() {
		System.out.println("uploadForm GET Start");
 }
  
/* 후기 등록  */
  
/*  @RequestMapping(value = "inRImg", method = RequestMethod.POST)
  public String inRImg(@RequestParam("images") List<MultipartFile> rImg, HttpServletRequest request, Model model) throws Exception {
		String[] savedName = new String[rImg.size()];
		for(int i=0; i<rImg.size(); i++) {
			savedName[i] = uploadFile(rImg.get(i).getOriginalFilename(), rImg.get(i).getBytes());
		}
	    model.addAttribute("savedName", savedName);
    return "inRImg";
  }*/ // 이 방식으로 뿌려주면 이미지가 리프레쉬되기까지 시간이 약간 걸려서 바로 뜨지 않음...;
  
  @RequestMapping(value="inReviewPro", method = RequestMethod.POST)
	public String writeReviewPro(ReviewDto revDto, HttpServletRequest request, Model model) {
	  	System.out.println(revDto.getMemberId());
		String savedName = "";
		if(revDto.getImages() != null) {      // 이미지가 null이 아니면 실행
			MultipartFile[] images = revDto.getImages();
			for(int i=0; i<images.length; i++) {
				if(!images[i].getOriginalFilename().equals("")) {
					try {
						if(i==0) {
							savedName = uploadFile(images[i].getOriginalFilename(), images[i].getBytes());
						} else {
							savedName +=","+uploadFile(images[i].getOriginalFilename(), images[i].getBytes());
						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} 
					revDto.setRimg(savedName);   // rImg DB 저장될 이름 셋팅
				}
			}			
		}
		
		// 후기등록
		revs.inReview(revDto);
		
		// 회원 포인트 100점 쌓아주기
		String ID = revDto.getMemberId();
		mbs.upPoint(100,ID);

		// currentPage 보내줘야함.
		return "redirect:review_member.do";
	}
  
/* 후기 수정  */  
	@RequestMapping(value="upReviewPro")
	public String updateReviewPro(ReviewDto revDto, HttpServletRequest request, Model model) {
		String savedName = "";
		System.out.println("revDto.getImages" + revDto.getImages());
		if(revDto.getImages() != null) {      // 이미지가 null이 아니면 실행
			MultipartFile[] images = revDto.getImages();
			
			for(int i=0; i<images.length; i++) {
				if(!images[i].getOriginalFilename().equals("")) {
					
					try {
						if(i==0) {
							savedName = uploadFile(images[i].getOriginalFilename(), images[i].getBytes());
						} else {
							savedName +=","+uploadFile(images[i].getOriginalFilename(), images[i].getBytes());
						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} 
					revDto.setRimg(savedName);   // rImg DB 저장될 이름 셋팅	
				}
				
			}			
		}
		// 수정시 파일이  null로 들어왔을 때 처리
		if(revDto.getRimg() == null) {
			ReviewDto rDto =  revs.oneReview(revDto);
			revDto.setRimg(rDto.getRimg());
		}
		
		// 리뷰 수정
		revs.upReview(revDto);
		return "redirect:review_member.do";
	} 
	
/* 회원 프로필 수정  */  
	@RequestMapping(value="user_update",  method = RequestMethod.POST)
	public String  user_update(MemberDto mbDto, Model model) {
		String savedName = "";
		if(mbDto.getMemberImage() != null) {      // 이미지가 null이 아니면 실행
			MultipartFile images = mbDto.getMemberImage();
			
			if(!images.getOriginalFilename().equals("")) {
					try {
						savedName = uploadFile(images.getOriginalFilename(), images.getBytes());
					}  catch (Exception e) {
						System.out.println(e.getMessage());
					}
					mbDto.setMimg(savedName);   // gImg DB 저장될 이름 셋팅	
				}
			// 수정시 파일이  ""로 들어왔을 때 처리
			if(images.getOriginalFilename().equals("")) {
				MemberDto mbdto2 =  mbs.selMember(mbDto.getMemberId());
				mbDto.setMimg(mbdto2.getMimg());
			}
		}
		
		// 수정시 파일이  null로 들어왔을 때 처리
		if(mbDto.getMemberImage() == null) {
			MemberDto mbdto2 =  mbs.selMember(mbDto.getMemberId());
			mbDto.setMimg(mbdto2.getMimg());
		}
		
		mbs.upMember(mbDto); // 프로필 수정
		return "redirect:user_info.do";
	}
	
// 가이드 등록
	@RequestMapping(value="g_join", method=RequestMethod.POST)
	public String g_join(@ModelAttribute GuideDto gDto,HttpSession session,Model model) {
			String savedName = "";
			if(gDto.getGuideImg() != null) {      // 이미지가 null이 아니면 실행
				MultipartFile images = gDto.getGuideImg();
				
				if(!images.getOriginalFilename().equals("")) {
						try {
							savedName = uploadFile(images.getOriginalFilename(), images.getBytes());
						}  catch (Exception e) {
							System.out.println(e.getMessage());
						}
						gDto.setGimg(savedName);   // gImg DB 저장될 이름 셋팅	
					}
			}
			if(gDto.getGpage().equals("")) {
				gDto.setGpage(null);
			}
			//가이드 등록
			gs.g_join(gDto);
			
			//권한 변경
			String ID=(String)session.getAttribute("ID");
			MemberDto mbDto =  mbs.selMember(ID);
			mbDto.setAuthority("2");
			mbs.upMember(mbDto);
			
			//session에 gno담기
			GuideDto gDto2 = gs.g_info(gDto.getMemberId());
			String gno = gDto2.getGno()+"";
			session.setAttribute("gno", gno);
			return "redirect:profile_guide.do";
	}
		
	
/* 가이드 프로필 수정  */  
	@RequestMapping(value="upGuidePro", method = RequestMethod.POST)
	public String upGuidePro(GuideDto gDto, Model model) {
		String savedName = "";
		if(gDto.getGuideImg() != null) {      // 이미지가 null이 아니면 실행
			MultipartFile images = gDto.getGuideImg();
			
			if(!images.getOriginalFilename().equals("")) {
					try {
						savedName = uploadFile(images.getOriginalFilename(), images.getBytes());
					}  catch (Exception e) {
						System.out.println(e.getMessage());
					}
					gDto.setGimg(savedName);   // gImg DB 저장될 이름 셋팅	
				}
			// 수정시 파일이  null로 들어왔을 때 처리
			if(images.getOriginalFilename().equals("")) {
				GuideDto gdto =  gs.g_info(gDto.getMemberId());
				gDto.setGimg(gdto.getGimg());
			}
		}
		
		gs.upGuide(gDto); // 프로필 수정
		
		return "redirect:profile_guide.do";
	}
	
/*    회원가입[Member]   */
	@RequestMapping(value="joinMember")
	public String joinMember(MemberDto mbDto, Model model) {
		String savedName = "";
		if(mbDto.getMemberImage() != null) {      // 이미지가 null이 아니면 실행
			MultipartFile images = mbDto.getMemberImage();
			
			if(!images.getOriginalFilename().equals("")) {
					try {
						savedName = uploadFile(images.getOriginalFilename(), images.getBytes());
					}  catch (Exception e) {
						System.out.println(e.getMessage());
					}
					mbDto.setMimg(savedName);   // gImg DB 저장될 이름 셋팅	
				}
		
		}
		int count =mbs.inMember(mbDto);

		// 성공하면  logInForm
		// 실패하면  joinForm
		
		if (count > 0) {
			return "redirect:main.do";
		}
		else {
			model.addAttribute("msg","입력 실패 확인해 보세요");
			return "history.back(-1)";
		}
	}	

	
/*    공지사항 등록   */	
	@RequestMapping(value = "writeNoticePro")
	public String writeNoticePro(NoticeDto nDto, Model model) {
		String savedName = "";
		System.out.println("nDto.getFiles() : " + nDto.getFiles());
		if(nDto.getFiles() != null) {      // 이미지가 null이 아니면 실행
			MultipartFile[] files = nDto.getFiles();
			
			for(int i=0; i<files.length; i++) {
				if(!files[i].getOriginalFilename().equals("")) {
					
					try {
						if(i==0) {
							savedName = uploadFile(files[i].getOriginalFilename(), files[i].getBytes());
						} else {
							savedName +=","+uploadFile(files[i].getOriginalFilename(), files[i].getBytes());
						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} 
					nDto.setNimg(savedName);   // nImg DB 저장될 이름 셋팅	
				}
				
			}			
		}
		ns.inNotice(nDto);
		return "redirect:noticeList.do";
	}
	
/*    공지사항 수정   */	
	@RequestMapping(value = "upNoticePro", method = {RequestMethod.GET, RequestMethod.POST})
	public String upNoticePro(NoticeDto nDto, Model model) {
		String savedName = "";
		if(nDto.getFiles() != null) {      // 이미지가 null이 아니면 실행
			MultipartFile[] files = nDto.getFiles();
			
			for(int i=0; i<files.length; i++) {
				if(!files[i].getOriginalFilename().equals("")) {
					
					try {
						if(i==0) {
							savedName = uploadFile(files[i].getOriginalFilename(), files[i].getBytes());
						} else {
							savedName +=","+uploadFile(files[i].getOriginalFilename(), files[i].getBytes());
						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} 
					nDto.setNimg(savedName);   // nImg DB 저장될 이름 셋팅	
				}
				
			}			
		}
		ns.upNotice(nDto);
		return "redirect:noticeList.do";
	}
	

/*    첨부파일 다운로드   */		
	@RequestMapping("download")
	public ModelAndView download(String filename, HttpServletRequest request) throws Exception {
		File downloadFile = new File(uploadPath + "\\" + filename);
		if(!downloadFile.canRead()){
		        throw new Exception("File can't read(파일을 찾을 수 없습니다)");
		  }
		// download 라는 View에 출력하고
		// downloadFile 이라는 이름으로
		// downloadFile 이라는 데이터를 전송
		return new ModelAndView("fileDownloadView", "downloadFile", downloadFile);
	}
	
	
	
/*-----------------------------------------------------------------------------------------
	태욱
------------------------------------------------------------------------------------------*/
	
	  @RequestMapping(value="selGServPro", method=RequestMethod.POST)
			public String selGServPro(GServContentsVo gsctVO, String[] imgSrc, Model model) throws IOException, Exception {
				String[] savedName = new String[(gsctVO.getGservIntro()).length];
				String gServDay = "";
				for(int i = 0; i < gsctVO.getDays().length; i++) {
					if((i+1)==gsctVO.getDays().length) {
						gServDay +=  gsctVO.getDays()[i];
					}else {
						gServDay +=  gsctVO.getDays()[i]+",";
					}
				}
				gsctVO.setGservDay(gServDay);
				gsctVO.setGservGps(gsctVO.getPickUpLoc());
				MultipartFile[] images = gsctVO.getImgfile();
				if(images!=null) {
				for(int i = 0; i< images.length+1; i++) {
					try {
						if(i==0) {
							if(gsctVO.getPickUpImg()!= null) {
								savedName[i] = uploadFile(gsctVO.getPickUpImg().getOriginalFilename(), gsctVO.getPickUpImg().getBytes());
							} else {
								savedName[i] = null;
							}
						} else {
							if(images[i-1].getSize() > 10) {
							savedName[i] = uploadFile(images[i-1].getOriginalFilename(), images[i-1].getBytes());
							}else {
								savedName[i] = gsctVO.getImgSrc()[i-1];
							}
						}
						
					} catch (Exception e) {
						System.out.println("e.getMessage() = "+e.getMessage());
					}
					}
					gsctVO.setImgSrc(savedName);   // rImg DB 저장 
				} else {
					String[] newImgSrc = new String[gsctVO.getImgSrc().length+1];
					for (int i = 0; i < newImgSrc.length; i++) {
						if(i==0) {
							if(gsctVO.getPickUpImg()!= null) {
								newImgSrc[i] = uploadFile(gsctVO.getPickUpImg().getOriginalFilename(), gsctVO.getPickUpImg().getBytes());
							} else {
								newImgSrc[i] = null;
							}
						} else {
							newImgSrc[i] = gsctVO.getImgSrc()[i-1];
						}
					}
					gsctVO.setImgSrc(newImgSrc);
				}
				gss.upGServ(gsctVO);
				
				model.addAttribute("gNo", gsctVO.getGno());
				return "redirect:service_guide.do";
		  }
	  
		  
		  @RequestMapping(value="inGServPro", method=RequestMethod.POST)
			public String inGServPro(GServContentsVo gsctVO, Model model) {
				System.out.println("gsDto = " + gsctVO);
				String[] savedName = new String[(gsctVO.getGservIntro()).length];
				String gServDay = "";
				//System.out.println("gServArea = " + gsctVO.getgServArea());
				for(int i = 0; i < gsctVO.getDays().length; i++) {
					if((i+1)==gsctVO.getDays().length) {
						gServDay +=  gsctVO.getDays()[i];
					}else {
						gServDay +=  gsctVO.getDays()[i]+",";
					}
				}
				
				gsctVO.setGservDay(gServDay);
				gsctVO.setGservGps(gsctVO.getPickUpLoc());
				MultipartFile[] images = gsctVO.getImgfile();
				System.out.println("gsctVO.getGservGps() "+gsctVO.getGservGps());
				System.out.println("images.length = " + images.length);
				System.out.println("gsctVO.getIntroTitle() = " + gsctVO.getIntroTitle());
				if(images!=null) {
					for(int i = 0; i<images.length+1; i++) {
						try {
							if(i==0) {
								if(gsctVO.getPickUpImg()!= null) {
									savedName[i] = uploadFile(gsctVO.getPickUpImg().getOriginalFilename(), gsctVO.getPickUpImg().getBytes());
								} else {
									savedName[i] = null;
								}
							} else {
								if(images[i-1].getBytes() != null) {
								savedName[i] = uploadFile(images[i-1].getOriginalFilename(), images[i-1].getBytes());
								System.out.println("savedName["+i+"] = " + savedName[i]);
								}
							}
							
						} catch (Exception e) {
							System.out.println(e.getMessage());
						} 
						gsctVO.setImgSrc(savedName);   // rImg DB 저장 
						System.out.println("savedName.length = " + savedName.length);
						}
					}
				
				System.out.println("gServNo ->>>"+gsctVO.getGservNo());
				gss.inGServ(gsctVO);
				
				model.addAttribute("gNo", gsctVO.getGno());
				return "redirect:service_guide.do";
		}
  
  
  
//태욱-----------------------------------------------------------------------------------------
		
	
  private String uploadFile(String originalName, byte[] fileData) throws Exception {

    UUID uid = UUID.randomUUID();
    String savedName = uid.toString() + "_" + originalName;
    File target = new File(uploadPath, savedName);
    FileCopyUtils.copy(fileData, target);
    return savedName;

  }
  

}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 