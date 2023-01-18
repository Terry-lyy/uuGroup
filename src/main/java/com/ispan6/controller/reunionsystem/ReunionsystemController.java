package com.ispan6.controller.reunionsystem;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.bean.reunionsystem.Payment;
import com.ispan6.bean.reunionsystem.Register;
import com.ispan6.bean.reunionsystem.Reunion;
import com.ispan6.bean.reunionsystem.Reunionreport;
import com.ispan6.bean.reunionsystem.Reuniontype;
import com.ispan6.service.chatsystem.GroupRoomService;
import com.ispan6.service.chatsystem.ParticipantsService;
import com.ispan6.service.reunionsystem.PaymentService;
import com.ispan6.service.reunionsystem.ReunionregisterService;
import com.ispan6.service.reunionsystem.ReunionreportService;
import com.ispan6.service.reunionsystem.ReunionsystemService;
import com.ispan6.service.reunionsystem.ReuniontypeService;




@Controller
public class ReunionsystemController {
	
	@Autowired
	private ReunionsystemService reunionsystemService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private ReuniontypeService reuniontypeService;
	
	@Autowired
	private ReunionregisterService reunionregisterService;
	
	@Autowired
	private ReunionreportService reunionreportService;
	
	//易
	@Autowired
	private ParticipantsService participantsService;
	//易
	@Autowired
	private GroupRoomService groupRoomService;
	
	

	
	
	@GetMapping("/page")
	public String getReunion(HttpSession session) {
		//先將網頁全部重置
		List<Reunion> reunion = reunionsystemService.findAllReunion();
		List<Reuniontype> reuniontype = reuniontypeService.findAllType();
		List<Payment> payment = paymentService.findAllPayment();
		session.setAttribute("reunion", reunion);
		session.setAttribute("reuniontype", reuniontype);
		session.setAttribute("payment", payment);
		return "reunion";
	}
	
	
	@PostMapping("/dateRange")
	public String searchByPaymentId(String start,String end, Model model) {
		System.out.println(start);
		System.out.println(end);
		System.out.println(end.compareTo(start));
		List<Reunion> reunion = reunionsystemService.findDateRange(start, end);
		model.addAttribute("reunion",reunion);
		if(end.compareTo(start)<=1) {
			model.addAttribute("compara",0);
		}
		return "reunion";
	}
	
	@PostMapping("/blurrysearchReunion")
	public String searchByPaymentId(String keywords, Model model) {
		System.out.println(keywords);
		String keywords2="%"+keywords+"%";
		List<Reunion> reunion = reunionsystemService.blurrysearchReunion(keywords2);
		model.addAttribute("reunion", reunion);
		return "reunion";
	}
	
	
	
	@GetMapping("/searchByPaymentId")
	public String searchByPaymentId(@RequestParam Integer id, Model model) {
		List<Reunion> reunion = reunionsystemService.findByPaymentId(id);
		model.addAttribute("reunion", reunion);
		return "reunion";
	}


	@GetMapping("/searchByReuniontypeId")
	public String searchByReuniontypelId(@RequestParam Integer id, Model model) {
		List<Reunion> reunion = reunionsystemService.findByReuniontypelId(id);
		model.addAttribute("reunion", reunion);
		return "reunion";
	}
	
	
	@GetMapping("/insertreunion")
	public String insertreunion(Model model) {
		
		
		return "addreunion";
	}
	
	
	
	@GetMapping("/msg/detailedparty")
	public String detailedparty(Model model) {
		
		
		return "detailedparty";
	}
	//新增聚會
	@PostMapping("/insertReunion")
	public String insertReunion(Reunion reunion,HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		int memberid = member.getId();
		String content = reunion.getContent();
		String content1 = content.replaceAll("<br>", "\r\n");
		reunion.setContent(content1);
		reunion.setMemberid(memberid);
		reunion.setNumber(0);
		//易改回傳Reunion
		Reunion r=reunionsystemService.insertReunion(reunion);
		
		//易
		GroupRoom gr = groupRoomService.insertReunionGroupRoom(r.getTopic(), 1,r.getPicture() ,r.getReunionid());
		Integer grId = gr.getGroupId();
		participantsService.insertParticipants(grId,memberid );
		return "redirect:/page";
	}
	
	
	@GetMapping("/deleteReunion")
	public String deleteReunion(@RequestParam Integer id) {
		
		boolean flag =reunionregisterService.registerEmpty2(id);
		if(flag==false) {
		reunionregisterService.deleteregisterById(id);
		}
		System.out.println(flag);
		boolean flag1 =reunionreportService.reportEmpty2(id);
		System.out.println(flag1);
		if(flag1==false) {
		reunionreportService.deleteReunionreport(id);
		}
		reunionsystemService.deleteReunionByReunionId(id);
		return "redirect:/myreunion";
	}
	
