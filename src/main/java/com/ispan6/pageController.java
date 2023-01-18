package com.ispan6;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.bean.postsystem.PostBean;
import com.ispan6.service.matchsystem.MatchService;
import com.ispan6.service.postsystem.PostService;
@Controller
public class pageController {
	@Autowired
	private MatchService matchService;
	

	@Autowired
	private PostService postService;

	
	@GetMapping("/login")
	public String getLogin(Model m) {
		return "login";
	}
	
	@GetMapping("/index")
	public String backHome(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model m) {
		MemberTest random = matchService.random1();
		m.addAttribute("random", random);
		Page<PostBean> page= postService.findByPostPage(pageNumber);
		m.addAttribute("page", page);
		return "index";
	}
	
	@GetMapping("/")
	public String homePage(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model m) {
		MemberTest random = matchService.random1();
		m.addAttribute("random", random);
		Page<PostBean> page= postService.findByPostPage(pageNumber);
		m.addAttribute("page", page);
		return "party";
	}

	@GetMapping("/productbackend")
	public String backend() {
		return "productbackend2";
	}
	
	@GetMapping("/signup")
	public String goSignUp() {
		return "signup3";
	}
	
	@RequestMapping("/googlelogin")
	public String googlelogin() {
		return "redirect:https://accounts.google.com/o/oauth2/auth?scope=email+profile&redirect_uri=http://localhost:8080/LoginGoogleHandler&response_type=code&client_id=378093448501-ebvinmo23u9l8lmljs9souqd3953nbqg.apps.googleusercontent.com&approval_prompt=force";
	}
	
	@RequestMapping("/signup4")
	public String googlesignup() {
		return "signup4";
	}
	

	@RequestMapping("/bannedpage")
	public String bannedPage() {
		return "bannedpage";
	}
	
	@RequestMapping("/party")
	public String partyIndex(){
		return "party";
	}

}
