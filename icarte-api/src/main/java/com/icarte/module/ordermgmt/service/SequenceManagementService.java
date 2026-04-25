package com.icarte.module.ordermgmt.service;

import com.icarte.commons.Constants.SequenceHolderEnum;


public interface SequenceManagementService {

	Long nextVal(SequenceHolderEnum seqHolder);
}