	//新增報名


	@GetMapping("/insertRegister")	
	public String insertRegister(@RequestParam Integer id,HttpSession session) {				
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		int memberid = member.getId();
		
		boolean flag = reunionregisterService.registerEmpty(id, memberid);
		if(flag==true) {
		Register register = new Register();
		register.setMemberid(memberid);
		register.setReunionid(id);
		register.setReview(0);
		reunionregisterService.insertRegister(register);
		
		}
	
		return "redirect:/detailedreunion?id="+id;
	}
	//聚會報名審核
	@GetMapping("/searchRegisterByReunionId")
	public String searchRegisterByReunionId(@RequestParam Integer id, Model model) {
		List<Register> register = reunionregisterService.findRegisterByReunionid(id);
		model.addAttribute("register", register);
		Integer count = reunionregisterService.findCountRegisterByReunionid(id);
	    Reunion reunion = reunionsystemService.findByReunionId(id);
	    model.addAttribute("count", count);
	    model.addAttribute("reunion", reunion);
		System.out.println(register);
		return "reviewreunion";
	}

	//同意報名
	    @GetMapping("/agreeRegister")
		public String agreeRegisterByReunionidAndMemberid(@RequestParam Integer id,Integer memberid, Model model) {
	    	 Integer count = reunionregisterService.findCountRegisterByReunionid(id);
	    	Reunion reunion = reunionsystemService.findByReunionId(id);
	    	System.out.println(reunion.getPeople());
	    	System.out.println(count);
	    	System.out.println(id);
	    	System.out.println(memberid);
	    	
	    	
	    	model.addAttribute("id", id);
	    	 if(reunion.getPeople()>count) {
			reunionregisterService.agreeRegisterByReunionidAndMemberid(id, memberid);
	    	 }
	    	 //易
	    	 GroupRoom gr = groupRoomService.reunionIdHaveGroup(id);
	    	 if(gr !=null) {
	    	  	 Integer grId = gr.getGroupId();
	 	 		participantsService.insertParticipants(grId,memberid );
	 	    	  
	    	 }
	  
	 		return "redirect:/searchRegisterByReunionId?id="+id;
		}
	    
	  //不同意報名
	    @GetMapping("/notagreeRegister")
		public String notagreeRegisterByReunionidAndMemberid(@RequestParam Integer id,Integer memberid, Model model) {
			reunionregisterService.notagreeRegisterByReunionidAndMemberid(id, memberid);			
			model.addAttribute("id", id);
			System.out.println(id);
			return "redirect:/searchRegisterByReunionId?id="+id;
		}
	
	
//	@GetMapping("/insertRegister")
//		public String insertRegister(@RequestParam Integer id,HttpSession session) {				
//		MemberTest member = (MemberTest) session.getAttribute("loginUser");
//		int memberid = member.getId();
//		
//		boolean flag = reunionregisterService.registerEmpty(id, memberid);
//		
//		Register register = new Register();
//		register.setMemberid(memberid);
//		register.setReunionid(id);
//		reunionregisterService.insertRegister(register);
//	  return "redirect:/detailedreunion";
//	}
	
	
	
	
	
	//新增檢舉
//	@GetMapping("/insertReunionreport")
//	public String insertReunionreport(@RequestParam Integer id,HttpSession session) {
//		MemberTest member = (MemberTest) session.getAttribute("loginUser");
//		int memberid = member.getId();
//		Reunionreport reunionreport = new Reunionreport();
//		reunionreport.setMemberid(memberid);
//		reunionreport.setReunionid(id);
//		reunionreportService.insertReunionreport(reunionreport);
//		return "reunion";
//	}
	//新增檢舉
	@PostMapping("/insertReunionreport")
	public String insertReunionreport(Reunionreport reunionreport ,HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		int memberid = member.getId();
		reunionreport.setMemberid(memberid);
		reunionreportService.insertReunionreport(reunionreport);
		Integer id = reunionreport.getReunionid();
		return "redirect:/detailedreunion?id="+id;
	}
	

//	@PostMapping("/insertRegister")
//	public String insertRegister(Register register) {
//		reunionsystemService.insertReunion(reunion);
//		return "redirect:/msg/page";
//	}
//	

	
	
	@GetMapping("/test")
	public String test(Model model) {
		
		
		return "NewFile";
	}
	
	
	
	@GetMapping("/test2")
	public String test2(Model model) {
		return "detailedreunion";
	}
	
