package com.armedialab.listener



import javax.servlet.ServletContextEvent
import javax.servlet.ServletContextListener
import javax.servlet.annotation.WebListener

import com.mysql.jdbc.AbandonedConnectionCleanupThread

@WebListener
public class MysqlThreadsListener implements ServletContextListener {
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//Nothing to do
	}
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println ("************ Destroying MySQL Connection Threads ***********");
		try {
			AbandonedConnectionCleanupThread.shutdown();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		Enumeration<java .sql.Driver> drivers = java.sql.DriverManager.getDrivers();
		while (drivers.hasMoreElements()) {
		   java.sql.Driver driver = drivers.nextElement();
		   try {
			   System.out.println ("************ Deregistering MySQL Driver ***********");
			   
			  java.sql.DriverManager.deregisterDriver(driver);
		   } catch (Throwable t) {t.printStackTrace();}
		}
		try { Thread.sleep(2000L); } catch (Exception e) {}
	}
}