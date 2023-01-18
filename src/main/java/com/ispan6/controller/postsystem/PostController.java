package com.ispan6.controller.postsystem;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.jdbc.core.ParameterDisposer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.bean.postsystem.CommentBean;
import com.ispan6.bean.postsystem.PostBean;
import com.ispan6.dao.postsystem.LikepostDAO;
import com.ispan6.dao.postsystem.PostDAO;
import com.ispan6.service.postsystem.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;
	
	@Autowired
	private PostDAO postDao;
	
	@Autowired
	private LikepostDAO likepostDAO;
	
//	@ResponseBody
//	@GetMapping("/delete/{postid}")
//	public String deletepostBypostid(@PathVariable("postid") Integer postid) {
//		postDao.deletepostBypostid(postid);
//		return "刪除OK";
//	}

	// 跳轉首頁
	@GetMapping("/add")
	public String insert(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			@ModelAttribute("postBean") PostBean postBean, Model model, HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");

		PostBean p1 = new PostBean();

		model.addAttribute("postBean", p1);

		List<PostBean> latestPosts = postService.getLatest();

		model.addAttribute("latestPosts", latestPosts);

		Page<PostBean> page = postService.findByPostPage(pageNumber);

		model.addAttribute("page", page);

		return "redirect:/index";
	}

	// 獲取首頁的所有貼文
	@GetMapping("/intopost")
	public String postPageList(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Page<PostBean> page = postService.findByPostPage(pageNumber);
		model.addAttribute("page", page);
		return "index";

	}
	
	
	@PostMapping("/editpost")
	public String postUpdate(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, @ModelAttribute PostBean postBean,
	        Model model, HttpSession session, @RequestParam("photo") MultipartFile photo) throws IOException {
	    MemberTest member = (MemberTest) session.getAttribute("loginUser");
	    postBean.setMemberId(member);
	    // Check if the user has selected a new image
	    if (!photo.isEmpty()) {
	        // Update the image in the database
	        postBean.setPicture(photo.getBytes());
	    }
	    postService.insertOrUpdate(postBean);
	    PostBean page = postService.findBypostid(pageNumber);
	    model.addAttribute("page", page);
	    return "redirect:/add";
	}

	

	// 修改貼文
//	@PostMapping("/editpost")
//	public String postUpdate(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, @ModelAttribute PostBean postBean,
//			Model model, HttpSession session) throws IOException {
//		MemberTest member = (MemberTest) session.getAttribute("loginUser");
//		postBean.setMemberId(member);
//
//		postService.insertOrUpdate(postBean);
////		Page<PostBean> page = postService.findByPostPage(pageNumber);
//		
//		PostBean page = postService.findBypostid(pageNumber);
//		model.addAttribute("page", page);
//		return "redirect:/add";
//
//	}

	// 編輯貼文
	@GetMapping("/edit/{id}")
	public String updatePost(@PathVariable Integer id, Model model) {
		PostBean postBean = postService.findBypostid(id);
		byte[] oldPicture = postBean.getPicture();
		model.addAttribute("oldPicture", oldPicture);
		model.addAttribute("postBean", postBean);
		return "editpostpage";
	}

	@GetMapping("/deletepost")
	public String deletePost(@RequestParam Integer postid) {
		postService.deletePost(postid);
		return "redirect:/add";
	}

	@PostMapping("/uploadPicture")
	public String uploadPicture(@RequestParam("picture") MultipartFile picture) throws IOException {
		// 圖片文件保存到本地c:\\temp\\中
		picture.transferTo(new File("c:\\temp\\" + picture.getOriginalFilename()));
		// 返回圖片的路径
		return "c:\\temp\\" + picture.getOriginalFilename();
	}

	// 新增貼文
	@PostMapping("/post")
	public String insertPost(@RequestParam("photo") MultipartFile photo, @ModelAttribute PostBean postBean, Model model,
			HttpSession session) throws IOException {

		MemberTest member = (MemberTest) session.getAttribute("loginUser");

		postBean.setMemberId(member); // mTest
		postBean.setPicture(photo.getBytes());

		ArrayList<PostBean> pList = new ArrayList<PostBean>();
		pList.add(postBean);
		member.setPostList(pList);
		postService.insertOrUpdate(postBean);

		return "redirect:/add";
	}

	@GetMapping(value = "/showPicture", produces = "image/jpeg")
	@ResponseBody
	public byte[] showPicture(Integer postId) throws IOException {
		byte[] bytes = postService.getPicture(postId);
		return bytes;
	}
	
	@PostMapping("/plusLike")
	@ResponseBody
	public Map<String, Object> plusLike(@RequestParam("postId") Integer postId) {
	Map<String, Object> response = new HashMap<>();
	response.put("count", postService.plusLike(postId));
	return response;
	}

	@GetMapping(value = "/testComment")
	@ResponseBody
	public List<CommentBean> testComment() {
		return postService.findAllPosts().get(0).getCommentList();
	}
}
