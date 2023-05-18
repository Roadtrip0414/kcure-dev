package kcure.portal.sys.log.ifr.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.SessionVO;
import kcure.portal.cmn.grid.GridParameterMap;
import kcure.portal.cmn.grid.GridVar;
import kcure.portal.sys.log.ifr.service.IfrService;
import kcure.portal.sys.log.ifr.service.impl.AlarmConfigVO;
import kcure.portal.sys.log.ifr.service.impl.AlarmGroupVO;
import kcure.portal.sys.log.ifr.service.impl.InstanceVO;
import kcure.portal.sys.log.ifr.service.impl.MetrixVO;
import kcure.portal.sys.log.ifr.service.impl.ReqVO;
import kcure.portal.sys.log.ifr.service.impl.UserGroupVO;

@Controller
@SessionAttributes(types=SessionVO.class)
@RequestMapping("/portal/sys/log/ifr")
public class IfrController {
	
	@Resource(name = "ifrService")
	private IfrService ifrService;

	
	/**
	  * @Method Name : viewMetrix
	  * @작성일 : 2023. 3. 29.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>	
	  *    지표조회 화면
	  *  </p>
	  * @param : 
	  * @return : String
	  */
	   @RequestMapping(value="/viewMetrix.do")
	   public String viewMetrix(ModelMap model) throws Exception {	   
		   return "kcure/portal/sys/log/ifr/ViewMetrix";
	   }
	   
   /**
	  * @Method Name : viewAlarmGroup
	  * @작성일 : 2023. 3. 29.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>	
	  *    알람그룹 화면
	  *  </p>
	  * @param : 
	  * @return : String
	  */
	 @RequestMapping(value="/viewAlarmGroup.do")
	 public String viewAlarmGroup(ModelMap model) throws Exception {	   
		   return "kcure/portal/sys/log/ifr/ViewAlarmGroup";
	 }
	 
	 /**
	  * @Method Name : viewUserGroup
	  * @작성일 : 2023. 3. 30.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>	
	  *    사용자그룹 화면
	  *  </p>
	  * @param : 
	  * @return : String
	  */
	 @RequestMapping(value="/viewUserGroup.do")
	 public String viewUserGroup(ModelMap model) throws Exception {	   
		   return "kcure/portal/sys/log/ifr/ViewUserGroup";
	 }
	 
	 /**
	  * @Method Name : viewAlarmConfig
	  * @작성일 : 2023. 3. 29.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>	
	  *    감시설정 화면
	  *  </p>
	  * @param : 
	  * @return : String
	  */
	 @RequestMapping(value="/viewAlarmConfig.do")
	 public String viewAlarmConfig(ModelMap model) throws Exception {	  
		 ReqVO reqVo = new ReqVO();
		 List<AlarmGroupVO> list = ifrService.getAlamGroups(reqVo);
		 
		 model.addAttribute("alarmGrpList", list);
		 
		 return "kcure/portal/sys/log/ifr/ViewAlarmConfig";
	 }
   
	 /**
	  * @Method Name : viewAlarmInstance
	  * @작성일 : 2023. 3. 30.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>	
	  *   알람-인스턴스 연동 화면
	  *  </p>
	  * @param : 
	  * @return : String
	  */
	 @RequestMapping(value="/viewAlarmInstance.do")
	 public String viewAlarmInstance(ModelMap model) throws Exception {	  
		 ReqVO reqVo = new ReqVO();
		 List<AlarmGroupVO> list = ifrService.getAlamGroups(reqVo);
		 
		 model.addAttribute("alarmGrpList", list);
		 
		 return "kcure/portal/sys/log/ifr/ViewAlarmInstance";
	 }
	 
