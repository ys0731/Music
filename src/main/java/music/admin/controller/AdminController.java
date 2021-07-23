package music.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.Session;

import music.admin.album.AdminAlbumService;
import music.admin.album.AdminAlbumVo;
import music.admin.artist.AdminArtistService;
import music.admin.artist.AdminArtistVo;
import music.admin.recommend.AdminRecommendService;
import music.admin.recommend.AdminRecommendVo;
import music.admin.song.AdminSongService;
import music.admin.song.AdminSongVo;

@Controller
public class AdminController {
	
	@Autowired
	AdminAlbumService albumService;
	
	@Autowired
	AdminArtistService artistService;
	
	@Autowired
	AdminSongService songService;

	@Autowired
	AdminRecommendService recommendService;
	
	//-----------------------------------------------------------index.do
	
	@RequestMapping("/admin/album/index.do")
	public String albumIndex(Model model, AdminAlbumVo vo) {
		model.addAttribute("list", albumService.selectAll(vo));
		return "admin/album/index";
	}
	
	@RequestMapping("/admin/artist/index.do")
	public String artistIndex(Model model, AdminArtistVo vo) {
		model.addAttribute("list", artistService.selectAll(vo));
		return "admin/artist/index";
	}
	
	@RequestMapping("/admin/song/index.do")
	public String songIndex(Model model, AdminSongVo vo) {
		model.addAttribute("list", songService.selectAll(vo));
		return "admin/song/index";
	}

	@RequestMapping("/admin/recommend/index.do")
	public String recommendIndex(Model model, AdminRecommendVo vo) {
		return "admin/recommend/index";
	}
	
	@RequestMapping("/admin/recommend/sendtwolist.do")
	@ResponseBody
	public void recommendListIndexSend(HttpServletRequest req, HttpSession sess) {
		String[] list1 = req.getParameterValues("chkArr1"); // today
		String[] list2 = req.getParameterValues("chkArr2"); // tag
		AdminRecommendVo asv1 = new AdminRecommendVo();
		AdminRecommendVo asv2 = new AdminRecommendVo();
		List<AdminRecommendVo> li1 = new ArrayList<AdminRecommendVo>();
		List<AdminRecommendVo> li2 = new ArrayList<AdminRecommendVo>();
		
		for (String i : list1) {
			asv1.setNo(Integer.parseInt(i));
			li1.add(recommendService.selectListOne(asv1));
		}
		
		for (String i : list2) {
			asv2.setNo(Integer.parseInt(i));
			li2.add(recommendService.selectListOne(asv2));
		}
		
		sess.setAttribute("todayListShow", li1);
		sess.setAttribute("tagListShow", li2);
	}
	
	@RequestMapping("/admin/recommend/removetwolist.do")
	public String recommendListInvalidate(HttpSession sess) {
		sess.removeAttribute("todayListShow");
		sess.removeAttribute("tagListShow");
		return "admin/recommend/index";
	}
	//-----------------------------------------------------------list.do
	
	@RequestMapping("/admin/recommend/list.do")
	public String recommendSongList(Model model, AdminSongVo vo) {
		model.addAttribute("list", recommendService.selectAll(vo));
		return "admin/recommend/list";
	}
	
	@RequestMapping("/admin/recommend/todayntaglist.do")
	public String recommendTodayTagList(Model model, AdminRecommendVo vo) {
		model.addAttribute("todayList", recommendService.selectToday(vo));
		model.addAttribute("tagList", recommendService.selectTag(vo));
		return "admin/recommend/todayTagList";
	}

	//-----------------------------------------------------------view.do	
	
	@RequestMapping("/admin/album/view.do")
	public String albumView(Model model, AdminAlbumVo vo) {
		model.addAttribute("vo", albumService.detail(vo));
		String reldate = albumService.detail(vo).getReldate();
		String form = reldate.substring(0,4)+"년"+reldate.substring(4,6)+"월"+reldate.substring(6,8)+"일";
		model.addAttribute("reldateForm", form);
		return "admin/album/view";
	}

