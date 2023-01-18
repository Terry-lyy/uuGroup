 package com.ispan6.controller.postsystem;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.bean.postsystem.CommentBean;
import com.ispan6.bean.postsystem.PostBean;
import com.ispan6.dao.postsystem.CommentDAO;
import com.ispan6.service.postsystem.CommentService;
import com.ispan6.service.postsystem.PostService;


@Controller
public class CommentController {
	

	@Autowired
	private SessionFactory sessionFactory;
    
	@Autowired
	private CommentDAO CommentDao;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private PostService postService;
	
	
	//新增留言
	 @PostMapping("/addComment")
	    public String addComment(@RequestParam("comment") String comment,@RequestParam("postId") Integer postId,@ModelAttribute CommentBean commentBean,HttpSession session) {
		// 取得當前登入的會員	
		 MemberTest member = (MemberTest) session.getAttribute("loginUser");
		 commentBean.setMemberId(member);
		 
		 // 取得留言所對應的貼文
		 PostBean post = postService.findBypostid(postId);

		 
		// 建立新的留言物件
		 CommentBean newComment = new CommentBean();
		 //哪個會員留言
		 newComment.setMemberId(member);
		 //留在哪個貼文下面
		 newComment.setPost(post);
		 //留言的內容
		 newComment.setComments(comment);
		 // 新增留言到資料庫
		 commentService.addComment(newComment);
		 
	        return "redirect:/index";
	    }

	    @GetMapping("/deleteComment")
	    @ResponseBody
	    public String deleteComment(@RequestParam Integer id, HttpSession session) {
	     commentService.deleteCommentById(id);
	      return "刪除成功";
	    }
	    
