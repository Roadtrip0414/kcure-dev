// 
// Decompiled by Procyon v0.5.36
// 

package org.egovframe.rte.fdl.access.service.impl;

import org.slf4j.LoggerFactory;
import java.util.Map;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.BeansException;
import org.springframework.jdbc.core.JdbcTemplate;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

import org.springframework.context.ApplicationContext;
import org.slf4j.Logger;
import org.springframework.context.ApplicationContextAware;

public class EgovAccessDao implements ApplicationContextAware
{
    private static final Logger LOGGER;
    private ApplicationContext context;
    private JdbcTemplate jdbcTemplate;
    private String authorityUserQuery;
    private String roleAndUrlQuery;
    
    public void setApplicationContext(final ApplicationContext context) throws BeansException {
        this.context = context;
    }
    
    public void setDataSource(final DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public String getAuthorityUserQuery() {
        return this.authorityUserQuery;
    }
    
    public void setAuthorityUserQuery(final String authorityUserQuery) {
        this.authorityUserQuery = authorityUserQuery;
    }
    
    public String getRoleAndUrlQuery() {
        return this.roleAndUrlQuery;
    }
    
    public void setRoleAndUrlQuery(final String roleAndUrlQuery) {
        this.roleAndUrlQuery = roleAndUrlQuery;
    }
    
    public List<Map<String, Object>> getAuthorityUser() {
        //EgovAccessDao.LOGGER.debug("##### EgovAccessDao getAuthorityUser >>> {} ", (Object)this.getAuthorityUserQuery());
        //final List<Map<String, Object>> list = (List<Map<String, Object>>)this.jdbcTemplate.queryForList(this.getAuthorityUserQuery());
    	// Authenticated
    	//final List<Map<String, Object>> list = (List<Map<String, Object>>)this.jdbcTemplate.queryForList(sql);
    	final List<Map<String, Object>> list = null;
        return list;
    }
    
    public List<Map<String, Object>> getRoleAndUrl() {
        EgovAccessDao.LOGGER.debug("##### EgovAccessDao getRoleAndUrl >>> {} ", (Object)this.getRoleAndUrlQuery());
        //final List<Map<String, Object>> list = (List<Map<String, Object>>)this.jdbcTemplate.queryForList(this.getRoleAndUrlQuery());
        //final List<Map<String, Object>> list = selectList(this.getRoleAndUrlQuery());
    	final List<Map<String, Object>> list = null;
        return list;
    }
    
    static {
        LOGGER = LoggerFactory.getLogger((Class)EgovAccessDao.class);
    }
}
