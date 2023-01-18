package com.ispan6.service.matchsystem;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.matchsystem.MatchBean;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.controller.reunionsystem.reunionbackendController;
import com.ispan6.dao.matchsystem.MatchDAO;
import com.ispan6.dao.membersystem.MemberTestDAO;

@Service
@Transactional
public class MatchService {
	@Autowired
	private MemberTestDAO memberTestDao;
	@Autowired
	private MatchDAO matchDao;



	public MemberTest random1(Integer id,Integer fid) {
		return memberTestDao.random1(id,fid);
	};

	public MemberTest random1() {
		return memberTestDao.random1();
	};

	public void addNewFriend(MatchBean matchBean) {
		matchDao.save(matchBean);
	};
	
	public List<MatchBean> findMyFriend(Integer id,Integer fid) {
		return matchDao.findMyFriend(id,fid);
	};

	
	public MemberTest findById(Integer id) {
		Optional<MemberTest> matchBean = memberTestDao.findById(id);
		if (matchBean.isPresent()) {
			return matchBean.get();
		}
		return null;
	}

	public List<MemberTest> getMatch(Integer id,Integer fid) {
		return memberTestDao.findWithoutUser(id,fid);
	};
	
	public MatchBean findFriend(Integer uid, Integer fid) {
		return matchDao.findFriend(uid, fid);
	};

	public  List<MatchBean> findMyInvitation(Integer id) {
		return matchDao.findMyInvitation(id);
	};
	
	public List<MatchBean> findWhoSendInvitation(Integer id){
		return matchDao.findWhoSendInvitation(id);
	};


	public void agreeInvitation(Integer uid,Integer fid) {
	matchDao.agreeInvitation(uid, fid);
	};
	
	public void blockfriend(Integer uid,Integer id) {
		matchDao.blockfriend(uid,id);
	};
	
	public List<MatchBean> findMyBlock(Integer id){
		return matchDao.findMyBlock(id);
	};

	public void cancelfriend(Integer uid) {
		matchDao.deleteById(uid);
	};

	public void cancelblock(Integer uid) {
		matchDao.cancelblock(uid);
	};

}