	    //看留言
	    @PostMapping("/viewComments")
		public String  viewComments(@ModelAttribute CommentBean commentBean, Model model,HttpSession session){
			MemberTest member = (MemberTest) session.getAttribute("loginUser");
			commentBean.setMemberId(member);
			
			commentService.insertOrUpdate(commentBean);
			List<CommentBean> comments = commentService.getAllComments();
		    model.addAttribute("comments", comments);
			return "index";
			}
	    


	
	
//	@GetMapping("/add")
//	public String insert(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,@ModelAttribute("postBean")PostBean postBean,Model model,HttpSession session) {
//	MemberTest member = (MemberTest) session.getAttribute("loginUser");
//		
//		PostBean p1 = new PostBean();
//		
//		model.addAttribute("postBean", p1);
//		
//		List<PostBean> latestPosts = postService.getLatest();
//		
//		model.addAttribute("latestPosts", latestPosts);
//		
//		Page<PostBean> page= postService.findByPostPage(pageNumber);
//		model.addAttribute("page", page);
//		
//		return "redirect:/index";
//	}
//	
//	@GetMapping("/intopost")
//	public String postPageList(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
//		Page<PostBean> page= postService.findByPostPage(pageNumber);
//		model.addAttribute("page", page);
//		return "index";
//		
//	}
//	
////	@GetMapping("/intopost")
////	public String intoPost(@ModelAttribute PostBean postBean,Model model) {
////		List<PostBean> latestPosts = postService.getLatest();
////		model.addAttribute("latestPosts", latestPosts);
////		
////		return "postpage";
////	}
//	
//	@GetMapping("/edit/{id}")
//	public String updatePost(@PathVariable Integer id,Model model){
//		PostBean postBean = postService.findBypostid(id);
//		model.addAttribute("postBean",postBean);
//		return "editpostpage";
//	}
//	
//	@PostMapping("/editpost")
//	public String  postUpdate(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,@ModelAttribute PostBean postBean,Model model,HttpSession session) {
//		MemberTest member = (MemberTest) session.getAttribute("loginUser");
//		postBean.setMemberId(member); //mTest
//		postService.insertOrUpdate(postBean);
//		
//		postService.insertOrUpdate(postBean);
//		Page<PostBean> page= postService.findByPostPage(pageNumber);
//		model.addAttribute("page", page);
//		return "redirect:/add";
//		
//	}
//	
//	@GetMapping("/deletepost")
//	public String deletePost(@RequestParam Integer postid) {
//		postService.deletePost(postid);
//		return "redirect:/add";
//	}
	
//	@PostMapping("/post")
//	public String  insertPost(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,@ModelAttribute PostBean postBean, @RequestParam MultipartFile fFile,Model model,HttpSession session) throws IOException {
//		MemberTest member = (MemberTest) session.getAttribute("loginUser");
//		postBean.setMemberId(member); //mTest
		
		
		
//		try (InputStream in = picture.getInputStream();
//				ByteArrayOutputStream out = new ByteArrayOutputStream()) {
//				IOUtils.copy(in, out);
//				postBean.setPicture(out.toByteArray()); // 將 picture 轉換為位元組陣列並設置到 postBean 中setPicture(out.toByteArray());
//				} catch (IOException e) {
//				// 錯誤處理
//				}
		   
//		List<PostBean> latestPosts = postService.findLatest();
//		
//		model.addAttribute("latestPosts", latestPosts);
//		Integer id=member.getId();
//		MemberTest mTest=new MemberTest();
//		mTest.setId(id);

		
		
//		postService.insertOrUpdate(postBean);
//		
//		Page<PostBean> page= postService.findByPostPage(pageNumber);
//		model.addAttribute("page", page);
//
//		return "redirect:/add";
//	}
//	
	
	
//	@PostMapping("/post")
//	public ResponseEntity<Map<String, Object>> insertPost(@RequestParam String content, @RequestParam MultipartFile picture, HttpSession session, HttpServletRequest request) {
//	    // 檢查用戶是否已登錄
//	    MemberTest member = (MemberTest) session.getAttribute("loginUser");
//	    if (member == null) {
//	        // 用戶未登錄，返回401錯誤
//	        return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
//	    }
//
//	    // 建立貼文資料物件
//	    PostBean post = new PostBean();
//	    post.setContent(content);
//	    post.setMemberId(member);
//
//	    // 將圖片文件轉換為字節數組
//	    try {
//	        byte[] imageData = picture.getBytes();
//	        post.setPicture(imageData);
//	    } catch (IOException e) {
//	        e.printStackTrace();
//	        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	    }
//
//	    // 使用Session對象將貼文資料保存到資料庫中
//	    postDao.save(post);
//
//	    // 生成貼文的HTML字串
//	    String html = "<div class='post'>" +
//	    		"<div class='post-header'>" +
//	    		"<img src='data:image/jpeg;base64," + Base64.getEncoder().encodeToString(post.getPicture()) + "' alt='贴文图片'>" +
//	    		"</div>" +
//	    		"<div class='post-content'>" +
//	    		post.getContent() +
//	    		"</div>" +
//	    		"</div>";
//	    
//	    request.setAttribute("postHtml",html);
//
//	    // 將貼文的HTML字串傳回給客戶端
//	    Map<String, Object> result = new HashMap<>();
//	    result.put("html",html);
//	    return new ResponseEntity<>(result, HttpStatus.OK);
//	}
//
//	
//		
//		private void savePost(PostBean post) throws IllegalStateException, SystemException {org.hibernate.Session session = null;
//		Transaction transaction = null;
//		try {
//			session = sessionFactory.getCurrentSession();
//			transaction = (Transaction) session.beginTransaction();
//			session.save(post);
//			transaction.commit();
//		} catch (Exception e) {
//			e.printStackTrace();
//		if (transaction != null) {
//			transaction.rollback();
//		}
//	} finally {
//		if (session != null && session.isOpen()) {
//			session.close();
//			}
//		}
//	}
//	
//	
//	
//	@PostMapping("/PostImg")
//	public void postImg(@RequestParam String fName, @RequestParam MultipartFile fFile) {
//		// 若C槽下沒有temp資料夾，則建立一個。
//		File folder = new File("C:\\temp");
//		if (!folder.exists()) {
//			folder.mkdir();
//		}
//
//		try {
//			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream("c:\\temp\\" + fName));
//			bos.write(fFile.getBytes());
//			bos.close();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	}
//
//	
//	@ResponseBody
//	@PostMapping("/api/post")
//	public Page<PostBean>postMsgApi(@RequestBody PostDto dto) {
//		String userInputText = dto.getText();
//		PostBean newMsg = new PostBean();
//		
//		newMsg.setPosttime(new Date());
//		postService.insertOrUpdate(newMsg);
//		
//		newMsg.setContent(userInputText);
//		
//		postService.insertOrUpdate(newMsg);
//		
//		Page<PostBean>page=postService.findByPostPage(1);
//		return page;
//		
//	}
//	
//	
//	

	
//	//從程式裡新增
//	@ResponseBody
//	@GetMapping("/insertPost2")
//	public PostBean insert2() {
//		PostBean p1 = new PostBean();
//		p1.setContent("第二次測試貼文內容");
//		PostBean res = postDao.save(p1);
//		return res;
//	}
	
