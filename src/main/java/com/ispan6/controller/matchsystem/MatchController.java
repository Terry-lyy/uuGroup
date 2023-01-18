package com.ispan6.controller.matchsystem;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.matchsystem.MatchBean;
import com.ispan6.bean.matchsystem.SelfHobbitBean;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.matchsystem.MatchService;
import com.ispan6.service.matchsystem.SelfHabbitService;
import com.ispan6.service.membersystem.MemberTestService;

@Controller
public class MatchController {

	@Autowired
	private MatchService matchService;

	@Autowired
	private SelfHabbitService  hService;
	
	
	@GetMapping("/getFriendNotice")
	public String getFriendNotice() {

		return "friendNotice";
	}

	@GetMapping("/addfriend")
	public String addFriendPage(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		matchService.getMatch(member.getId(),member.getId());
		return "addfriend";
	}
	
	@GetMapping("/getMatch")
	@ResponseBody
	public List<MemberTest> getMatch(HttpSession session,Model m) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		List<SelfHobbitBean> list = hService.findMatch();
		m.addAttribute("list",list);
		return matchService.getMatch(member.getId(),member.getId());
	}

	// 顯示好友清單
	@GetMapping("/friendlist")
	@ResponseBody
	public List<MatchBean> friendList(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");

		return matchService.findMyFriend(member.getId(), member.getId());

	}
	// 顯示封鎖清單
	@GetMapping("/blocklist")
	@ResponseBody
	public List<MatchBean> blockList(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");

		return matchService.findMyBlock(member.getId());

	}
	//隨機推薦
	@GetMapping("/newfriend")
	@ResponseBody
	public MemberTest newfriend(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		// 若無登入，隨機顯示帳號
		if (member == null) {
			return matchService.random1();
		}
		System.out.println(matchService.random1(member.getId(),member.getId()));
		// 顯示登入本人外的帳號
		return matchService.random1(member.getId(),member.getId());

	}
	//新增好友
	@GetMapping("/addNewFriend")
	@ResponseBody
	public String addNewFriend(@RequestParam Integer id, HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		if (member == null) {
			return "請先登入";
		}
		MemberTest fuid = matchService.findById(id);
		MatchBean match1 = matchService.findFriend(member.getId(), fuid.getId());
		MatchBean match2 = matchService.findFriend(fuid.getId(), member.getId());

		if (match1 == null && match2 == null) {
			MatchBean matchBean = new MatchBean();
			matchBean.setUserid(member);
			matchBean.setFuid(fuid);
			matchBean.setIsFriend(0);
			matchBean.setWhoblocked(0);
			matchService.addNewFriend(matchBean);
			return "送出邀請成功";
		}
		if (match1 != null) {
			return "您已送出邀請，等待對方回覆";
		}
		if (match2 != null) {
			return "對方已對您送出邀請，請回覆對方";
		}
		return "";
	}
	//我寄給誰
	@GetMapping("/sendinvitation")
	@ResponseBody
	public List<MatchBean> sendinvitation(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		return matchService.findMyInvitation(member.getId());
	}
	//誰寄給我
	@GetMapping("/whosendinvitation")
	@ResponseBody
	public List<MatchBean> whosendInvitation(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		return matchService.findWhoSendInvitation(member.getId());
	}
	//同意邀請
	@GetMapping("/agreeInvitation")
	@ResponseBody
	public List<MatchBean> agreeInvitation(@RequestParam Integer id, HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		int userid = member.getId();
		matchService.agreeInvitation(id, userid);
		return matchService.findWhoSendInvitation(userid);
	}
	//從好友清單封鎖別人
	@GetMapping("/blockmemberfromlist")
	@ResponseBody
	public List<MatchBean> blockMembers(@RequestParam Integer id, HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		matchService.blockfriend(member.getId(),id);
		return matchService.findMyFriend(member.getId(), member.getId());
	}
	
	
	//從好友清單刪除好友
		@GetMapping("/unfriendfromlist")
		@ResponseBody
		public List<MatchBean> unfriendfromlist(@RequestParam Integer id, HttpSession session) {
			MemberTest member = (MemberTest) session.getAttribute("loginUser");
			matchService.cancelfriend(id);
			return matchService.findMyFriend(member.getId(), member.getId());
		}
		//從我寄給誰取消邀請
		@GetMapping("/unfriendfromsend")
		@ResponseBody
		public List<MatchBean> unfriendfromsend(@RequestParam Integer id, HttpSession session) {
			MemberTest member = (MemberTest) session.getAttribute("loginUser");
			matchService.cancelfriend(id);
			return matchService.findMyInvitation(member.getId());
		}
		
		//從誰寄給我拒絕邀請
		@GetMapping("/unfriendfromwhosend")
		@ResponseBody
		public List<MatchBean> unfriendfromwhosend(@RequestParam Integer id, HttpSession session) {
			MemberTest member = (MemberTest) session.getAttribute("loginUser");
			matchService.cancelfriend(id);
			return matchService.findWhoSendInvitation(member.getId());
		}
		
		//從封鎖名單刪除
		@GetMapping("/unfriendfromblock")
		@ResponseBody
		public List<MatchBean> unfriendfromblock(@RequestParam Integer id, HttpSession session) {
			MemberTest member = (MemberTest) session.getAttribute("loginUser");
			matchService.cancelfriend(id);
			return matchService.findMyBlock(member.getId());
		}
		//解除封鎖
		@GetMapping("/cancelblock")
		@ResponseBody
		public List<MatchBean> cancelblock(@RequestParam Integer id, HttpSession session) {
			MemberTest member = (MemberTest) session.getAttribute("loginUser");
			matchService.cancelblock(id);
			return matchService.findMyBlock(member.getId());
		}
		
		//條件查詢
		@GetMapping("/findByHobbitAndGender")
		@ResponseBody
		public List<MemberTest> findByHobbitAndGender(@RequestParam Integer[] typeCondi, Integer[] labelCondi, HttpSession session) {
			MemberTest member = (MemberTest) session.getAttribute("loginUser");

			return hService.findByHobbitAndGender(typeCondi,labelCondi,member.getId());
		}
}
