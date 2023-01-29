package com.ispan6.controller.chatsystem;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.bean.chatsystem.CustomerServiceMessage;
import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.bean.chatsystem.MessageContent;
import com.ispan6.bean.chatsystem.Participants;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.chatsystem.CustomerServiceMessageService;
import com.ispan6.service.chatsystem.GroupRoomService;
import com.ispan6.service.chatsystem.MessageService;
import com.ispan6.service.chatsystem.ParticipantsService;
import com.ispan6.service.membersystem.MemberTestService;

@Controller
public class ParticipantsController {

	@Autowired
	private ParticipantsService participantsService;

	@Autowired
	private GroupRoomService groupRoomService;

	@Autowired
	private MemberTestService mService;

	@Autowired
	private MessageService messageService;

	@Autowired
	private CustomerServiceMessageService customerServiceMessageService;

//	新增好友群組
	@PostMapping(path = "/participants/friendadd", produces = "application/json; charset=UTF-8")
	public void inserParticipants(@RequestParam(name = "userId") Integer userId,
			@RequestParam(name = "fuid") Integer fuid) {
		System.out.println("userId" + userId + "fuid" + fuid);
		GroupRoom gr = groupRoomService.insertGroupRoom(null, 0, null);
		Integer grId = gr.getGroupId();
		System.out.println("grId" + grId);
		participantsService.insertParticipants(grId, userId);
		participantsService.insertParticipants(grId, fuid);

	}

	// 成功 未完成 查群組 可能不需要
	@GetMapping(path = "/participants/select")
	@ResponseBody
	public List<GroupRoom> selectParticipants(@RequestParam Integer personId) {
		List<GroupRoom> gList = groupRoomService.userHaveGroupSelect(participantsService.selectParticipants(personId));

		return gList;
	}

