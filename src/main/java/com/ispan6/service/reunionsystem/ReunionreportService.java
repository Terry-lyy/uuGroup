package com.ispan6.service.reunionsystem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.reunionsystem.Register;
import com.ispan6.bean.reunionsystem.Reunionreport;
import com.ispan6.dao.reunionsystem.ReunionreportRepository;




@Transactional
@Service
public class ReunionreportService {
	
	@Autowired
	private ReunionreportRepository ReunionreportRepository;
	
	
	public List<Reunionreport> findReunionreportByMemberid(Integer id) {
		return ReunionreportRepository.findReunionreportByMemberid(id);
	}
	
	public void deleteReunionreport(Integer id) {
		 ReunionreportRepository.deleteReunionreportById(id);
	}
	
	
	
	public List<Reunionreport> getAllReunionreport() {
		return ReunionreportRepository.findAll();
	}
	
	public void insertReunionreport(Reunionreport reunionreport) {
		ReunionreportRepository.save(reunionreport);
	}
	
    public boolean reportEmpty(Integer reunionid, Integer memberid) {
		return ReunionreportRepository.findReunionreportByReunionidAndMemberid(reunionid, memberid).isEmpty();
			
	}
    
    
    public boolean reportEmpty2(Integer reunionid) {
  		return ReunionreportRepository.findReunionreportByReunionid(reunionid).isEmpty();
  			
  	}
	
	
}
