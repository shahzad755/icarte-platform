package com.armedialab.entity

class Months {

	int month_num
	String name
	String barChartColor
    static constraints = {
    }
	static mapping = {
		version false
		id column: "MONTH_NUM", sqlType: "int"
	}

}
