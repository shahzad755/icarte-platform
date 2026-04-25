package com.icarte.config;

import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.tiles2.TilesConfigurer;
import org.springframework.web.servlet.view.tiles2.TilesView;
import org.springframework.web.servlet.view.tiles2.TilesViewResolver;

@Configuration
@ComponentScan(basePackages = "com.icarte.*")
@EnableTransactionManagement
//@Import({ ICarteSecurityConfig.class })
public class AppConfig {

	
	@Value("${hiberante.username}")
	private String dbUserName;

	@Value("${hibernate.format_sql}")
	private String formatSQL;

	@Value("${hibernate.show_sql}")
	private String showSQL;

	@Value("${hibernate.dialect}")
	private String hibernateDialect;

	@Value("${hibernate.driver}")
	private String dbDriver;

	@Value("${hibernate.password}")
	private String dbUserPass;

	@Value("${hibernate.db.url}")
	private String dbURL;

	@Bean
    public TilesViewResolver tilesViewResolver() {
        TilesViewResolver tilesViewResolver  = new TilesViewResolver();
        tilesViewResolver.setViewClass(TilesView.class);
        tilesViewResolver.setRedirectHttp10Compatible(false);
        return tilesViewResolver;
    }

    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        String[] definitions = {"/WEB-INF/tiles.xml" };
        tilesConfigurer.setDefinitions(definitions);

        return tilesConfigurer;
    }

	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(
				dataSource());
		builder.scanPackages("com.icarte.domain").addProperties(
				getHibernateProperties());
		builder.addPackage("com.icarte.domain");

		return builder.buildSessionFactory();
	}

	private Properties getHibernateProperties() {
		Properties prop = new Properties();
		prop.put("hibernate.format_sql", formatSQL);
		prop.put("hibernate.show_sql", showSQL);
		prop.put("hibernate.dialect", hibernateDialect);
		return prop;
	}

	@Bean(name = "dataSource")
	public BasicDataSource dataSource() {

		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(dbDriver);
		ds.setUrl(dbURL);
		ds.setUsername(dbUserName);
		ds.setPassword(dbUserPass);
		return ds;
	}
	
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(
			SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(
				sessionFactory);

		return transactionManager;
	}
	@Bean
	public static PropertyPlaceholderConfigurer properties() {
		PropertyPlaceholderConfigurer ppc = new PropertyPlaceholderConfigurer();
		final Resource[] resources = new ClassPathResource[] { new ClassPathResource(
				"icarte.properties") };
		ppc.setLocations(resources);
		ppc.setIgnoreResourceNotFound(false);
		ppc.setIgnoreUnresolvablePlaceholders(false);
		return ppc;
	}
}
