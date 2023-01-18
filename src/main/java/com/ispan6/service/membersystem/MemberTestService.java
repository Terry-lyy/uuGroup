package com.ispan6.service.membersystem;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.membersystem.MemberTestDAO;
import com.ispan6.utils.CodeUtils;
import com.ispan6.utils.MD5Utils;

@Service
public class MemberTestService {
		@Autowired
		private MemberTestDAO mDAO;
		
		@Autowired
	    CodeUtils codeUtils;
		
		@Autowired
		MD5Utils md5Utils;
		
		public void insertMember(MemberTest mt) {
			String pwd= md5Utils.md5Encryption(mt.getPassword());
			mt.setPassword(pwd);
			System.out.println(pwd);
			mDAO.save(mt);	
		}
		
		public MemberTest findByAccAndPwd(String account, String password) {
//			Optional<MemberTest> optional = mDAO.findByAccAndPwd(account, password);
			String pwd= md5Utils.md5Encryption(password);
			return mDAO.findByAccAndPwd(account, pwd);
		}
		
		public MemberTest findByAcc(String account) {
			return mDAO.findByAcc(account);
		}
		
		public void updateByAcc(String account, String avator, String name, String address, String phone, String email) {
			mDAO.updateByAcc(account, avator, name, address, phone, email);
		}
		
		public void updatePwd(String password, String account) {
			String pwd= md5Utils.md5Encryption(password);
			mDAO.updatePwd(pwd, account);
		}
		
		public MemberTest existsByAccount(String account) {
//			System.out.println(mDAO.existsByAccount(account));
			return mDAO.existsByAccount(account);				
		
		}
		
		public List<MemberTest> getAllMemberTest() {
			return mDAO.findAll();
		}
		
		public List<MemberTest> findByGender(int male, int female) {
			if(male==0&&female==0) {return mDAO.findAll();}else
			return mDAO.findByGender(male, female);
		}
		
		public List<MemberTest> findMem(int male, int female, String account, String name, String address) {
			return mDAO.findMem(male, female, account, name, address);
		}
		
	    public boolean sendCode(HttpSession session, MemberTest mt) {
	       if ( codeUtils.sendCode(session, mt)) 
	           return true;
	       else
	           return false;
	    }
	    
	    public boolean sendCode2(HttpSession session, String account) {
		       if ( codeUtils.sendCode2(session, account)) 
		           return true;
		       else
		           return false;
		    }
	    
	    public Optional<MemberTest> findById(int id) {
	    	return mDAO.findById(id);
	    }

		public void banMem(int banned, String account) {
			mDAO.banMem(banned, account);
			
		}
		//易查會員資料
		public List<MemberTest> senderFile(HashSet<Integer> id){
			return mDAO.senderFile(id);
		}

}
