package kcure.portal.sys.log.ifr.service;

import java.util.List;

import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.sys.log.ifr.service.impl.AlarmConfigVO;
import kcure.portal.sys.log.ifr.service.impl.AlarmGroupVO;
import kcure.portal.sys.log.ifr.service.impl.InstanceVO;
import kcure.portal.sys.log.ifr.service.impl.MetrixVO;
import kcure.portal.sys.log.ifr.service.impl.ReqVO;
import kcure.portal.sys.log.ifr.service.impl.UserGroupVO;

public interface IfrService {

	public List<MetrixVO> getMetrixInfo(ReqVO reqVo) throws Exception;
	public List<AlarmGroupVO> getAlamGroups(ReqVO reqVo) throws Exception;
	public List<AlarmConfigVO> getAlarmConfigs(ReqVO reqVo) throws Exception;
	public List<InstanceVO> getInstances(ReqVO reqVo) throws Exception;
	public List<UserGroupVO> getUserGroups(ReqVO reqVo) throws Exception;
	public List<UserGroupVO> getUserAlarmGroups(ReqVO reqVo) throws Exception;
	
	public AlarmGroupVO registAlamGroups(ReqVO reqVo) throws Exception;	
	public AlarmConfigVO registAlamConfigs(ReqVO reqVo) throws Exception;
	public UserGroupVO registUserGroups(ReqVO reqVo) throws Exception;
	
	public String registInstances(ReqVO reqVo) throws Exception;
	public String registUserAlarmGroups(ReqVO reqVo) throws Exception;

	public AlarmGroupVO modiAlamGrpups(ReqVO reqVo) throws Exception;
	public UserGroupVO modiUserGrpups(ReqVO reqVo) throws Exception;

	public String deleteAlamGroups(ReqVO reqVo) throws Exception;
	public String deleteAlarmConfigs(ReqVO reqVo) throws Exception;	
	public String deleteInstances(ReqVO reqVo) throws Exception;
	public String deleteUserAlarmGroups(ReqVO reqVo) throws Exception;
	public String deleteUserGroups(ReqVO reqVo) throws Exception;

	public void saveAlarmGroup(GridParameterMap gridParameterMap) throws Exception;
	public void saveAlarmConfig(GridParameterMap gridParameterMap) throws Exception;
	public void saveAlarmInstance(GridParameterMap gridParameterMap) throws Exception;
	public void saveAlarmUserGroup(GridParameterMap gridParameterMap) throws Exception;
	public void saveUserGroup(GridParameterMap gridParameterMap) throws Exception;

}
