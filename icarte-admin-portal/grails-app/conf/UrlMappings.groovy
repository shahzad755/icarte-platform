class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'dashboard', action:"index")
        "/verifyactivation/"(controller: 'front', action: "verifyActivation")
        "/registerdevice/"(controller: 'front', action: "registerDevice")
        "/loaditems/"(controller: 'front', action: "loadItems")
        "/callwaiter/"(controller: 'front', action: "callWaiter")
		"/submitfeedback/"(controller: 'front', action: "submitFeedback")
		"/submitorder/"(controller: 'front', action: "submitOrder")
		"/stafflogin/"(controller: 'front', action: "staffLogin")
		"/submitcomments/"(controller: 'front', action: "submitComments")
		
        //"500"(view:'/error')
		"500"(controller: 'errors', action: 'internalError')
		
	}
}
