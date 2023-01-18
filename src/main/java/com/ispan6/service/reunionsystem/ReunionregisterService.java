package com.ispan6.service.reunionsystem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.reunionsystem.Register;
import com.ispan6.bean.reunionsystem.Reunion;
import com.ispan6.dao.reunionsystem.ReunionregisterReposity;




@Transactional
@Service
public class ReunionregisterService {
	
	@Autowired
	private ReunionregisterReposity ReunionregisterReposity;
	
	
	public void insertRegister(Register register) {
		ReunionregisterReposity.save(register);
	}
    public boolean registerEmpty(Integer reunionid, Integer memberid) {
		return ReunionregisterReposity.findRegisterByReunionidAndMemberid(reunionid, memberid).isEmpty();
			
	}
    
    
    public boolean registerEmpty2(Integer reunionid) {
  		return ReunionregisterReposity.findRegisterByReunionid(reunionid).isEmpty();
  			
  	}
    
    
    
	public List<Register> findByRegisterId(Integer id) {
		return ReunionregisterReposity.findByRegisterId(id);
	}
	
	
	 public Integer findCountRegisterByReunionid(Integer reunionid) {
			return ReunionregisterReposity.findCountRegisterByReunionid(reunionid);
				
		}
	 
		public List<Register> findRegisterByReunionid(Integer id) {
			return ReunionregisterReposity.findRegisterByReunionid(id);
		}
		
		public List<Register> findRegisterByMemberid(Integer id) {
			return ReunionregisterReposity.findRegisterByMemberid(id);
		}
		
		   public void agreeRegisterByReunionidAndMemberid(Integer reunionid, Integer memberid) {
			 ReunionregisterReposity.agreeRegisterByReunionidAndMemberid(reunionid, memberid);
				
		}
		   public void notagreeRegisterByReunionidAndMemberid(Integer reunionid, Integer memberid) {
				 ReunionregisterReposity.notagreeRegisterByReunionidAndMemberid(reunionid, memberid);
					
			}
		   
		   public void deleteregisterById(Integer id) {
			   ReunionregisterReposity.deleteregisterById(id);
			}
}
