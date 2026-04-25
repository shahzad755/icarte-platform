package com.armedialab.emergency



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserProfileController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserProfile.list(params), model:[userProfileInstanceCount: UserProfile.count()]
    }

    def show(UserProfile userProfileInstance) {
        respond userProfileInstance
    }

    def create() {
        respond new UserProfile(params)
    }

    @Transactional
    def save(UserProfile userProfileInstance) {
        if (userProfileInstance == null) {
            notFound()
            return
        }

        if (userProfileInstance.hasErrors()) {
            respond userProfileInstance.errors, view:'create'
            return
        }

        userProfileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), userProfileInstance.id])
                redirect userProfileInstance
            }
            '*' { respond userProfileInstance, [status: CREATED] }
        }
    }

    def edit(UserProfile userProfileInstance) {
        respond userProfileInstance
    }

    @Transactional
    def update(UserProfile userProfileInstance) {
        if (userProfileInstance == null) {
            notFound()
            return
        }

        if (userProfileInstance.hasErrors()) {
            respond userProfileInstance.errors, view:'edit'
            return
        }

        userProfileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserProfile.label', default: 'UserProfile'), userProfileInstance.id])
                redirect userProfileInstance
            }
            '*'{ respond userProfileInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserProfile userProfileInstance) {

        if (userProfileInstance == null) {
            notFound()
            return
        }

        userProfileInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserProfile.label', default: 'UserProfile'), userProfileInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	@Transactional
	def emergencyRequests () {
		if(log.isDebugEnabled())
			log.debug("Params in UserProfileController: ${params}")
		def resp = null

		//def req = request.JSON
		def emergencyRequest = request.JSON
		
		UserProfile userProfile = new UserProfile(emergencyRequest['request'])
		userProfile.requestType = emergencyRequest.requestType
		userProfile.save(true);
		
		//render(text: [hhh:'shhajsg'], contentType: "application/json", encoding: "UTF-8")
		render (userProfile as JSON)
	}
	
	def emergencyRequest() {
		render (view: 'emergencyRequest',
				model: [refreshInterval: 10000])
	}
	
	private static String LOAD_EMERGENCY_REQUESTS = '''
            SELECT req.id, req.firstName, req.lastName, req.mobile, req.nationality, req.qatariId, req.requestType FROM 
                    UserProfile as req
				ORDER BY req.id DESC
        '''

	def loadEmergencyRequests(){
		def results = []
		
		def requests = UserProfile.executeQuery(LOAD_EMERGENCY_REQUESTS)
		results = requests.collect {
			[
				id: it[0],
				firstName: it[1],
				lastName: it[2]?:'',
				mobile: it[3]?:'',
				nationality: it[4]?:'',
				qId: it[5]?:'',
				requestType: it[6]
			]
		}
		
		def jsonData = [data: results, state: "OK"]
		render jsonData as JSON
	}
	
	def mapAlert(UserProfile userProfileInstance) {
		render (view: 'mapAlert',
			model: [userProfileInstance: userProfileInstance])
	}
}
