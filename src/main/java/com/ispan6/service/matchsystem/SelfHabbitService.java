package com.ispan6.service.matchsystem;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.matchsystem.HobbitBean;
import com.ispan6.bean.matchsystem.SelfHobbitBean;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.matchsystem.SelfHobbitDto;
import com.ispan6.dao.membersystem.MemberTestDAO;

@Service
@Transactional
public class SelfHabbitService {

	@Autowired
	private SelfHobbitDto selfHobbitDto;

	private MemberTestDAO mdao;

	@PersistenceContext
	private EntityManager entityManager;

	public List<SelfHobbitBean> findMatch() {
		return selfHobbitDto.findAll();
	}

//	public List<MemberTest> findByTypeAndLabel(Integer[] genderCondi, Integer[] hobbitCondi) {
//		CriteriaBuilder builder = entityManager.getCriteriaBuilder();
//		CriteriaQuery<MemberTest> query = builder.createQuery(MemberTest.class);
//		Root<SelfHobbitBean> root = query.from(SelfHobbitBean.class);
//		List<Integer> typeList = Arrays.asList(genderCondi);
//		List<Integer> labelList = Arrays.asList(hobbitCondi);
//		Predicate typePredicate = null;
//		Predicate labelPredicate = null;
//
//		if (genderCondi.length == 0 && hobbitCondi.length == 0) {
//			return mdao.findAll();
//		}
//
//		if (genderCondi.length == 0) {
//			typePredicate = root.get("type").in(1, 2);
//		} else {
//			typePredicate = root.get("type").in(typeList);
//		}
//
//		if (hobbitCondi.length == 0) {
//			labelPredicate = root.get("label").in(1, 2, 3, 4, 5, 6);
//		} else {
//			labelPredicate = root.get("label").in(labelList);
//		}
//		Predicate statusPredicate = root.get("status").in(0);
//
//		query.where(builder.and(typePredicate, labelPredicate, statusPredicate));
//
//		TypedQuery<SelfHobbitBean> typedQuery = entityManager.createQuery(query);
//		return null;
//	}

//	
//	SELECT * FROM Membertest m 
//	WHERE m.m_id IN 
//	   (SELECT sh.userhid FROM SelfHobbit sh WHERE m.m_id = sh.userhid 
//	   AND sh.hobbitid IN (1) group by userhid) 
//	   AND m.gender IN (1,2)
	public List<MemberTest> findByHobbitAndGender(Integer[] hobbitId, Integer[] genders,Integer id) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();

		List<Integer> hobbitList = Arrays.asList(hobbitId);
		List<Integer> genderList = Arrays.asList(genders);
		CriteriaQuery<MemberTest> query = cb.createQuery(MemberTest.class);
		Root<MemberTest> root = query.from(MemberTest.class);
		Subquery<String> subQuery = query.subquery(String.class);
		Root<SelfHobbitBean> from = subQuery.from(SelfHobbitBean.class);
		subQuery.select(from.get("userhid"));
		if (hobbitId.length == 0) {
			subQuery.where(from.get("hobbitid").in(1, 2, 3, 4, 5, 6));
		} else {
			subQuery.where(from.get("hobbitid").in(hobbitList));
		}
		subQuery.groupBy(from.get("userhid"));
		if (genders.length == 0) {
			query.where(cb.and(root.get("id").in(subQuery), root.get("gender").in(1, 2),cb.notEqual(root.get("id"), id)));
		} else {
			query.where(cb.and(root.get("id").in(subQuery), root.get("gender").in(genderList)) ,cb.notEqual(root.get("id"), id));
		}
		TypedQuery<MemberTest> typedQuery = entityManager.createQuery(query);
		return typedQuery.getResultList();
	}
}
