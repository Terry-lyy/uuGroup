package com.ispan6.service.reunionsystem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.reunionsystem.Reunion;
import com.ispan6.dao.reunionsystem.ReunionsystemRepository;

@Transactional
@Service
public class ReunionsystemService {
	
	@Autowired
	private ReunionsystemRepository reunionsystemRepository;
	
	
//	public WorkMessageService(WorkMessageRepository wRepo) {
//		this.wRepo = wRepo;
//	}
	
	
	public List<Reunion> findDateRange(String start,String end){
		return reunionsystemRepository.findDateRange(start,end);	
	}
	
	public List<Reunion> blurrysearchReunion(String i){
		return reunionsystemRepository.blurrysearchReunion(i);	
	}
	
	
	public List<Reunion> findAllReunion(){
		return reunionsystemRepository.findAll();	
	}
	
	public List<Reunion> findByPaymentId(Integer id) {
		return reunionsystemRepository.findByPaymentId(id);
	}

	public List<Reunion> findByReuniontypelId(Integer id) {
		return reunionsystemRepository.findByReuniontypeId(id);
	}
	
	public Reunion insertReunion(Reunion reunion) {
		return reunionsystemRepository.save(reunion);
	}
	
	public void addReunionnumber(Integer id) {
		reunionsystemRepository.addReunionnumber(id);
	}
	
	
	public List<Reunion> findAllByMemberId(Integer i) {
		return reunionsystemRepository.findAllByMemberId(i);
	}
	
	public Reunion findByReunionId(Integer i) {
		return reunionsystemRepository.findByReunionId(i);
	}
	
	
	public void deleteReunionByReunionId(Integer Id) {
		reunionsystemRepository.deleteById(Id);
	}
	
//	public void insert(Reunion msg) {
//		wRepo.save(msg);
//	}
	
//	public Reunion getLatest() {
//		return wRepo.findFirstByOrderByAddedDesc();
//	}
	

	
	
//	
//	public Page<Reunion> findByPage(Integer pageNumber){
//		Pageable pgb = PageRequest.of(pageNumber-1,3, Sort.Direction.DESC,"reunionid");
//		
//		return wRepo.findAll(pgb);
//	}
	


}
