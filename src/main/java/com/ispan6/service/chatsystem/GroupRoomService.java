package com.ispan6.service.chatsystem;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.bean.chatsystem.Participants;
import com.ispan6.dao.chatsystem.GroupRoomDAO;

@Transactional
@Service
public class GroupRoomService {
	@Autowired
	private GroupRoomDAO groupRoomDAO;
	
	public void insertOrUpdate(GroupRoom groupRoom) {
		groupRoomDAO.save(groupRoom);
	}
//	新增聊天室
	public GroupRoom insertGroupRoom(String groupName,Integer groupType,String photo) {
		GroupRoom groupRoom = new GroupRoom();
		groupRoom.setGroupName(groupName);
		groupRoom.setGroupType(groupType);
		groupRoom.setGroupPhoto(photo);
		return groupRoomDAO.save(groupRoom);
	}
	//新增聚會聊天室
	public GroupRoom insertReunionGroupRoom(String groupName,Integer groupType,String photo,Integer reunionId) {
		GroupRoom groupRoom = new GroupRoom();
		groupRoom.setGroupName(groupName);
		groupRoom.setGroupType(groupType);
		groupRoom.setGroupPhoto(photo);
		groupRoom.setReunionId(reunionId);
		return groupRoomDAO.save(groupRoom);
	}
	//查群組
	public List<GroupRoom> userHaveGroupSelect(List<Participants> pList) {
		ArrayList<Integer> id=new ArrayList<Integer>();
		if (pList.isEmpty()) {
			return null;
		}else {
			for(int i=0;i<pList.size();i++) {
				Participants p = pList.get(i);
				id.add(p.getGroupId());
				
			}
			List<GroupRoom> gList=groupRoomDAO.userHaveGroupSelect(id);
			for(int i=0;i<id.size();i++) {
				System.out.println(id.get(i));
			}
			
			return gList;
		}
	}
	
	
	//查聊天室所有東西
	public List<GroupRoom> selectGroupRoom(ArrayList<Integer> groupId){
		return groupRoomDAO.userHaveGroupSelect(groupId);
	}
	//根據ReunionId查群組
	public GroupRoom reunionIdHaveGroup(Integer reunionId) {
		return groupRoomDAO.reunionIdHaveGroup(reunionId);
	}
}
