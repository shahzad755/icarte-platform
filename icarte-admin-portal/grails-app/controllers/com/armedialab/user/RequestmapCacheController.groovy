package com.armedialab.user

class RequestmapCacheController {

	def springSecurityService
	
    def clearCache() {
		springSecurityService.clearCachedRequestmaps()
		log.info("Requestmap Cache cleared")
		redirect(uri: "/")
	}
}