	 /**
	  * @Method Name : viewAlarmUserGroup
	  * @작성일 : 2023. 3. 30.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>	
	  *   알람-사용자그룹 연동 화면
	  *  </p>
	  * @param : 
	  * @return : String
	  */
	 @RequestMapping(value="/viewAlarmUserGroup.do")
	 public String viewAlarmUserGroup(ModelMap model) throws Exception {	  
		 ReqVO reqVo = new ReqVO();
		 List<AlarmGroupVO> list = ifrService.getAlamGroups(reqVo);
		 
		 model.addAttribute("alarmGrpList", list);
		 
		 return "kcure/portal/sys/log/ifr/ViewAlarmUserGroup";
	 }
	 
	 
	 /**
      * @Method Name : getUserGroupCombo
      * @작성일 : 2023. 3. 30.
      * @작성자 : bhs
      * @Method 설명 : 그리드 사용자그룹 콤보 조회
      *  <p>
      *  </p>
      * @param : ReqVO
      * @return : List
      */
    @ResponseBody
    @RequestMapping(value="/getUserGroupCombo.do")
    public List<UserGroupVO> getUserGroupCombo(ModelMap model) throws Exception {
    	ReqVO reqVo = new ReqVO();
    	List<UserGroupVO> comboList = ifrService.getUserGroups(reqVo);
    	
    	return comboList;
    }
    
    
	 /**
      * @Method Name : saveAlarmGroup
      * @작성일 : 2023. 3. 29.
      * @작성자 : bhs
      * @Method 설명 : 알람그룹 저장
      *  <p>
      *  </p>
      * @param : gridParameterMap GridParameterMap
      * @return : ModelAndView
      */
    @RequestMapping(value="/saveAlarmGroup.do")
    public ModelAndView saveAlarmGroup(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
    	ifrService.saveAlarmGroup(gridParameterMap);

		ModelAndView modelAndView = new ModelAndView("jsonView", model);
		
		return modelAndView;
    }
    
    /**
     * @Method Name : saveAlarmConfig
     * @작성일 : 2023. 3. 29.
     * @작성자 : bhs
     * @Method 설명 : 감시설정 저장
     *  <p>
     *  </p>
     * @param : gridParameterMap GridParameterMap
     * @return : ModelAndView
     */
   @RequestMapping(value="/saveAlarmConfig.do")
   public ModelAndView saveAlarmConfig(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
	   ifrService.saveAlarmConfig(gridParameterMap);
	   
	   ModelAndView modelAndView = new ModelAndView("jsonView", model);
	   
	   return modelAndView;
   }
   
   /**
    * @Method Name : saveUserGroup
    * @작성일 : 2023. 3. 30.
    * @작성자 : bhs
    * @Method 설명 : 사용자그룹 저장
    *  <p>
    *  </p>
    * @param : gridParameterMap GridParameterMap
    * @return : ModelAndView
    */
  @RequestMapping(value="/saveUserGroup.do")
  public ModelAndView saveUserGroup(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
	  ifrService.saveUserGroup(gridParameterMap);
	  
	  ModelAndView modelAndView = new ModelAndView("jsonView", model);
	  
	  return modelAndView;
  }
   
   /**
    * @Method Name : saveAlarmInstance
    * @작성일 : 2023. 3. 30.
    * @작성자 : bhs
    * @Method 설명 : 알람-인스턴스 저장
    *  <p>
    *  </p>
    * @param : gridParameterMap GridParameterMap
    * @return : ModelAndView
    */
  @RequestMapping(value="/saveAlarmInstance.do")
  public ModelAndView saveAlarmInstance(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
	  ifrService.saveAlarmInstance(gridParameterMap);
	  
	  ModelAndView modelAndView = new ModelAndView("jsonView", model);
	  
	  return modelAndView;
  }
  
  /**
   * @Method Name : saveAlarmUserGroup
   * @작성일 : 2023. 3. 30.
   * @작성자 : bhs
   * @Method 설명 : 알람-사용자그룹 저장
   *  <p>
   *  </p>
   * @param : gridParameterMap GridParameterMap
   * @return : ModelAndView
   */
	@RequestMapping(value="/saveAlarmUserGroup.do")
	public ModelAndView saveAlarmUserGroup(GridParameterMap gridParameterMap, ModelMap model) throws Exception {
		ifrService.saveAlarmUserGroup(gridParameterMap);
		
 		ModelAndView modelAndView = new ModelAndView("jsonView", model);
 		return modelAndView;
	}
	
	 /**
	  * @Method Name : selectMetrixList
	  * @작성일 : 2023. 3. 29.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>	
	  *   지표 목록조회
	  *  </p>
	  * @param : 
	  * @return : String
	  */
	@RequestMapping(value="/selectMetrixList.do")
    public ModelAndView selectMetrixList(@ModelAttribute ReqVO reqVo, ModelMap model) throws Exception {
		List<MetrixVO> list = ifrService.getMetrixInfo(reqVo);
		int listCnt = 0;
		
		if(list != null) listCnt = list.size();

        model.addAttribute(GridVar.gridView, list);
        model.addAttribute("totCnt", listCnt);
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        
        return modelAndView;
    }
	
