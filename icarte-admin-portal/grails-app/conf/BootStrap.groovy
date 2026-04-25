import grails.converters.JSON

import com.armedialab.user.Role
import com.armedialab.user.User
import com.armedialab.user.UserRole
class BootStrap {

	def grailsApplication
	def customObjectMarshallers
	
    def init = { servletContext ->
		//customObjectMarshallers.register()
		
		JSON.registerObjectMarshaller(Date) {
			return it?.format(grailsApplication.config.mediumDateFormat)
		 }
		JSON.registerObjectMarshaller(String) {
			return it?:""
		 }

		/**
		 * Create the default user if not present already in the database
		 */
		if(grailsApplication.config.grails.plugin.springsecurity.active) {
			def userRole = Role.findByAuthority('ROLE_STAFF') ?: new Role(authority: 'ROLE_STAFF', name: "Staff Role", isActive: true).save(failOnError: true)
			def restaurantOwnerRole = Role.findByAuthority('ROLE_RESTAURANT_OWNER') ?: new Role(authority: 'ROLE_RESTAURANT_OWNER', name: "Restaurant Owner", isActive: true).save(failOnError: true)
			def managerRole = Role.findByAuthority('ROLE_MANAGER') ?: new Role(authority: 'ROLE_MANAGER', name: "Restaurant Manager", isActive: true).save(failOnError: true)
			def superAdminRole = Role.findByAuthority('ROLE_SUPERADMIN') ?: new Role(authority: 'ROLE_SUPERADMIN', name: "Super Administrator", isActive: true).save(failOnError: true)

			def adminUser = User.findByUsername('admin') ?: new User(
				username: 'admin',
				password: 'changeme',
				enabled: true,
				firstName: 'SUPER',
				lastName: 'ADMIN',
				createdBy: 'SYSTEM').save(failOnError: true)

			if (!adminUser.authorities.contains(superAdminRole)) {
				UserRole.create adminUser, superAdminRole
			}

			if (!adminUser.authorities.contains(restaurantOwnerRole)) {
				UserRole.create adminUser, restaurantOwnerRole
			}

			if (!adminUser.authorities.contains(managerRole)) {
				UserRole.create adminUser, managerRole
			}

			if (!adminUser.authorities.contains(userRole)) {
				UserRole.create adminUser, userRole
			}
		}

    }
    def destroy = {
    }
}
