// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format
grails.config.locations = [ "classpath:config.properties",
							"file:${userHome}/${appName}-config.properties"]

/*grails.config.locations = [ "file:${userHome}/${appName}-config.properties",
	"file:${userHome}/${appName}-${grails.util.Environment.current.name}-config.properties" ]
*/
// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ // the first one is the default format
    all:           '*/*', // 'all' maps to '*' or the first available format in withFormat
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    hal:           ['application/hal+json','application/hal+xml'],
    xml:           ['text/xml', 'application/xml']
]

grails.resources.debug = true
grails.resources.processing.enabled = false
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html" // none, html, base64
grails.views.gsp.sitemesh.preprocess = true

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}


grails.converters.encoding = "UTF-8"

// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

// configure passing transaction's read-only attribute to Hibernate session, queries and criterias
// set "singleSession = false" OSIV mode in hibernate configuration after enabling
grails.hibernate.pass.readonly = false
// configure passing read-only to OSIV session by default, requires "singleSession = false" OSIV mode
grails.hibernate.osiv.readonly = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        grails.serverURL = "http://localhost:8080/icarte-portal-0.1"
    }
}

// log4j configuration
log4j.main = {
	appenders {
		rollingFile name:'file', file:'/opt/tomcat/logs/icarte-portal.log', maxFileSize: '5MB', MaxBackupIndex:5, layout:pattern(conversionPattern: '%d [%t] %-5p %c %x - %m%n')
		console name:'stdout', layout:pattern(conversionPattern: '%d [%t] %-5p %c %x - %m%n')
		//appender.stdout = "org.apache.log4j.FileAppender"
		//appender.'stdout.File'="stdout.log"   //will go to approotdirectory/stdout.log

	}
	root {
		debug 'file'
		info 'stdout'
		additivity = true
	}

	debug	'grails.app'
	
	debug 	'grails.app.services',
			'grails.app.controllers',
			'grails.app.domain',
			'hibernate.tool.hbm2ddl',
			'net.sf.ehcache'
			//'org.codehaus.groovy.grails'
			//'org.springframework.transaction',
			//'com.business'
	//trace	'org.hibernate.type'

	error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
		   'org.codehaus.groovy.grails.web.pages', //  GSP
		   'org.codehaus.groovy.grails.web.sitemesh', //  layouts
		   'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
		   'org.codehaus.groovy.grails.web.mapping', // URL mapping
		   'org.codehaus.groovy.grails.commons', // core / classloading
		   'org.codehaus.groovy.grails.plugins', // plugins
		   'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
		   'org.springframework',
		   'org.hibernate',
		   'net.sf.ehcache.hibernate'

	warn   	'org.mortbay.log'
	
//	trace  	//'org.springframework.transaction'
			//'org.hibernate.SQL',
			//'org.hibernate.type'
}

// ------------- BEGIN Application specific configs ---------------
grails.gorm.failOnError = true

//Threshold value for session & grails validation map to be clear - this hack is required to avoid memory leak in case of long running batch jobs
threshold.gorm.clear=25
grails.gorm.default.constraints = {
	description (nullable: true, maxSize: 255)
	code (size: 1..10, unique: true)
	name (size: 2.. 100)
}
/*
search {
	pagination {
	  pageSize {
		  default_ = 20
		  country = 30
		  city = 30
	  }
	  currentPageParam = "_startRow"
	  //endPageParam = "_endRow"
	  offsetIndexForDatatable=0
	}
	defaultOrderBy {
		//consignmentBatch = "dateCreated"
		//declaration = "dateCreated"
	}
	dateFormat = "yyyy-MM-dd"
}
*/
/*
grails.plugin.reveng.packageName = 'com.armedialab.entity'
grails.plugin.reveng.manyToManyTables = ['user_role', 'role_service']
grails.plugin.reveng.manyToManyBelongsTos = ['user_role': 'role', 'role_service': 'role']
//grails.plugin.reveng.versionColumns = [other: 'nonstandard_version_name']
*/
grails.plugin.springsecurity.active = true
grails.plugin.springsecurity.logout.postOnly = false
// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.arleap.user.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.arleap.user.UserRole'
grails.plugin.springsecurity.authority.className = 'com.arleap.user.Role'
grails.plugin.springsecurity.requestMap.className = 'com.arleap.user.Requestmap'
grails.plugin.springsecurity.securityConfigType = 'Requestmap'