	 /**
	  * @Method Name : selectAlarmGroupList
	  * @작성일 : 2023. 3. 29.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>	
	  *   지표 목록조회
	  *  </p>
	  * @param : 
	  * @return : String
	  */
	@RequestMapping(value="/selectAlarmGroupList.do")
   public ModelAndView selectAlarmGroupList(@ModelAttribute ReqVO reqVo, ModelMap model) throws Exception {
		List<AlarmGroupVO> list = ifrService.getAlamGroups(reqVo);
		int listCnt = 0;
		
		if(list != null) listCnt = list.size();

        model.addAttribute(GridVar.gridView, list);
        model.addAttribute("totCnt", listCnt);
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        
        return modelAndView;
   }
	
	/**
	  * @Method Name : selectAlarmConfigList
	  * @작성일 : 2023. 3. 29.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>	
	  *   감시설정 목록조회
	  *  </p>
	  * @param : 
	  * @return : String
	*/
  @RequestMapping(value="/selectAlarmConfigList.do")
  public ModelAndView selectAlarmConfigList(@ModelAttribute ReqVO reqVo, ModelMap model) throws Exception {
	  List<AlarmConfigVO> list = ifrService.getAlarmConfigs(reqVo);
	  int listCnt = 0;
	  
	  if(list != null) listCnt = list.size();
	
	  model.addAttribute(GridVar.gridView, list);
	  model.addAttribute("totCnt", listCnt);
	  ModelAndView modelAndView = new ModelAndView("jsonView", model);
	  
	  return modelAndView;
  }
  
  /**
	  * @Method Name : selectAlarmInstanceList
	  * @작성일 : 2023. 3. 30.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>	
	  *   알람-인스턴스 연동 목록조회
	  *  </p>
	  * @param : 
	  * @return : String
	*/
	@RequestMapping(value="/selectAlarmInstanceList.do")
	public ModelAndView selectAlarmInstanceList(@ModelAttribute ReqVO reqVo, ModelMap model) throws Exception {
		List<InstanceVO> list = ifrService.getInstances(reqVo);
		int listCnt = 0;
		
		if(list != null) listCnt = list.size();

        model.addAttribute(GridVar.gridView, list);
        model.addAttribute("totCnt", listCnt);
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        
        return modelAndView;
	}
	
	 /**
	  * @Method Name : selectUserGroupList
	  * @작성일 : 2023. 3. 30.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>	
	  *   사용자그룹 목록조회
	  *  </p>
	  * @param : 
	  * @return : String
	*/
	@RequestMapping(value="/selectUserGroupList.do")
	public ModelAndView selectUserGroupList(@ModelAttribute ReqVO reqVo, ModelMap model) throws Exception {
		List<UserGroupVO> list = ifrService.getUserGroups(reqVo);
		int listCnt = 0;
		
		if(list != null) listCnt = list.size();

        model.addAttribute(GridVar.gridView, list);
        model.addAttribute("totCnt", listCnt); 
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        
        return modelAndView;
	}
	
	/**
	  * @Method Name : selectAlarmUserGroupList
	  * @작성일 : 2023. 3. 29.
	  * @작성자 : bhs
	  * @Method 설명 :
	  *  <p>	
	  *   알람-사용자그룹 연동 목록조회
	  *  </p>
	  * @param : 
	  * @return : String
	*/
	 @RequestMapping(value="/selectAlarmUserGroupList.do")
	 public ModelAndView selectAlarmUserGroupList(@ModelAttribute ReqVO reqVo, ModelMap model) throws Exception {
		List<UserGroupVO> list = ifrService.getUserAlarmGroups(reqVo);
		int listCnt = 0;
		
		if(list != null) listCnt = list.size();

        model.addAttribute(GridVar.gridView, list);
        model.addAttribute("totCnt", listCnt);       
        ModelAndView modelAndView = new ModelAndView("jsonView", model);
        
        return modelAndView;
	 }
	 
}
