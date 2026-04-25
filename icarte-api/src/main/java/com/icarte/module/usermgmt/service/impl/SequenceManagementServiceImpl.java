package com.icarte.module.usermgmt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icarte.commons.Constants.SequenceHolderEnum;
import com.icarte.domain.SequenceHolder;
import com.icarte.module.branch.dao.SequenceHolderDAO;
import com.icarte.module.ordermgmt.service.SequenceManagementService;

@Service
public class SequenceManagementServiceImpl implements SequenceManagementService{

	@Autowired
	private SequenceHolderDAO sequenceDAO;
	
	
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Long nextVal(SequenceHolderEnum seqHolder) {
		SequenceHolder sequenceHolder = sequenceDAO.findByIdAndLockNoWait(SequenceHolder.class , seqHolder.getSeqType());
		Long currentVal = sequenceHolder.getNextVal();
		Long nextVal = currentVal+1L;
		sequenceHolder.setNextVal(nextVal);
		sequenceDAO.persist(sequenceHolder);
		return currentVal;
	}
}
