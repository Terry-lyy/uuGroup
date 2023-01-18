package com.ispan6.dao.reunionsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.reunionsystem.Register;
import com.ispan6.bean.reunionsystem.Reunion;

public interface ReunionregisterReposity extends JpaRepository<Register,Integer>,CrudRepository<Register, Integer>{

	@Query(value = "select * from register where reunionid = ?1 and memberid =?2",nativeQuery = true)
	List<Register> findRegisterByReunionidAndMemberid(Integer reunionid, Integer memberid);
	
	
	@Query("from Register where reunionid = :reunionid")
	public List<Register> findByRegisterId(@Param("reunionid") String reunionid);
	@Query("from Register where reunionid = ?1")
	public List<Register> findByRegisterId(Integer id);
	
	
	@Query(value = "SELECT COUNT(*) FROM register where reunionid　=?1 and review=1",nativeQuery = true)
	Integer findCountRegisterByReunionid( Integer reunionid);
	
	
	@Query(value = "SELECT * FROM register where reunionid　=?1 ORDER BY review",nativeQuery = true)
	public List<Register> findRegisterByReunionid(Integer reunionid);
	
	
	@Query(value = "SELECT * FROM register where memberid　=?1 ",nativeQuery = true)
	public List<Register> findRegisterByMemberid(Integer memberid);
	
	@Transactional
	@Modifying
	@Query(value = "UPDATE register SET review=1 where reunionid = ?1 and memberid =?2",nativeQuery = true)
	void agreeRegisterByReunionidAndMemberid(Integer reunionid, Integer memberid);
	
	@Transactional
	@Modifying
	@Query(value = "UPDATE register SET review=2 where reunionid = ?1 and memberid =?2",nativeQuery = true)
	void notagreeRegisterByReunionidAndMemberid(Integer reunionid, Integer memberid);
	
	@Transactional
	@Modifying
	@Query(value = "delete from register where reunionid = ?1",nativeQuery = true)
    void deleteregisterById(Integer id);
}