	@RequestMapping("/admin/artist/view.do")
	public String artistView(Model model, AdminArtistVo vo) {
		model.addAttribute("vo", artistService.detail(vo));
		String reldate = artistService.detail(vo).getDebdate();
		String form = reldate.substring(0,4)+"년"+reldate.substring(4,6)+"월"+reldate.substring(6,8)+"일";
		model.addAttribute("debdateForm", form);
		return "admin/artist/view";
	}
	
	@RequestMapping("/admin/song/view.do")
	public String songView(Model model, AdminSongVo vo) {
		model.addAttribute("vo", songService.detail(vo));
		return "admin/song/view";
	}
	
	//-----------------------------------------------------------write.do
	
	@RequestMapping("/admin/album/write.do")
	public String albumWrite() {
		return "admin/album/write";
	}
	
	@RequestMapping("/admin/artist/write.do")
	public String artistWrite() {
		return "admin/artist/write";
	}
	
	@RequestMapping(value = "/admin/song/write.do", method = RequestMethod.GET)
	public String songWrite(Model model, AdminAlbumVo albumVo, AdminArtistVo artistVo) {
		model.addAttribute("albumList", albumService.selectAllAlbums(albumVo));
		model.addAttribute("artistList", artistService.selectAllArtists(artistVo));
		return "admin/song/write";
	}
	
	@RequestMapping(value = "/admin/song/write.do", method = RequestMethod.POST)
	public void songWrite(AdminAlbumVo aav1, AdminArtistVo aav2, HttpServletResponse res) throws IOException {
		AdminAlbumVo albumVo = songService.exist1(aav1);
		AdminArtistVo artistVo = songService.exist2(aav2);
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		if (albumVo == null && artistVo == null) {
			out.print("allFalse");
		} else if (albumVo == null) {
			out.print("albumFalse");
		} else if (artistVo == null) {
			out.print("artistFalse");
		} 
	}
	
	@GetMapping("/admin/recommend/write.do")
	public String recommendSongWrite() {
		return "admin/recommend/write";
	}
	
	@PostMapping("/admin/recommend/write.do")
	@ResponseBody
	public void recommendSongIndexSend(HttpServletRequest req, HttpSession sess) {
		String[] list = req.getParameterValues("chkArr");
		AdminSongVo asv = new AdminSongVo();
		List<AdminSongVo> li = new ArrayList<AdminSongVo>();
		
		if (sess.getAttribute("songlist") == null) {
			for (String i : list) {
				// System.out.println(Integer.parseInt(i));
				asv.setNo(Integer.parseInt(i));
				li.add(songService.detail(asv));
			}
			sess.setAttribute("songlist", li);
		} else {
			List<AdminSongVo> lili = (List<AdminSongVo>)sess.getAttribute("songlist");
			
			for (String i : list) {
				// System.out.println(Integer.parseInt(i));
				asv.setNo(Integer.parseInt(i));
				lili.add(songService.detail(asv));
			}
			sess.setAttribute("songlist", lili);
		}
	}
	
	@RequestMapping("/admin/recommend/removelist.do")
	public String recommendSongInvalidate(HttpSession sess) {
		sess.removeAttribute("songlist");
		return "admin/recommend/write";
	}
	
	//-----------------------------------------------------------insert.do
	
