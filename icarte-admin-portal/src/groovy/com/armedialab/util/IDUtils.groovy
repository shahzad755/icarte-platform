package com.armedialab.util

public class IDUtils {
	def DEFAULT_NUMBER_OF_CHARS = 10
	def CHARS = ('0'..'9') +
/*				('a'..'h') +
				('j'..'k') +
				('m'..'z') +
*/				('A'..'H') +
				('J'..'K') +
				('M'..'Z')
	def random = new Random()

	def generateID() {
		return generateID(DEFAULT_NUMBER_OF_CHARS)
	}
	
	def generateID(def numOfChars) {
//		synchronized(this) {
			def id = ""
			for (i in 1 .. numOfChars) {
				id += CHARS[random.nextInt(CHARS.size())]
			}
			return id
//		}
	}
}
