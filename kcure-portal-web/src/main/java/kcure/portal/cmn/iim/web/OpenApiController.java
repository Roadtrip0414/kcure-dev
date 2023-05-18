package kcure.portal.cmn.iim.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kcure.portal.cmn.iim.service.OpenApiService;
import kcure.portal.cmn.iim.service.impl.ComOpenVO;
import kcure.portal.cmn.iim.service.impl.ReqVO;

@Controller
@RequestMapping("/portal/cmn/iim")
public class OpenApiController {

	@Autowired
	private OpenApiService openApiService;

	@RequestMapping(value="/viewOpenApi.do")
	 public String viewOpenApi(ModelMap model) throws Exception {
		return "kcure/portal/example/openApi/ViewOpenApi";
//		return "kcure/portal/cmn/iim/viewOpenApi";
	}

	@RequestMapping (value="/search.do")
	public String viewOpenApi(@RequestParam Map<String, Object> map,
			HttpServletRequest request, ModelMap model) throws Exception {
	  model.addAttribute("searchKeyword", map);
	  return "kcure/portal/example/openApi/ViewOpenApi";
	}

	@RequestMapping (value = "/viewOpenApiDetail.do")
	public String viewOpenApiDetail(@RequestParam Map<String, Object> map,
			HttpServletRequest request, ModelMap model) throws Exception {
	  model.addAttribute("detail", map);
	  return "kcure/portal/example/openApi/ViewOpenApiDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/selectComOpenList.do", method = RequestMethod.POST)
	public ModelAndView selectComOpenList(@ModelAttribute ReqVO reqVo, Model model) throws Exception {
		 ModelAndView modelAndView = new ModelAndView();
	     modelAndView.setViewName("jsonView");

	     try {

	    	 ComOpenVO data = openApiService.selectComOpenDataList(reqVo);

			 modelAndView.addObject("resultCode", "Y");
			 modelAndView.addObject("data", data);
			 modelAndView.addObject("message", "Success");

	     }catch(Exception e) {
			 modelAndView.addObject("resultCode", "N");
			 modelAndView.addObject("message", e.getMessage());
	     }

	     return modelAndView;
	}

}

// gony