	@GetMapping("/myreunion")	
	public String myreunion(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		if(member != null) {
			System.out.println(member);
			List<Reunion> reunion=reunionsystemService.findAllByMemberId(member.getId());
			List<Register> register = reunionregisterService.findRegisterByMemberid(member.getId());
			List<Reunionreport> reunionreport = reunionreportService.findReunionreportByMemberid(member.getId());
			session.setAttribute("reunion", reunion);
			session.setAttribute("register", register);
			session.setAttribute("reunionreport", reunionreport);
		}
		
		
		return "myreunion2";
	}
	
	@GetMapping("/detailedreunion")
	public String detailedreunion(@RequestParam Integer id, Model model,HttpSession session) {
		
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		if(member!=null) {
		int memberid = member.getId();
		boolean flag1 = reunionreportService.reportEmpty(id, memberid);
		boolean flag = reunionregisterService.registerEmpty(id, memberid);
		model.addAttribute("flag1",flag1);
		model.addAttribute("flag",flag);
		}
		reunionsystemService.addReunionnumber(id);
		Reunion reunion = reunionsystemService.findByReunionId(id);
		String content = reunion.getContent();
		String content1 = content.replaceAll("<br>", "\r\n");
		reunion.setContent(content1);
		
		Integer registercount = reunionregisterService.findCountRegisterByReunionid(id);
		model.addAttribute("reunion", reunion);
		model.addAttribute("registercount", registercount);
		
		Integer count = reunionregisterService.findCountRegisterByReunionid(id);
	    //Reunion reunion = reunionsystemService.findByReunionId(id);
	    model.addAttribute("count", count);
	   // model.addAttribute("reunion", reunion);
		
		return "detailedreunion";
	}
	
	
	
	@ResponseBody
	@GetMapping("/TestM")
	public MemberTest insert2(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");

		return member;
	}
	
	
	
	
	
//	@ResponseBody
//	@PostMapping("/msg/insert2")
//	public WorkMessages insert2(@RequestBody WorkMessages msg) {
//		return repo.save(msg);
//	}
//	
//	@ResponseBody
//	@PostMapping("/msg/insert3")
//	public List<WorkMessages> insert3(@RequestBody List<WorkMessages> msgList){
//		return repo.saveAll(msgList);
//	}
//	
//	@ResponseBody
//	@PostMapping("/msg/All")
//	public List<WorkMessages> getAll(){
//		return repo.findAll();
//	}
//	
//	@ResponseBody
//	@GetMapping("/msg/{id}")
//	public WorkMessages findById(@PathVariable Integer id) {
//		Optional<WorkMessages> optional = repo.findById(id);
//		
//		if(optional.isPresent()) {
//			WorkMessages returnData = optional.get();
//			return returnData;
//		}
//		
//		WorkMessages errorMsg = new WorkMessages();
//		errorMsg.setText("沒有這筆資料");
//		
//		return errorMsg;
//		
//	}
//	
//	@ResponseBody
//	@GetMapping("/msg/page")
//	public List<WorkMessages> findByPage(@RequestParam(name = "p", required = false,defaultValue = "1") Integer pageNumber){
//		Pageable pgb = PageRequest.of(pageNumber-1, 3,Direction.DESC,"id");
//		Page<WorkMessages> page = repo.findAll(pgb);
//		return page.getContent();
//	}
//	
//
//	
//	@ResponseBody
//	@GetMapping("/msg/text")
//	public List<WorkMessages> findMsgByText(@RequestParam(name = "t") String text){
//		
//		return repo.findMsgByText2(text);
//	}
//	
//	@ResponseBody
//	@GetMapping("/msg/native/text")
//	public List<WorkMessages> findMsgByTextNativeQuery(@RequestParam(name = "t") String text){
//		
//		return repo.findMsgByTextNative(text);
//	}
//	
//	
//	@ResponseBody
//	@GetMapping("/msg/like/text")
//	public List<WorkMessages> findMsgLikeText(@RequestParam(name = "t") String text){
//		
////		return repo.findMsgLikeText(text);
//		return repo.findMsgLikeText2(text);
//	}
//	
//	@ResponseBody
//	@GetMapping("/msg/delete/{id}")
//	public String deleteTest(@PathVariable("id") Integer id) {
//		repo.deleteMsgById(id);
//		return "刪除OK";
//	}
//	
//	@ResponseBody
//	@GetMapping("/msg/jpql")
//	public List<WorkMessages> testJPQL(@RequestParam String text){
////		return repo.findByTextOrderByAdded(text);
//		return repo.findByTextContainingOrderByAdded(text); // 模糊搜尋
//	}

}