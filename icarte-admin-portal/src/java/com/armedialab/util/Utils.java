package com.armedialab.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.attribute.GroupPrincipal;
import java.nio.file.attribute.PosixFileAttributeView;
import java.nio.file.attribute.UserPrincipalLookupService;
import java.nio.file.attribute.UserPrincipalNotFoundException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;

public class Utils {
    public static final String PATH_SEPARATOR = "/";
	public static final String DATE_FORMAT_MEDIUM = "yyyy-MM-dd HH:mm";
    public static final String DATE_FORMAT_LONG = "yyyy-MM-dd'T'HH:mm:ssZ";
    public static final String DATE_FORMAT = "yyyy-MM-dd";
    public static final String DATE_FORMAT_FOR_UI_DATECTRL = "yyyy-mm-dd HH:mm";
    public static final String TIME_FORMAT = "HH:mm:ss";
    public static final String DAY = "dd";
    public static final String MONTH = "MMM";
    public static final String YEAR = "yyyy";
    public static final String DATE_FORMAT_DEFAULT = DATE_FORMAT;

    static Logger log = Logger.getLogger(Utils.class);
    /**
     * Get today's date in any format.
     *
     * @param dateFormat pass format for get like: "yyyy-MM-dd hh:mm:ss"
     * @return current date in string format
     */
    public static String getCurrentDateAsString(String dateFormat) {
        Locale locale = Locale.getDefault();
        return new SimpleDateFormat(dateFormat, locale).format(new Date().getTime());
    }

    /**
     * Format given date in any format.
     *
     * @param date to be formatted
     * @param dateFormat pass format for get like: "yyyy-MM-dd hh:mm:ss"
     * @return current date in string format
     */
    public static String getDateAsString(Date date, String dateFormat) {
        Locale locale = Locale.getDefault();
        return new SimpleDateFormat(dateFormat, locale).format(date.getTime());
    }

    public static String joinImagePath(String imageBaseUrl, String imageName) {
    	String result = null;
    	if(imageName!=null && imageName.length()>0)
    		result = new StringBuilder(imageBaseUrl).append(PATH_SEPARATOR).append(imageName.trim()).toString();
    	return result;
    }
    
	public static boolean updatePermissions(File file, String groupName) {
		boolean permissionUpdated = false;
		try {
			UserPrincipalLookupService lookupService = FileSystems.getDefault()
					.getUserPrincipalLookupService();
			GroupPrincipal targetGroupPrincipal = lookupService
					.lookupPrincipalByGroupName(groupName);
			
			Files.getFileAttributeView(file.toPath(),
					PosixFileAttributeView.class, LinkOption.NOFOLLOW_LINKS)
					.setGroup(targetGroupPrincipal);
			permissionUpdated = true;
		} catch (UserPrincipalNotFoundException upex) {
			log.error("App is running under Windows, no permissions needs to be changed...", upex);
		} catch (IOException ioex) {
			log.error("IO Exception while trying to update file permssions...", ioex);
		}
		return permissionUpdated;
	}
}