	// 搜尋誰傳的訊息 自己是哪個群組 群組名
	@GetMapping(path = "/participants/select1", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public Map<String, Object> selectParticipantsTest(HttpSession session, Model m) {

		MemberTest member = (MemberTest) session.getAttribute("loginUser");

		if (member != null) {
			Integer personId = Integer.valueOf(member.getId());
			System.out.println("personId" + personId);
			List<Participants> pList = participantsService.selectParticipants(personId);
			HashSet<Integer> userId = new HashSet<Integer>();

			List<GroupRoom> gList = groupRoomService.userHaveGroupSelect(pList);
			for (int i = 0; i < gList.size(); i++) {
				GroupRoom g = gList.get(i);
				Set<Participants> pFile = g.getParticipants();
				for (Participants p : pFile) {
					userId.add(p.getPersonId());
					System.out.println("personId" + p.getPersonId());
				}

			}
			List<MemberTest> mList = mService.senderFile(userId);

			Map<String, Object> message = new HashMap<String, Object>();
			message.put("groomList", gList);
			message.put("memList", mList);
			message.put("userId", member.getId());

			return message;
		}
		return null;
	}

	// 已讀

	@PostMapping("/msg/ifRead")
	@ResponseBody
	public String readMessage(@RequestParam Integer groupId, HttpSession session) {
		List<MessageContent> mesList = messageService.readMessageFile(groupId);
		List<Participants> pList = participantsService.findGroupId(groupId);
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		Integer userId = member.getId();
		String user=String.valueOf(userId);
		Set<String> ifRead = new HashSet<String>();
		System.out.println("userId" + userId);
		for (MessageContent mes : mesList) {
			System.out.println("getIfRead" + mes.getIfRead());
			System.out.println("senderId" + mes.getSenderId());
			// 如果傳送訊息等於自己略過
			if (userId.equals(mes.getSenderId())) {
				System.out.println("userId=================" + userId);
				System.out.println("userId=================" + mes.getSenderId());
				continue;
			}
			// 如果訊息已讀為空加入ID
			if (mes.getIfRead() == null) {

//				ifRead.add(String.valueOf(userId));
				messageService.readMessage(String.valueOf(userId), groupId, userId);
				continue;
//				MessageService.readMessage()
			} else {
				if (userId.equals(mes.getSenderId())) {
					continue;
				}
				String ifReadStr = mes.getIfRead();
				String[] ifReadSplit = ifReadStr.split(",");

				// 如果群組人數等於已讀人數，就不走資料庫
				if (pList.size() - 1 > ifReadSplit.length) {

					for (int i = 0; i < ifReadSplit.length; i++) {
						
						ifRead.add(ifReadSplit[i]);

					}
					// 如果他沒有讀就加ID
					if (ifRead.contains(String.valueOf(userId)) == false) {
						ifRead.add(String.valueOf(userId));
						
						String[] array = ifRead.stream().toArray(String[]::new);
						String ifReadString = Arrays.toString(array);
						messageService.readMessage(ifReadString, groupId, userId);
						ifRead.clear();
						continue;
					}

				} else {
					continue;
				}

			}
		}
		return "addIfRead";
	}

	// 查member
	@GetMapping(path = "/memberTest/select")
	@ResponseBody
	public List<MemberTest> selectMember(@RequestParam Integer personId) {
		List<Participants> pList = participantsService.selectParticipants(personId);
		HashSet<Integer> userId = new HashSet<Integer>();

		List<GroupRoom> gList = groupRoomService.userHaveGroupSelect(pList);
		for (int i = 0; i < gList.size(); i++) {
			GroupRoom g = gList.get(i);
			Set<Participants> pFile = g.getParticipants();
			for (Participants p : pFile) {
				userId.add(p.getPersonId());
				System.out.println("personId" + p.getPersonId());
			}

		}
		List<MemberTest> mList = mService.senderFile(userId);

		return mList;
	}

	@GetMapping(path = "/groupRoom/selectMessage")
	@ResponseBody
	public List<GroupRoom> selectMessage() {
		ArrayList<Integer> al = new ArrayList<Integer>();
		al.add(2);
		List<GroupRoom> g = groupRoomService.selectGroupRoom(al);
		return g;
	}

	@GetMapping(path = "/member/selectMessage")
	@ResponseBody
	public List<MemberTest> memberMessage() {
		HashSet<Integer> id = new HashSet<Integer>();
		id.add(2);
		List<MemberTest> mList = mService.senderFile(id);

		return mList;
	}
	// 測試 查聊天室資料 可能不需要
//	@GetMapping(path = "/participants/select2")
//	@ResponseBody
//	public List<Participants> findGroupFile(@RequestParam Integer participantsId) {
//		return participantsService.findGroupFile(participantsId);
//	}

	// Message

	// 查某群組有什麼訊息
	@PostMapping(path = "/member/selectMessage")
	@ResponseBody
	public Map<String, Object> findeGroupMessage(@RequestParam Integer groupId) {
		HashSet<Integer> userId = new HashSet<Integer>();
		List<MessageContent> mesList = messageService.findeGroupMessage(groupId);
		for (int i = 0; i < mesList.size(); i++) {
			MessageContent g = mesList.get(i);
			userId.add(g.getSenderId());

			System.out.println("ppp" + g.getSenderId());

		}

		List<MemberTest> mList = mService.senderFile(userId);

		Map<String, Object> message = new HashMap<String, Object>();
		message.put("memList", mList);
		message.put("messageList", mesList);

		return message;

	}

	// 新增訊息
	@PostMapping(path = "/msg/add", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public MessageContent insertMessage(@RequestParam String text, @RequestParam Integer senderId,
			@RequestParam Integer groupId, Model m) {
		MessageContent msgText = messageService.insertMessage(text, senderId, groupId);
		System.out.println(msgText.getMessageId());
		return msgText;
	}

	// 收回訊息
	@PostMapping(path = "/msg/updateMessage", produces = "application/json; charset=UTF-8")
	public void backMessage(@RequestParam String text, @RequestParam Integer messageId) {
		System.out.println(text);
		System.out.println(messageId);
		messageService.backMessage(text, messageId);
	}

	@GetMapping("/msg/que")
	@ResponseBody
	public List<MessageContent> findWhoSender(@RequestParam Integer senderId) {
		return messageService.findWhoSender(senderId);
	}

	// 客服模糊搜尋
	@PostMapping(path = "/customerService/like", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public CustomerServiceMessage findLikeMessage(@RequestParam String text) {
		System.out.println(customerServiceMessageService.findLikeMessage(text));
		return customerServiceMessageService.findLikeMessage(text);
	}

}
