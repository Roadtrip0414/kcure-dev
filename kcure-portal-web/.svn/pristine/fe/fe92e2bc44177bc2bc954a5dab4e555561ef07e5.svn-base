package kcure.portal.cmn.exception;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;


/**
  * @Project : kcure-portal-web
  * @package_name : kcure.portal.cmn.exception
  * @FileName : KcureExceptionResolver.java
  * @since : 2023. 1. 11. 
  * @version 1.0
  * @author : 개발자 명
  * @프로그램 설명 :	K-CURE 포탈 exception 처리 ( ajax 호출시 json 형태로 값을 넘겨줌. )
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  </pre>
  */
public class KcureExceptionResolver extends SimpleMappingExceptionResolver {
	private static final Logger logger = LoggerFactory.getLogger(KcureExceptionResolver.class);
	
	@Override
	protected ModelAndView doResolveException(
			HttpServletRequest request, HttpServletResponse response, @Nullable Object handler, Exception ex) {
		// Expose ModelAndView for chosen error view.
		String viewName = determineViewName(ex, request);
		if (viewName != null) {
			// Apply HTTP status code for error views, if specified.
			// Only apply it if we're processing a top-level request.
			
            // Apply HTTP status code for error views, if specified.
            // Only apply it if we're processing a top-level request.
            Integer statusCode = determineStatusCode(request, viewName);
            if (statusCode != null) {
                applyStatusCodeIfPossible(request, response, statusCode);
            }
            System.out.println(ex.fillInStackTrace());
		    if (!(request.getHeader("AJAX") != null && request.getHeader("AJAX").equals("true"))) {
                return getModelAndView(viewName, ex, request);
	        }else {
	        	return getModelAndView("jsonView", ex, request);
				/*
				 * ModelAndView modelAndView = new ModelAndView();
				 * modelAndView.addObject("exception", "err");
				 * modelAndView.addObject("returnPage", viewName );
				 * modelAndView.setViewName("jsonView"); return modelAndView ;
				 */
	        }
		}
		else {
			return null;
		}
	}
	/*
	protected ModelAndView doResolveException(
			HttpServletRequest request, HttpServletResponse response, @Nullable Object handler, Exception ex) {

		// Expose ModelAndView for chosen error view.
		String viewName = determineViewName(ex, request);
		if (viewName != null) {
			// Apply HTTP status code for error views, if specified.
			// Only apply it if we're processing a top-level request.
			Integer statusCode = determineStatusCode(request, viewName);
			if (statusCode != null) {
				applyStatusCodeIfPossible(request, response, statusCode);
			}
			return getModelAndView(viewName, ex, request);
		}
		else {
			return null;
		}
	}
	*/


}
