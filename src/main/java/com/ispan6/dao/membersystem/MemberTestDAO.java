package com.ispan6.dao.membersystem;

import java.util.HashSet;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.membersystem.MemberTest;


@Repository
public interface MemberTestDAO extends JpaRepository<MemberTest, Integer>, JpaSpecificationExecutor<MemberTest> {
	@Query("from MemberTest where m_account= :account and m_password= :password")
	public MemberTest findByAccAndPwd(@Param("account") String account, @Param("password") String password);

	@Transactional
	@Modifying
	@Query(value = "UPDATE MemberTest SET m_name= :name, avator= :avator, address= :address, phone= :phone, email =:email WHERE m_account= :account")
	public void updateByAcc(@Param("account") String account, @Param("avator") String avator,
			@Param("name") String name, @Param("address") String address, @Param("phone") String phone,
			@Param("email") String email);
	
	@Transactional
	@Modifying
	@Query(value = "UPDATE MemberTest SET m_password= :password WHERE m_account= :account")
	public void updatePwd(@Param("password") String password, @Param("account") String account); 
	
	@Query("from MemberTest where m_account= :account")
	public MemberTest findByAcc(@Param("account") String account);

	@Query(value = "FROM MemberTest where m_account= :account")
	public MemberTest existsByAccount(@Param("account") String account);

	@Query(value = "FROM MemberTest where (gender= :male or gender= :female)")
	public List<MemberTest> findByGender(@Param("male") Integer male, @Param("female") Integer female);

	@Query(value = "FROM MemberTest where (gender= ?1 or gender= ?2) and m_account like %?3% and m_name like %?4% and address like %?5%")
	public List<MemberTest> findMem(Integer male, Integer female, String account, String name, String address);
	
	@Transactional
	@Modifying 
	@Query(value="UPDATE MemberTest SET banned= ?1 where m_account= ?2",nativeQuery = true)
	public void banMem(Integer banned, String account);
	
	@Query(value = "SELECT top 1* from membertest  WHERE  not exists (select * from friend where  (membertest.m_id=fuid or membertest.m_id=userid) and (isfriend =2 or isfriend =1) and (whoblocked=?1 or whoblocked=0)) and m_id !=?2 and m_account !='admin' ORDER by NEWID()", nativeQuery = true)
	public MemberTest random1(Integer id, Integer fid);

	@Query(value = "SELECT * from membertest  WHERE  not exists (select * from friend where  (membertest.m_id=fuid or membertest.m_id=userid) and (isfriend =2 or isfriend =1) and (whoblocked=?1 or whoblocked=0)) and m_id !=?2 and m_account !='admin'", nativeQuery = true)
	public List<MemberTest> findWithoutUser(Integer id, Integer fid);

	@Query(value = "SELECT top 1* from memberTest where m_account !='admin' ORDER BY NEWID()", nativeQuery = true)
	public MemberTest random1();
//		@Override
//		public String existsByMemberId(String memberId) {
//			String hql = "FROM MemberEntity m WHERE m.memberId = :id";
//			String id = ""; 
//			
//			Session session = factory.getCurrentSession();
//			
//			List<Member> list = session.createQuery(hql, Member.class)
//									   .setParameter("id", memberId)
//									   .getResultList();
//			if (!  list.isEmpty()) {
//				id = list.get(0).getMemberId();
//			}
//			
//			return id;
//		}

	// 易
	@Query(value = "SELECT * FROM memberTest where m_id in(?1)", nativeQuery = true)
	public List<MemberTest> senderFile(HashSet<Integer> id);

	@Query(value="SELECT * FROM Membertest m WHERE m.m_id IN (SELECT sh.userhid FROM SelfHobbit sh WHERE m.m_id = sh.userhid AND sh.hobbitid IN (:hobbitIds) group by userhid) AND m.gender IN (:genders)", nativeQuery = true)
	public List<MemberTest> findByHobbitIdsAndGenders(@Param("hobbitIds") List<Integer> hobbitIds,
			@Param("genders") List<Integer> genders);

}
