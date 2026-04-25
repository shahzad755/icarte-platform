package com.armedialab.restful

 import java.text.SimpleDateFormat; 
import java.util.Date; 
 

 import org.springframework.beans.PropertyEditorRegistrar; 
import org.springframework.beans.PropertyEditorRegistry; 
import org.springframework.beans.propertyeditors.CustomDateEditor; 
import org.springframework.context.i18n.LocaleContextHolder; 
 
@Deprecated
public class CustomDateEditorRegistrar implements PropertyEditorRegistrar {
	def grailsApplication
	
    public void registerCustomEditors(PropertyEditorRegistry registry) {
        String dateFormat = grailsApplication.config.shortDateFormat?: 'yyyy-MM-dd' 
        log.info(">>> registering custom date editor with format ${dateFormat}")
        registry.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat(dateFormat), true))
        log.info(">>>custom date editor registered successfully")
    }
}