package com.armedialab

import grails.transaction.Transactional
import grails.validation.ValidationException

import com.armedialab.entity.Branch
import com.armedialab.entity.ServingTableRequestStatus
import com.armedialab.entity.StatusType
import com.armedialab.util.Constants

@Transactional
class ServingTableRequestManagementService {

	def springSecurityService
	
	private static String LOAD_TABLE_REQUESTS = '''
            SELECT req.id, req.requestCount, tbl.tableRefNumber, tbl.floor, staff.staffCode, user.firstName, user.lastName, status.id
                FROM 
                    ServingTableRequestStatus as req, 
                    ServingTable tbl, 
                    User user, 
                    Staff staff, 
                    StatusType status, 
                    Branch branch
                WHERE
                    req.servingTable = tbl.id
                AND req.branch = branch.id
                AND req.statusType = status.id
                AND req.staff = staff.id
                AND staff.user = user.id
                AND req.statusType = ?
                AND req.branch = ?
				ORDER BY req.dateCreated DESC
        '''
	
    def loadServingTableRequests(Branch branch) {
		def results = []
		if(branch){
			def requests = ServingTableRequestStatus.executeQuery(LOAD_TABLE_REQUESTS, 
				[StatusType.load(Constants.StatusTypeEnum.REQUESTED.getStatusTypeId()), branch], [max: 30])
			results = requests.collect {
				[
					id: it[0],
					requestCount: it[1],
					tableRef: it[2],
					floor: it[3],
					firstName: it[4],
					lastName: it[5],
					status: it[6]
				]
			}
		}
		return results
    }
	
	def dismissServingTableRequest(ServingTableRequestStatus tableRequest){
		if(tableRequest){
			tableRequest.statusType = StatusType.load(Constants.StatusTypeEnum.ACTIONED.getStatusTypeId())
			tableRequest.updatedBy = springSecurityService.principal.username
			tableRequest.save()
			return true
		}
		return false
	}
	
	def createWaiterRequest(ServingTableRequestStatus tableRequestInstance){
		if (tableRequestInstance) {
			if(tableRequestInstance.validate(true)){
				tableRequestInstance.save(flush: true)
			} else {
				throw new ValidationException("CallWaiter Request validation failed!", tableRequestInstance.errors)
			}
		} else {
			throw new ValidationException("Required parameters are missing from the request. Please contact your administrator!", null)
		}
	}
}