	@RequestMapping("/admin/album/insert.do")
	public String albumInsert(Model model, AdminAlbumVo vo, @RequestParam MultipartFile file, HttpServletRequest req) { // 첨부파일 객체 : MultipartFile타입
		if (!file.isEmpty()) { // 첨부파일이 있으면			
			try {
				String org = file.getOriginalFilename(); // 원본 업로드 파일명
				String ext = ""; // 확장자
				
				ext = org.substring(org.lastIndexOf("."));
				String real = new Date().getTime()+ext; // 서버에 저장되는 파일명
				
				// 파일 저장
				String path = req.getRealPath("/upload/"); // 경로
				file.transferTo(new File(path+real)); // 경로 + 파일명 저장
				
				vo.setImg_org(org);
				vo.setImg_real(real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = albumService.insert(vo);
		
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("msg", "등록을 실패하였습니다.");
			model.addAttribute("url", "write.do");
		}
		return "include/alert";
	}
	
	@RequestMapping("/admin/artist/insert.do")
	public String artistInsert(Model model, AdminArtistVo vo, @RequestParam MultipartFile file, HttpServletRequest req) { // 첨부파일 객체 : MultipartFile타입
		if (!file.isEmpty()) { // 첨부파일이 있으면			
			try {
				String org = file.getOriginalFilename(); // 원본 업로드 파일명
				String ext = ""; // 확장자
				
				ext = org.substring(org.lastIndexOf("."));
				String real = new Date().getTime()+ext; // 서버에 저장되는 파일명
				
				// 파일 저장
				String path = req.getRealPath("/upload/"); // 경로
				file.transferTo(new File(path+real)); // 경로 + 파일명 저장
				
				vo.setImg_org(org);
				vo.setImg_real(real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = artistService.insert(vo);
		
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("msg", "등록을 실패하였습니다.");
			model.addAttribute("url", "write.do");
		}
		return "include/alert";
	}
	
	@RequestMapping("/admin/song/insert.do")
	public String songInsert(Model model,
				@RequestParam int album_no,
				@RequestParam int artist_no,
				@RequestParam String[] title,
				@RequestParam int[] genre,
				@RequestParam String[] lyrics,
				@RequestParam MultipartFile[] file,
				HttpServletRequest req) {
		int r = 0;
		for (int i=0; i<title.length; i++) {
			
			if (!file[i].isEmpty()) {		
				try {
					AdminSongVo asv = new AdminSongVo();
					
					String org = file[i].getOriginalFilename();
					String ext = "";
					ext = org.substring(org.lastIndexOf("."));
					String real = new Date().getTime()+ext;
					String path = req.getRealPath("/upload/"); // 경로
					file[i].transferTo(new File(path+real)); // 경로 + 파일명 저장
					
					asv.setSrc_org(org);
					asv.setSrc_real(real);
					
					asv.setTitle(title[i]);
					asv.setAlbum_no(album_no);
					asv.setArtist_no(artist_no);
					asv.setGenre(genre[i]);
					asv.setLyrics(lyrics[i]);
					
					r += songService.insert(asv);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			
		}
		
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("msg", "등록을 실패하였습니다.");
			model.addAttribute("url", "write.do");
		}
		return "include/alert";
	}
	
	@RequestMapping("/admin/recommend/insert.do")
	public String recommendInsert(Model model,
			@RequestParam int group_id,
			@RequestParam MultipartFile file,
			@RequestParam String title,
			@RequestParam String sub_title,
			@RequestParam int[] song_no,
			HttpServletRequest req,
			HttpSession sess) {
		
		int r1 = 0;
		int r2 = 0;
		if (!file.isEmpty()) {		
			try {
				AdminRecommendVo arv1 = new AdminRecommendVo();
				
				String org = file.getOriginalFilename();
				String path = req.getRealPath("/upload/"); // 경로
				file.transferTo(new File(path+org)); // 경로 + 파일명 저장
				
				arv1.setImg(org);
				arv1.setGroup_id(group_id);
				arv1.setTitle(title);
				arv1.setSub_title(sub_title);
				
				r1 = recommendService.insertTop(arv1);
				
				for (int i=0; i<song_no.length; i++) {
					AdminRecommendVo arv2 = new AdminRecommendVo();
					
					arv2.setPackage_id(arv1.getNo());
					arv2.setSong_no(song_no[i]);
					
					r2 += recommendService.insertBottom(arv2);
				}
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
			

		if (r1 > 0 && r2 > 0) {
			sess.removeAttribute("songlist");
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "write.do");
		} else {
			model.addAttribute("msg", "등록을 실패하였습니다.");
			model.addAttribute("url", "write.do");
		}
		return "include/alert";
	}
	
	//-----------------------------------------------------------edit.do
	
	@RequestMapping("/admin/album/edit.do")
	public String albumEdit(Model model, AdminAlbumVo vo) {
		model.addAttribute("vo", albumService.edit(vo));
		return "admin/album/edit";
	}

	@RequestMapping("/admin/artist/edit.do")
	public String artistEdit(Model model, AdminArtistVo vo) {
		model.addAttribute("vo", artistService.edit(vo));
		return "admin/artist/edit";
	}
	
	@RequestMapping("/admin/song/edit.do")
	public String songEdit(Model model, AdminAlbumVo albumVo, AdminArtistVo artistVo, AdminSongVo vo) {
		model.addAttribute("albumList", albumService.selectAllAlbums(albumVo));
		model.addAttribute("artistList", artistService.selectAllArtists(artistVo));
		model.addAttribute("vo", songService.edit(vo));
		return "admin/song/edit";
	}
	
	@RequestMapping(value = "/admin/song/edit.do", method = RequestMethod.POST)
	public void songEdit2(Model model, AdminAlbumVo aav1, AdminArtistVo aav2, HttpServletResponse res) throws IOException {
		AdminAlbumVo albumVo = songService.exist1(aav1);
		AdminArtistVo artistVo = songService.exist2(aav2);
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		if (albumVo == null && artistVo == null) {
			out.print("allFalse");
		} else if (albumVo == null) {
			out.print("albumFalse");
		} else if (artistVo == null) {
			out.print("artistFalse");
		} 
	}
	
	//-----------------------------------------------------------update.do
	
	@RequestMapping("/admin/album/update.do")
	public String albumUpdate(Model model, AdminAlbumVo vo, @RequestParam MultipartFile file, HttpServletRequest req) { // 첨부파일 객체 : MultipartFile타입
		if (!file.isEmpty()) { // 첨부파일이 있으면			
			try {
				String org = file.getOriginalFilename(); // 원본 업로드 파일명
				String ext = ""; // 확장자
				
				ext = org.substring(org.lastIndexOf("."));
				String real = new Date().getTime()+ext; // 서버에 저장되는 파일명
				
				// 파일 저장
				String path = req.getRealPath("/upload/"); // 경로
				file.transferTo(new File(path+real)); // 경로 + 파일명 저장
				
				vo.setImg_org(org);
				vo.setImg_real(real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = albumService.update(vo);
		
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("msg", "수정을 실패하였습니다.");
			model.addAttribute("url", "edit.do?no=" + vo.getNo());
		}
		return "include/alert";
	}
	
	@RequestMapping("/admin/artist/update.do")
	public String artistUpdate(Model model, AdminArtistVo vo, @RequestParam MultipartFile file, HttpServletRequest req) { // 첨부파일 객체 : MultipartFile타입
		if (!file.isEmpty()) { // 첨부파일이 있으면			
			try {
				String org = file.getOriginalFilename(); // 원본 업로드 파일명
				String ext = ""; // 확장자
				
				ext = org.substring(org.lastIndexOf("."));
				String real = new Date().getTime()+ext; // 서버에 저장되는 파일명
				
				// 파일 저장
				String path = req.getRealPath("/upload/"); // 경로
				file.transferTo(new File(path+real)); // 경로 + 파일명 저장
				
				vo.setImg_org(org);
				vo.setImg_real(real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = artistService.update(vo);
		
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("msg", "수정을 실패하였습니다.");
			model.addAttribute("url", "edit.do?no=" + vo.getNo());
		}
		return "include/alert";
	}
	
	@RequestMapping("/admin/song/update.do")
	public String songUpdate(Model model, AdminSongVo vo, @RequestParam MultipartFile file, HttpServletRequest req) { // 첨부파일 객체 : MultipartFile타입
		if (!file.isEmpty()) { // 첨부파일이 있으면			
			try {
				String org = file.getOriginalFilename(); // 원본 업로드 파일명
				String ext = ""; // 확장자
				
				ext = org.substring(org.lastIndexOf("."));
				String real = new Date().getTime()+ext; // 서버에 저장되는 파일명
				
				// 파일 저장
				String path = req.getRealPath("/upload/"); // 경로
				file.transferTo(new File(path+real)); // 경로 + 파일명 저장
				
				vo.setSrc_org(org);
				vo.setSrc_real(real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = songService.update(vo);
		
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "index.do");
		} else {
			model.addAttribute("msg", "수정을 실패하였습니다.");
			model.addAttribute("url", "edit.do?no=" + vo.getNo());
		}
		return "include/alert";
	}
	
	@RequestMapping("/admin/recommend/update.do")
	@ResponseBody
	public void recommendUpdate(Model model, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String[] list = req.getParameterValues("chkArr");
		int reset = 0;
		int r = 0;
		
		reset = recommendService.reset();
		
		int update = 1;
		for (String i : list) {
			AdminRecommendVo arv = new AdminRecommendVo();
			arv.setNo(Integer.parseInt(i));
			arv.setOrder_id(update);
			r += recommendService.update(arv);
			update++;
		}
		System.out.println(reset);
		System.out.println(r);
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		if (r == 8) {
			out.print("true");
		} else {
			out.print("false");
		}
	}
	
	//-----------------------------------------------------------delete.do
	
	@RequestMapping("/admin/album/deleteArr.do")
	public void albumDelete(Model model, AdminAlbumVo vo, @RequestParam(value = "chkbox[]") List<String> chArr, HttpServletResponse res) throws IOException {
		int r = 0;
		int no = 0;
		
		for (String i : chArr) {
			no = Integer.parseInt(i);
			vo.setNo(no);
			r = albumService.delete(vo);

			res.setContentType("text/html;charset=utf-8");
			PrintWriter out = res.getWriter();
			if (r > 0) {
				out.print("true");
			} else {
				out.print("false");
			}
		}
		
	}
	
	@RequestMapping("/admin/album/delete.do")
	public void albumDelete(Model model, AdminAlbumVo vo, HttpServletResponse res) throws IOException {
		int r = albumService.delete(vo);
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		if (r > 0) {
			out.print("true");
		} else {
			out.print("false");
		}
	}
	
	@RequestMapping("/admin/artist/deleteArr.do")
	public void artistDelete(Model model, AdminArtistVo vo, @RequestParam(value = "chkbox[]") List<String> chArr, HttpServletResponse res) throws IOException {
		int r = 0;
		int no = 0;
		
		for (String i : chArr) {
			no = Integer.parseInt(i);
			vo.setNo(no);
			r = artistService.delete(vo);

			res.setContentType("text/html;charset=utf-8");
			PrintWriter out = res.getWriter();
			if (r > 0) {
				out.print("true");
			} else {
				out.print("false");
			}
		}
		
	}
	
	@RequestMapping("/admin/artist/delete.do")
	public void artistDelete(Model model, AdminArtistVo vo, HttpServletResponse res) throws IOException {
		int r = artistService.delete(vo);
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		if (r > 0) {
			out.print("true");
		} else {
			out.print("false");
		}
	}
	
	@RequestMapping("/admin/song/deleteArr.do")
	public void songDelete(Model model, AdminSongVo vo, @RequestParam(value = "chkbox[]") List<String> chArr, HttpServletResponse res) throws IOException {
		int r = 0;
		int no = 0;
		
		for (String i : chArr) {
			no = Integer.parseInt(i);
			vo.setNo(no);
			r = songService.delete(vo);

			res.setContentType("text/html;charset=utf-8");
			PrintWriter out = res.getWriter();
			if (r > 0) {
				out.print("true");
			} else {
				out.print("false");
			}
		}
		
	}
	
	@RequestMapping("/admin/song/delete.do")
	public void songDelete(Model model, AdminSongVo vo, HttpServletResponse res) throws IOException {
		int r = songService.delete(vo);
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		if (r > 0) {
			out.print("true");
		} else {
			out.print("false");
		}
	}
	
	@RequestMapping("/admin/recommend/delete.do")
	public void recommendDelete(AdminRecommendVo vo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String chkArr = req.getParameter("chkArr");
		String[] list = chkArr.split(","); // ajax에서 traditional: true가 설정 되어 있지 않은 경우 배열로 담기지 않음
		int size = list.length;
		int[] li = new int[size];
		
		for (int i = 0; i < size; i++) {
			li[i] = Integer.parseInt(list[i]);
		}
		vo.setNos(li);
		
		int count = recommendService.delete(vo);
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		if (count > 0) {
			out.print(count);
		} else {
			out.print("failed");
		}
		
	}
	//-----------------------------------------------------------


}