	//從外面丟進來新增
//	@ResponseBody
//	@PostMapping("/insertPost3")
//	public PostBean insert3(@RequestBody PostBean postBean) {
//		return postDao.save(postBean);
//	}
//	
//	//新增多個
//	@ResponseBody
//	@PostMapping("/insertPost4")
//	public List<PostBean> insert4(@RequestBody List<PostBean> postBeanList) {
//		return postDao.saveAll(postBeanList);
//	}
//	
//	@ResponseBody
//	@PostMapping("/All")
//	public List<PostBean> getAll(){
//		return postDao.findAll();
//	}
//	
//	@ResponseBody
//	@GetMapping("/findId/{id}")
//	public PostBean findById(@PathVariable Integer id){
//		Optional<PostBean> optional = postDao.findById(id);
//		
//		if(optional.isPresent()) {
//			PostBean returnData = optional.get();
//			return returnData;
//		}
//		
//		PostBean errorMsg = new PostBean();
//		errorMsg.setContent("沒有此筆資料");
//		
//		return errorMsg;
//		
//	}
//	 
////	@ResponseBody
////	@GetMapping("/find/P/{pageNumber}")
////	public List<PostBean> findByPage(@PathVariable Integer pageNumber){
////		Pageable pgb = PageRequest.of(pageNumber-1, 3,Direction.DESC,"posttime");
////		Page<PostBean> page=postDao.findAll(pgb);
////		return page.getContent();
////		
////	}
//	
//	
////	可送多個參數@RequestParam(name = "p"....
////	若加載失敗預設值會跑第1頁 defaultValue = "1"
////	若加載失敗不會報錯required = false
//	@ResponseBody
//	@GetMapping("/find/page")
//	public List<PostBean> findByPage(@RequestParam(name = "p" ,required = false,defaultValue = "1") Integer pageNumber){
//		Pageable pgb = PageRequest.of(pageNumber-1, 3,Direction.DESC,"posttime");
//		Page<PostBean> page=postDao.findAll(pgb);
//		return page.getContent();
//		
//	}
//	
//	@ResponseBody
//	@GetMapping("/find/content")
//	public List<PostBean> findpostBycontent(@RequestParam(name = "c") String content){
//		return postDao.findpostBycontent(content);
//	}
//	
//	
//	@ResponseBody
//	@GetMapping("/find/like/content")
//	public List<PostBean> findpostLikecontent(@RequestParam(name = "c") String content){
//		return postDao.findpostLikecontent(content);
//		
//	}
//	
//	@ResponseBody
//	@GetMapping("/delete/{postid}")
//	public String deletepostBypostid(@PathVariable("postid") Integer postid) {
//		postDao.deletepostBypostid(postid);
//		return "刪除OK";
//	}
//	 @PostMapping("/{postId}/replies")
//    public String createReply(@PathVariable Long postId, @ModelAttribute Reply reply, RedirectAttributes attrs) {
//        reply.setPostId(postId);
//        replyService.create(reply);
//        attrs.addFlashAttribute("message", "新增貼文回復成功");
//        return "redirect:/posts/" + postId;
//    }
//
//    @DeleteMapping("/{postId}/replies/{replyId}")
//    public String deleteReply(@PathVariable Long postId, @PathVariable Long replyId, RedirectAttributes attrs) {
//        replyService.delete(replyId);
//        attrs.addFlashAttribute("message", "刪除貼文回復成功");
//        return "redirect:/posts/" + postId;
//    }
//
//
// @GetMapping
//    public String index(Model model) {
//        List<Post> posts = postsService.findAll();
//        model.addAttribute("posts", posts);
//        return "posts/post-list";
//    }
//
//    @GetMapping("/new")
//    public String newPost(Model model) {
//        model.addAttribute("post", new Post());
//        return "posts/post-new";
//    }
//
//    @GetMapping("/{id}")
//    public String show(@PathVariable Long id, Model model) {
//        Post post = postsService.findById(id);
//        List<Reply> replies = replyService.findByPostId(id);
//        model.addAttribute("post", post);
//        model.addAttribute("replies", replies);
//        return "posts/post-detail";
//    }
//
//  
//
//    @PostMapping
//    public String create(@ModelAttribute Post post, RedirectAttributes attrs) {
//        postsService.create(post);
//        attrs.addFlashAttribute("message", "新增貼文成功");
//        return "redirect:/posts";
//    }
//
//    @PutMapping("/{id}")
//    public String update(@PathVariable Long id, @ModelAttribute Post post, RedirectAttributes attrs) {
//        post.setId(id);
//        postsService.update(post);
//        attrs.addFlashAttribute("message", "更新貼文成功");
//        return "redirect:/posts";
//    }
//
//    @DeleteMapping("/{id}")
//    public String delete(@PathVariable Long id, RedirectAttributes attrs) {
//        postsService.delete(id);
//        attrs.addFlashAttribute("message", "刪除貼文成功");
//        return "redirect:/posts";
//
//
//    }
//	

}
