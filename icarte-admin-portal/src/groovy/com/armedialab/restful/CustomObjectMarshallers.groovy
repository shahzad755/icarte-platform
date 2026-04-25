package com.armedialab.restful

@Deprecated
class CustomObjectMarshallers {
	List marshallers = []

	def register() {
		marshallers.each{ it.register() }
	}
}
