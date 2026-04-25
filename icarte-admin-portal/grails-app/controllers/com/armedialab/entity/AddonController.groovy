package com.armedialab.entity



import static org.springframework.http.HttpStatus.*

import com.armedialab.util.Constants;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class AddonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def springSecurityService
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def results = loadRecords(params)
		
        render (view: 'index', model: [addonInstanceList: results])
    }

    def show(Addon addonInstance) {
		loadDefaultTranslation(addonInstance)
        respond addonInstance
    }

    def create() {
        respond new Addon(params)
    }

	void loadDefaultTranslation(def addonInstance) {
		addonInstance.addonTranslations = AddonTranslation.findAllWhere(addon: addonInstance,
			language: RefLanguage.load(
				Constants.Languages.ENGLISH.getLanguagesId()))
	}
	
	def loadRecords(def _params) {
		def user = springSecurityService.loadCurrentUser()
		def results = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			results = Addon.findAll("from Addon as addon join addon.addonTranslations aTrans where aTrans.language = ? ",
			[RefLanguage.load(
				Constants.Languages.ENGLISH.getLanguagesId())]/*,
				_params*/)
		} else {
			results = Addon.findAll("from Addon as addon join addon.addonTranslations aTrans where aTrans.language = ?  and addon.restaurant = ?",
			[RefLanguage.load(
				Constants.Languages.ENGLISH.getLanguagesId()),
				Staff.findByUser(user)?.restaurant]/*,
				_params*/)
		}

		return results
	}
	
/*	void loadDefaultTranslation(def addonInstance) {
		if(addonInstance) {
			def translations = addonInstance.addonTranslations
			def translation = translations?.find { it.id == Constants.Languages.ENGLISH.getLanguagesId()}
			if(translation) {
				addonInstance.title = translation.title
				addonInstance.description = translation.description
				addonInstance.showDescription= translation.showDescription
			}
		}
	}
*/	
    @Transactional
    def save(Addon addonInstance) {
        if (addonInstance == null) {
            notFound()
            return
        }

        if (addonInstance.hasErrors()) {
            respond addonInstance.errors, view:'create'
            return
        }
		
		def translation = new AddonTranslation()
		translation.title = params.title
		translation.description=params.description
		translation.showDescription=params.showDescription
		translation.isDefault=true
		
		translation.language = RefLanguage.load(Constants.Languages.ENGLISH.getLanguagesId())
		addonInstance.createdBy = springSecurityService.principal.username
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			addonInstance.restaurant = Staff.findByUser(springSecurityService.loadCurrentUser())?.restaurant
		}

		addonInstance.addToAddonTranslations(translation)
        addonInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'addon.label', default: 'Addon'), translation.title])
                redirect addonInstance
            }
            '*' { respond addonInstance, [status: CREATED] }
        }
    }

    def edit(Addon addonInstance) {
		loadDefaultTranslation(addonInstance)
		def results = AddonTranslation.findAllByAddon(addonInstance)
		
        //respond addonInstance, [addonInsatanceList: results]
		render (view: 'edit', model: [addonInstance: addonInstance, addonInstanceList: results])
    }

    @Transactional
    def update(Addon addonInstance) {
		log.info "Params: ${params}"
		log.info("addonInstance.id=> " + addonInstance.id)
        if (addonInstance == null) {
            notFound()
            return
        }

        if (addonInstance.hasErrors()) {
            respond addonInstance.errors, view:'edit'
            return
        }

		def translation = addonInstance.addonTranslations?.find { 
				it.language.id == Constants.Languages.ENGLISH.getLanguagesId()}
		
		addonInstance.updtaedBy = springSecurityService.loadCurrentUser().username

        addonInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Addon.label', default: 'Addon'),translation?.title])
                redirect addonInstance
            }
            '*'{ respond addonInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Addon addonInstance) {

        if (addonInstance == null) {
            notFound()
            return
        }
		addonInstance.updtaedBy = springSecurityService.loadCurrentUser().username
        addonInstance.isActive = false

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deactivated.message', args: [message(code: 'Addon.label', default: 'Addon'), addonInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

	protected AddonTranslation createDefaultTranslation (Addon addonInstance) {
		//find if the language translation exists already, if yes then update
		AddonTranslation addonTranslationInstance = AddonTranslation.findOrCreateWhere(addon: addonInstance, 
			language: RefLanguage.load(
				Constants.Languages.ENGLISH.getLanguagesId()))
		addonTranslationInstance.title = addonInstance.title
		addonTranslationInstance.description = addonInstance.description
		addonTranslationInstance.isDefault = true
		addonTranslationInstance.showDescription = addonInstance.showDescription
		return addonTranslationInstance
	} 
	
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'addon.label', default: 'Addon'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
