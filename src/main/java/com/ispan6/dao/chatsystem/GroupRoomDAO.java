package com.ispan6.dao.chatsystem;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.ispan6.bean.chatsystem.GroupRoom;

public interface GroupRoomDAO extends JpaRepository<GroupRoom, Integer> {
	//聊天室名稱
	@Query("from GroupRoom where groupId = ?1")
	public List<GroupRoom> findGroupName(Integer groupId);
	
	@Query(value="select * from grouproom where groupId in (?1)",nativeQuery = true)
	public List<GroupRoom> userHaveGroupSelect(ArrayList<Integer> id);
	
	//根據ReunionId查群組
	@Query(value="select * from grouproom where reunionId =?1",nativeQuery = true)
	public GroupRoom reunionIdHaveGroup(Integer reunionId);
}
