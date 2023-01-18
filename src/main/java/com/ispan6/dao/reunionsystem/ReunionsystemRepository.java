package com.ispan6.dao.reunionsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.reunionsystem.Reunion;
import com.ispan6.bean.reunionsystem.Reunionreport;

public interface ReunionsystemRepository extends JpaRepository<Reunion,Integer> {
	
	
	
	@Query("from Reunion where payment = :payment")
	public List<Reunion> findByPayment(@Param("payment") String payment);
	@Query("from Reunion where payment = ?1")
	public List<Reunion> findByPaymentId(Integer id);

	
	@Query("from Reunion where activity = :activity")
	public List<Reunion> findByReuniontype(@Param("activity") String activity);
	@Query("from Reunion where activity = ?1")
	public List<Reunion> findByReuniontypeId(Integer id);
	
	@Query(value = "select * from Reunion where memberid = ?1",nativeQuery = true)
	public List<Reunion> findAllByMemberId(Integer i);
	
	
	@Query("from Reunion where reunionid = :reunionid")
	public Reunion findByReunionId(@Param("reunionid") String reunionid);
	@Query("from Reunion where reunionid = ?1")
	public Reunion findByReunionId(Integer id);
	
	
	@Transactional
	@Modifying
	@Query(value = " UPDATE reunion	SET number = number + 1 WHERE reunionid = ?1",nativeQuery = true)
	public void addReunionnumber(Integer id);
	
	
	@Query(value = "Select * FROM reunion Where topic LIKE ?1 or　content　LIKE ?1 or　place　LIKE ?1",nativeQuery = true)
	public List<Reunion> blurrysearchReunion(String i);
	
	
	@Query(value ="Select * from reunion where holdTime between ?1 and ?2",nativeQuery = true)
	public List<Reunion> findDateRange(String start,String end);

//	@Query("from WorkMessages where text=?1")
//	public List<Reunion> findMsgByText(String text);
//
//	@Query("from WorkMessages where text=:t")
//	public List<Reunion> findMsgByText2(@Param("t") String text);
//
//	@Query(value = "select * from WorkMessages where text = :t", nativeQuery = true)
//	public List<Reunion> findMsgByTextNative(@Param("t") String text);
//
//	@Query(value = "from WorkMessages where text like %?1% ")
//	public List<Reunion> findMsgLikeText(String text);
//
//	@Query(value = "from WorkMessages where text like %:t% ")
//	public List<Reunion> findMsgLikeText2(@Param("t") String text);
//
//	@Transactional
//	@Modifying
//	@Query(value = "delete from WorkMessages where id = ?1")
//	public void deleteMsgById(Integer id);
//
//	public List<Reunion> findByTextOrderByAdded(String text);
//
//	// 來源:https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#appendix.query.method.predicate
//	public List<Reunion> findByTextContainingOrderByAdded(String text);
//
//	public Reunion findFirstByOrderByAddedDesc();
}
